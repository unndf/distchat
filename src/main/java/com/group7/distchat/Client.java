package com.group7.distchat;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.*;
import java.net.UnknownHostException;
import java.net.Socket;
import java.util.ArrayList;
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
    static 
    {
        ipWithPortPattern = Pattern.compile("(\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d):(\\d?\\d?\\d?\\d?\\d)"); //NOTE: ONLY IPV4 IS SUPPORTED
        openCommandPattern = Pattern.compile("!open\\s+([\\w-]+)");
        connectCommandPattern = Pattern.compile("!connect\\s+(\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d):(\\d?\\d?\\d?\\d)");
        registerCommandPattern = Pattern.compile("!register\\s+([\\w-]+)");
        leaveCommandPattern = Pattern.compile("!leave\\s+([\\w-]+)");
        loginCommandPattern = Pattern.compile("!login\\s+([\\w-]+)");
    }

    public String host = "";
    public int port = -1;
    public String currentRoom = "";
    public String username = "";
    private Socket socket = null;
    private BufferedReader receiveFromServer = null;
    private BufferedWriter sendToServer = null;

    public static final int MAX_MESSAGE_SIZE = 8196;
    public Client (String host, int port) throws IOException 
    {
        this.host = host;
        this.port = port;

        //try to connect  
        socket = new Socket(host, port);
        receiveFromServer = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        sendToServer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
    }
    
    
    
    //Art is VERY important....
    /*
    public static final String INIT_MESSAGE =
 "\n\n\n\n"+
 "/$$$$$$$ /$$$$$$ /$$$$$$ /$$$$$$$$/$$$$$$ /$$   /$$ /$$$$$$ /$$$$$$$$\n"+
 "| $$__  $|_  $$_//$$__  $|__  $$__/$$__  $| $$  | $$/$$__  $|__  $$__/\n"+
 "| $$  \\ $$ | $$ | $$  \\__/  | $$ | $$  \\__| $$  | $| $$  \\ $$  | $$\n"+   
 "| $$  | $$ | $$ |  $$$$$$   | $$ | $$     | $$$$$$$| $$$$$$$$  | $$\n"+   
 "| $$  | $$ | $$  \\____  $$  | $$ | $$     | $$__  $| $$__  $$  | $$\n"+   
 "| $$  | $$ | $$  /$$  \\ $$  | $$ | $$    $| $$  | $| $$  | $$  | $$\n"+   
 "| $$$$$$$//$$$$$|  $$$$$$/  | $$ |  $$$$$$| $$  | $| $$  | $$  | $$\n"+   
 "|_______/|______/\\______/   |__/  \\______/|__/  |__|__/  |__/  |__/\n" +
 "\nType \"help\" for a list of commands\nFor more info on the commands use \"help <command>\"\n\n";
*/
    /*
public void run() throws IOException //lazt fix
    {
	    /*Socket socket = null;
        String host = "";
        String currentRoom = "";
        String username = "";
        int port = -1;

        System.out.println(INIT_MESSAGE);

        //reader for user input stdin
        BufferedReader console = new BufferedReader( new InputStreamReader(System.in));
	    BufferedReader receiveFromServer = null;
        BufferedWriter sendToServer = null;
        //begin the inital connect to a server
        System.out.println("Please connect to a Server (ipaddress:port)");
        String ip = "";
        ip = console.readLine();
        Matcher matcher = ipWithPortPattern.matcher(ip);
        while (!matcher.find())
        {
            System.out.println("please enter a valid host");
            ip = console.readLine();
            matcher = ipWithPortPattern.matcher(ip);
        }
        host = matcher.group(1);
        port = Integer.parseInt(matcher.group(2));
        System.out.println("Attempting Connect on " + host + " on port " + port + "...");
        try 
        {
			socket = new Socket(host, port);

        }
        catch (IOException e) //Something wrong with IO
        {
            System.out.println("Failure");
            e.printStackTrace(); //do nothing....
        }
        
        System.out.println("Success!");
        //While true
        //get input from user
        //validate input
        //if valid message
        //  queue for sending
        //  wait for interrupts from workers
            String input = console.readLine(); //get input from user

	} // run*/
    public static boolean isOpenCommand (String command)
    {
        Matcher m = openCommandPattern.matcher(command);
        return m.find();
    }
    public static boolean isConnectCommand (String command)
    {
        Matcher m = connectCommandPattern.matcher(command);
        return m.find();
    }
    public static boolean isRegisterCommand (String command)
    {
        Matcher m = registerCommandPattern.matcher(command);
        return m.find();
    }
    public static boolean isLoginCommand (String command)
    {
        Matcher m = loginCommandPattern.matcher(command);
        return m.find();
    }
    public class NetworkReader extends Thread
    {
        public void run()
        {
        }
    }
    public class NetworkWriter extends Thread
    {
        public void run()
        {
        }
    }
    public void sendMessage(String input)        
    {
        try
            {
                if (isOpenCommand(input))
                {
                    Matcher m = openCommandPattern.matcher(input);
                    m.find();
                    String roomName = m.group(1);
                    String messageString = "open\n" + roomName +"\n";
                    sendToServer.write(messageString.toCharArray(),0,messageString.length());
                    sendToServer.flush();

                    char[] buff = new char[MAX_MESSAGE_SIZE];
                    receiveFromServer.read(buff,0,MAX_MESSAGE_SIZE);
                    String response = new String(buff);
                    if (Message.isOk(response))
                    {
                        currentRoom = roomName;
                    }
                    else
                    {
                        System.out.println("Room not found");
                    }
                }
                else if (isConnectCommand(input))
                {
                    System.out.println("wow nice connect");
                }
                else if (isRegisterCommand(input))
                {
                    System.out.println("wow nice register");
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
                    receiveFromServer.read(buff,0,MAX_MESSAGE_SIZE);
                    String response = new String(buff);

                    if (Message.isOk(response))
                    {
                        System.out.println("Login Success");
                        username = name;
                    }
                    else 
                    {
                        System.out.println("Login unsuccessful");
                    }
                }
                else
                {
                    String messageString = "echo\n" + input + "\n";
                    sendToServer.write(messageString.toCharArray(),0,messageString.length());
                    sendToServer.flush();
                    
                    char[] buff = new char[MAX_MESSAGE_SIZE];
                    receiveFromServer.read(buff,0,MAX_MESSAGE_SIZE);
                    String response = new String(buff);
                    System.out.println("Message from server: ");
                    System.out.println(response);
                }
            }
            catch (IOException e)
            {
                e.printStackTrace(); //TODO: We should actually handle it....
            }
    }
}
