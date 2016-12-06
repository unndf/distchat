package com.group7.distchat;

import java.io.*;
import java.nio.*;
import java.net.*;
import java.nio.channels.*;
import java.net.UnknownHostException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Client extends Thread{

    //STATIC VARS
    public static Pattern ipWithPortPattern;
    public static Pattern openCommandPattern;
    public static Pattern registerCommandPattern;
    public static Pattern connectCommandPattern;
    public static Pattern leaveCommandPattern;
    public static Pattern loginCommandPattern;
    public static Pattern pollCommandPattern;
    public static Pattern hostsPattern;
    static 
    {
        ipWithPortPattern = Pattern.compile("(\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d):(\\d?\\d?\\d?\\d?\\d)"); //NOTE: ONLY IPV4 IS SUPPORTED
        openCommandPattern = Pattern.compile("!open\\s+([\\w-]+)");
        connectCommandPattern = Pattern.compile("!connect");
        registerCommandPattern = Pattern.compile("!register\\s+([\\w-]+)");
        leaveCommandPattern = Pattern.compile("!leave\\s+([\\w-]+)");
        loginCommandPattern = Pattern.compile("!login\\s+([\\w-]+)");
        pollCommandPattern = Pattern.compile("!poll");
        hostsPattern = Pattern.compile("([\\w\\.]+):(\\d+)",Pattern.MULTILINE);
    }

    public DatagramChannel datagramChannel = null;
    public String host = "";
    public String hostFile = "";
    public int port = -1;
    public Object timeoutLock = new Object();
    public PollWorker worker = null;
    public String currentRoom = "";
    public String username = "";
    public String response = "";
    public int token = -1;
    public LinkedList<String> outputsToDisplay = new LinkedList<>(); //list of outputs that need to be displayed
    public HashMap<String,PollWorker> pollWorkerList = new HashMap<>(); //list of workers currently active
    private Socket socket = null;
    private BufferedReader receiveFromServer = null;
    private BufferedWriter sendToServer = null;
    private boolean userLoggedIn = false;
    ArrayList<String> serverList = new ArrayList<>();
    
    public static final int MAX_MESSAGE_SIZE = 8196;
    public static final int TIMEOUT = 5000; //5 second timeouts
    public Client (String hostFile)
    {
        this.hostFile = hostFile;
    }
    /**Attempt to "connect" to a server in our list of known_hosts.
     * Uses fall-through, it will try to connect to the first one in the list then if it can't it will try the next
     * @param void Nothing
     * @return boolean: We were able to connect to one of the hosts in the list
     */
    public boolean connect()
    {
        try
        {
            BufferedReader freader = new BufferedReader(new FileReader(hostFile));
            String hostString = freader.readLine();
            while (hostString != null)
            {
                System.out.println("Attemping to connect to " + hostString + "...");
                Matcher m = hostsPattern.matcher(hostString);
                String message = "connect\n";
                ByteBuffer buff = null;
                ByteBuffer inBuff = ByteBuffer.allocate(2048);
                
                datagramChannel = DatagramChannel.open();
                if(m.find())
                {
                    String hostAddr = m.group(1);
                    String hostPort = m.group(2);

                    InetSocketAddress addr = new InetSocketAddress(hostAddr
                                                                   ,Integer.parseInt(hostPort));
                    
                    try
                    {
                        //send connect message to host:port
                        buff = ByteBuffer.wrap(message.getBytes());
                        datagramChannel.send(buff,addr);
                    
                        receiveWithTimeout();

                        //set our current host:port to the one we connected to
                        this.host = hostAddr;
                        this.port = Integer.parseInt(hostPort);
                        return true; //found a host, dont care about the contents of the packet
                    } 
                    catch (SocketTimeoutException e)
                    {
                        System.out.println("Couldnt not connect to " + hostString);
                    }
                    catch (UnresolvedAddressException e)
                    {
                        System.out.println("Couldnt not connect to " + hostString);
                    }
                }   
                hostString = freader.readLine();
            }
            datagramChannel = null;
            return false; //could not find a host
        }
        catch (FileNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return false; //could not find a host
    }
    public boolean login(String input)
    {
        try
        {
            if (connect())
            {
                Matcher m = loginCommandPattern.matcher(input);
                m.find();

                String username = m.group(1);
                String messageString = "login\n" + username + "\n";
                ByteBuffer buff = ByteBuffer.wrap(messageString.getBytes());
                InetSocketAddress addr = new InetSocketAddress (this.host,this.port);

                datagramChannel.send(buff,addr);

                //wait for ack
                try
                {
                    byte[] ack = receiveWithTimeout();
                    String response = new String(ack);
                    if (Message.isOk(response))
                    {
                        this.token = Message.okGetToken(response);
                        this.username = username;
                        return true;
                    }
                    else 
                        return false;
                }
                catch (SocketTimeoutException e)
                {
                    //ack was lost
                    this.username = "";
                    this.token = -1;
                    System.out.println("ACK timeout");
                    return false;
                }
            }
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
        return false;
    }
    public boolean open(String input)
    {
        try
        {
            Matcher m = openCommandPattern.matcher(input);
            m.find();

            String roomName = m.group(1);
            String messageString = "open\n" + roomName + "\n" + this.token + "\n";
            
            ByteBuffer buff = ByteBuffer.wrap(messageString.getBytes());
            InetSocketAddress addr = new InetSocketAddress (this.host,this.port);
            datagramChannel.send(buff,addr);
            
            //wait for ack
            try
            {
                byte[] ack = receiveWithTimeout();
                String response = new String(ack);
                if (Message.isOk(response))
                {
                    this.currentRoom = roomName;
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (SocketTimeoutException e)
            {
                //ack was lost
                System.out.println("ACK timeout");
                return false;
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return false;
    }
    public boolean messageSend (String input)
    {
        try
        {
            String messageString = "message-send\n" + currentRoom + "\n" + username + "\n" + this.token + "\n" + input + "\n";
            
            ByteBuffer buff = ByteBuffer.wrap(messageString.getBytes());
            InetSocketAddress addr = new InetSocketAddress (this.host,this.port);
            datagramChannel.send(buff,addr);
            
            //wait for ack
            try
            {
                byte[] ack = receiveWithTimeout();
                String response = new String(ack);
                if (Message.isOk(response))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (SocketTimeoutException e)
            {
                //ack was lost
                System.out.println("ACK timeout");
                return false;
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        return false;
    }
    public byte[] receiveWithTimeout() throws SocketTimeoutException,IOException
    {
        //create a datagram packet
        DatagramPacket packet = new DatagramPacket(new byte[2048],2048);
        
        //get the underlying socket
        DatagramSocket sock = datagramChannel.socket();

        //set the socket timeout
        sock.setSoTimeout(TIMEOUT);
        
        //receive the packet
        sock.receive(packet);
  

        //return the byte[]
        return packet.getData();
    }
    /** Detects if the user input is an openCommand
     * @param command
     * @return boolean
     */
    public static boolean isOpenCommand (String command)
    {
        Matcher m = openCommandPattern.matcher(command);
        return m.find();
    }

    /** Detects if the command is a connect command
     * @param command
     * @return boolean
     */
    public static boolean isConnectCommand (String command)
    {
        Matcher m = connectCommandPattern.matcher(command);
        return m.find();
    }

    /** Detects if the command is a register command
     * @param command
     * @return boolean
     */
    public static boolean isRegisterCommand (String command)
    {
        Matcher m = registerCommandPattern.matcher(command);
        return m.find();
    }

    /** Detects if the command is a login command
     * @param command
     * @return boolean
     */
    public static boolean isLoginCommand (String command)
    {
        Matcher m = loginCommandPattern.matcher(command);
        return m.find();
    }
    public static boolean isPollCommand (String command)
    {
        Matcher m = pollCommandPattern.matcher(command);
        return m.find();
    }
    public void sendMessage(String input)        
    {
        if (isConnectCommand(input))
        {
            if (connect())
            {
                System.out.println("Successfully Connected!");
            }
           else
            {
                System.out.println("Could not connect to the network\nPlease check your connection settings");
                System.exit(0);
            }
        }
        else if (isLoginCommand(input) && (datagramChannel != null))
        {
            if (login(input))
            {
                System.out.println("login successful");
            }
            else 
            {
                System.out.println("login unsuccessful");
            }
        }
        else if (isOpenCommand(input) && (datagramChannel != null) && loggedIn())
        {
            startWorker();
            //open
            if (open(input))
            {
                System.out.println("room opened successfully");
                //start poll worker
            }
            else
            {
                System.out.println("could not open room");
            }
        }
        else if (roomOpened())
        {
            //not a command, send a message-send
            if (messageSend(input))
            {
                System.out.println("Message Sent!");
            }
            else
            {
                System.out.println("Message could not be sent");
            }
        }
        else 
        {
            //not a command, and no room opened
        }
    }
    /** Is the user currently logged in?
     * Naive implementation
     */
    public boolean loggedIn()
    {
        return (!username.equals("")) && (this.token != -1);
    }
    /** Has the user opened a room?
     * Naive implmentation
     */
    public boolean roomOpened()
    {
        return !currentRoom.equals("");
    }
    public class PollWorker extends Thread
    {
        public Client client  = null;
        public void run()
        {
            while (true)
            {

                try
                {
                    String messageString = "poll\nmessages\n"+ token + "\n";
                    ByteBuffer buff = ByteBuffer.wrap(messageString.getBytes());
                    InetSocketAddress addr = new InetSocketAddress (host,port);

                    datagramChannel.send(buff,addr);

                    //wait for ack
                    try
                    {
                        byte[] ack = receiveWithTimeout();
                        String response = new String(ack);

                        System.out.println(response);
                        //System.out.println(Message.packageGetMessages(response));
                    }
                    catch (SocketTimeoutException e)
                    {
                        //do nothing
                    }
                }
                catch(IOException e)
                {
                    e.printStackTrace();
                }
                synchronized (this)
                {
                    try
                    {
                        wait(2000); //timeout of two seconds for poll()
                    }
                    catch (InterruptedException e)
                    {
                    }
                }
            }
        }
    }
    public void run()
    {
        //try to connect to a server in the list of knownhosts
        //fall through the list
        //if (!join room)
        //  start(pollWorker room)
        //if (!leave room)
        //  kill(pollWorker room)
    }
    public void startWorker()
    {
        this.worker = new PollWorker();
        worker.start();
    }
    public static void main(String[]args)
    {
        Client client = new Client("known_hosts");
        //start workers
        //while true
        //  get input
        //  validate
        //  if valid command
        //      queue approiate message
        //
        
        //start workers TODO
        
        //get input from stdin
        BufferedReader console = new BufferedReader(new InputStreamReader(System.in));
        String input = "";
        while (true)
        {
            try
            {
                input = console.readLine();
                client.sendMessage(input);
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
}
