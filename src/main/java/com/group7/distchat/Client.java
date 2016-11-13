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

public class Client {
    public static Pattern ipWithPortPattern;
    public static Pattern openCommandPattern;
    public static Pattern registerCommandPattern;
    public static Pattern connectCommandPattern;
    public static Pattern leaveCommandPattern;
    static 
    {
        ipWithPortPattern = Pattern.compile("(\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d):(\\d?\\d?\\d?\\d?\\d)"); //NOTE: ONLY IPV4 IS SUPPORTED
        openCommandPattern = Pattern.compile("!open\\s+([\\w-]+)");
        connectCommandPattern = Pattern.compile("!connect\\s+(\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d\\.\\d?\\d?\\d):(\\d?\\d?\\d?\\d)");
        registerCommandPattern = Pattern.compile("!register\\s+([\\w-]+)");
        leaveCommandPattern = Pattern.compile("!leave\\s+([\\w-]+)");
    }

    //Art is VERY important....
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
                                                                    
	private static String host = "";
	static int port = -1;
	public static void main(String[] args) throws IOException //lazt fix
    {
	    Socket socket = null;

        System.out.println(INIT_MESSAGE);

        //reader for user input stdin
        BufferedReader console = new BufferedReader( new InputStreamReader(System.in));
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
        while(true)
        {
            String input = console.readLine(); //get input from user
            if (isOpenCommand(input))
            {
                System.out.println("wow nice open");
            }
            else if (isConnectCommand(input))
            {
                System.out.println("wow nice connect");
            }
            else if (isRegisterCommand(input))
            {
                System.out.println("wow nice register");
            }
            else
            {
                System.out.println("Please enter a valid command");
            }
        }
	} // main
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
}
