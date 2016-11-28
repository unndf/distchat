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
    static 
    {
        ipWithPortPattern = Pattern.compile("(\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d):(\\d?\\d?\\d?\\d?\\d)"); //NOTE: ONLY IPV4 IS SUPPORTED
        openCommandPattern = Pattern.compile("!open\\s+([\\w-]+)");
        connectCommandPattern = Pattern.compile("!connect\\s+(\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d):(\\d?\\d?\\d?\\d)");
        registerCommandPattern = Pattern.compile("!register\\s+([\\w-]+)");
        leaveCommandPattern = Pattern.compile("!leave\\s+([\\w-]+)");
        loginCommandPattern = Pattern.compile("!login\\s+([\\w-]+)");
        pollCommandPattern = Pattern.compile("!poll");
    }

    public DatagramChannel datagramChannel = null;
    public String host = "";
    public int port = -1;
    public String currentRoom = "";
    public String username = "";
    public String response = "";
    public LinkedList<String> outputsToDisplay = new LinkedList<>(); //list of outputs that need to be displayed
    public HashMap<String,PollWorker> pollWorkerList = new HashMap<>(); //list of workers currently active
    private Socket socket = null;
    private BufferedReader receiveFromServer = null;
    private BufferedWriter sendToServer = null;
    private boolean userLoggedIn = false;
    ArrayList<String> serverList = new ArrayList<>();
    
    public static final int MAX_MESSAGE_SIZE = 8196;
    public Client (String host, int port)
    {
        this.host = host;
        this.port = port;
        try
        {
            //open a new datagramChannel
            datagramChannel = DatagramChannel.open();
            InetSocketAddress addr = new InetSocketAddress(host,port);
            ByteBuffer message = ByteBuffer.wrap("echo\nwewlad\n".getBytes());
            datagramChannel.send(message,addr);

            ByteBuffer buff = ByteBuffer.allocate(2048);
            SocketAddress address = datagramChannel.receive(buff);
            Message m = Message.getMessage(buff);
            System.out.println("WE RECEIVED A MESSAGE:\n" + m.toString());
            
            message = ByteBuffer.wrap("echo\nwewlad\n".getBytes());
            datagramChannel.send(message,addr);
            address = datagramChannel.receive(buff);
            m = Message.getMessage(buff);
            System.out.println(m.toString()); 
            
            message = ByteBuffer.wrap("login\ndev\n".getBytes());
            datagramChannel.send(message,addr);
            address = datagramChannel.receive(buff);
            m = Message.getMessage(buff);
            System.out.println(m.toString());

            message = ByteBuffer.wrap("open\ndemo-room\n0\n".getBytes());
            datagramChannel.send(message,addr);
            address = datagramChannel.receive(buff);
            m = Message.getMessage(buff);
            System.out.println(m.toString());

            /*
            message = ByteBuffer.wrap("login\ndev\n".getBytes());
            datagramChannel.send(message,addr);
               address = datagramChannel.receive(buff);
            Message m = Message.getMessage(buff);
            System.out.println(m.toString());         
            message = ByteBuffer.wrap("login\ndev\n".getBytes());
            datagramChannel.send(message,addr);
            address = datagramChannel.receive(buff);
            Message m = Message.getMessage(buff);
            System.out.println(m.toString());
            address = datagramChannel.receive(buff);
            m = Message.getMessage(buff);
            System.out.println("WE RECEIVED A MESSAGE:\n" + m.toString());
            */
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        /*
        serverList.add("162.246.156.110");
    	serverList.add("localhost");
    	
        this.host = host;
        this.port = port;

        Iterator<String> iter = serverList.iterator();
        while(iter.hasNext()){
        	 //try to connect 
        	String serverHost = iter.next();
            try {

            	Socket socket = new Socket();
            	socket.connect(new InetSocketAddress(serverHost, port), 5000);
    			receiveFromServer = new BufferedReader(new InputStreamReader(socket.getInputStream()));
    	        sendToServer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
    	        break;
    		} catch (IOException e) {
    			System.out.println(String.format("Could not connect to server %s", serverHost));
    			System.out.println("Attempting to connect to next server...");
    		}
        }
        */
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
        try
        {
                if (isOpenCommand(input))
                {
                	if(userLoggedIn){
	                    Matcher m = openCommandPattern.matcher(input);
	                    m.find();
	                    String roomName = m.group(1);
                        String messageString = "open\n" + roomName +"\n";
	                    System.out.println("is NULL?");
	                    System.out.println(sendToServer==null);
                        sendToServer.write(messageString.toCharArray(),0,messageString.length());
	                    sendToServer.flush();
	
	                    char[] buff = new char[MAX_MESSAGE_SIZE];
	                    int bytesRecv = receiveFromServer.read(buff,0,MAX_MESSAGE_SIZE);
                        String response = new String(buff,0,bytesRecv);
	                    if (Message.isOk(response))
	                    {
	                        currentRoom = roomName;
                            this.response = "opening " + roomName;
	                    }
	                    else
	                    {
	                    	System.out.println("ROOM WAS NOT FOUND");
	                        this.response = "Room not found";
	                    }
                	}else{
                		this.response = "You must log in first";
                	}
                }
                else if (isConnectCommand(input))
                {
                    this.response = "wow nice connect";
                }
                else if (isRegisterCommand(input))
                {
                    this.response = "wow nice register";
                }
                else if (isLoginCommand(input))
                {
                    Matcher m = loginCommandPattern.matcher(input);
                    m.find();
                    String name = m.group(1);
                    String messageString = "login\n"+name+"\n";
                    sendToServer.write(messageString.toCharArray(),0,messageString.length());
                    sendToServer.flush();

                    char[] buff = new char[MAX_MESSAGE_SIZE];
                    int bytesRecv = receiveFromServer.read(buff,0,MAX_MESSAGE_SIZE);
                    String response = new String(buff,0,bytesRecv);

                    if (Message.isOk(response))
                    {
                        this.response = "Login Success";
                        username = name;
                        userLoggedIn = true;
                    }
                    else 
                    {
                        this.response = "Login unsuccessful";
                    }
                }
                else if (isPollCommand(input) && roomOpened())
                {
                    String messageString = "poll\nmessages\n"+currentRoom+"\n";
                    sendToServer.write(messageString.toCharArray(),0,messageString.length());
                    sendToServer.flush();

                    char[] buff = new char[MAX_MESSAGE_SIZE];
                    int bytesRecv = receiveFromServer.read(buff,0,MAX_MESSAGE_SIZE);
                    String response = new String(buff,0,bytesRecv);

                    if (Message.isPackage(response))
                    {
                        this.response = "new messages: \n" + response.toString() + "\n";
                    }
                    else 
                    {
                        this.response = "No new Messages";
                    }

                }
                else
                {
                    //if the user is logged in and has a room opened then send a message-send
                    //echo otherwise
                    if(loggedIn() && roomOpened())
                    {
                        String messageString = "message-send\n" + currentRoom + "\n" + username + "\n" + input + "\n";
                        sendToServer.write(messageString.toCharArray(),0,messageString.length());
                        sendToServer.flush();
                        
                        char[] buff = new char[MAX_MESSAGE_SIZE];
                        int bytesRecv = receiveFromServer.read(buff,0,MAX_MESSAGE_SIZE);
                        String response = new String(buff,0,bytesRecv);
                        System.out.println("Message from server: ");
                        System.out.println(response);
                        this.response = response;
                    }
                    else
                    {
                        String messageString = "echo\n" + input + "\n";
                        sendToServer.write(messageString.toCharArray(),0,messageString.length());
                        sendToServer.flush();
                        
                        char[] buff = new char[MAX_MESSAGE_SIZE];
                        int bytesRecv = receiveFromServer.read(buff,0,MAX_MESSAGE_SIZE);
                        String response = new String(buff,0,bytesRecv);
                        System.out.println("Message from server: ");
                        System.out.println(response);
                        this.response = response;
                    }
                }//end else
            } //end try
            catch (IOException e)
            {
                e.printStackTrace(); //TODO: We should actually handle it....
            }
    }
    /** Is the user currently logged in?
     * Naive implementation
     */
    public boolean loggedIn()
    {
        return !username.equals("");
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
        public void run()
        {
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
    public static void main(String[]args)
    {
        Client c = new Client("localhost",9191);
        //done!
    }
}
