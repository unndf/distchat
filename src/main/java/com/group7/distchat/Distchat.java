package com.group7.distchat;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.FileHandler;
import java.util.logging.SimpleFormatter;
import java.util.LinkedList;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.io.*;
import java.nio.ByteBuffer;
import java.sql.SQLException;

public class Distchat extends Thread
{
    private LinkedList<Message> inQueue  = new LinkedList<Message>();
    private LinkedList<Message> outQueue = new LinkedList<Message>();
    //private Map<Integer,String> userList = new HashMap<Integer,String>();
    private Map<Integer,String> userOpenList = new HashMap<Integer,String>(); //Map of clients to rooms open
    private Map<Integer,Integer> userProgress = new HashMap<Integer,Integer>(); //Map of clients to the message id they've read up to
    private Logger appLog = Logger.getLogger("com.group7.distchat.Distchat");
    private Server server = null;
    private int port = -1;
    private boolean exit = false;
    private DBHandler dbhandler = null;
    
    public static final String ENCODING = "UTF-8";
    public static final String LOGFILE = "server.log";


    /** Distchat - A Distributed Chat Application
     * This constructor creates a new instance of dischat and binds it to the given port
     * It then spawns a server thread and its own QueueWorker to take jobs off the queue and proccess them
     * It is possible to have more than one QueueWorker (eventually), otherwise a single worker will handle all requests in a non-blocking fashion
     * @param int port
     * @see Server
     * @see Message
     */
    public Distchat(int port)
    {
        this.port = port;
        try {
            FileHandler fh = new FileHandler (LOGFILE);
            fh.setFormatter(new SimpleFormatter());
            appLog.addHandler(fh);
            dbhandler = new DBHandler();
        } catch (IOException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
    }
    public void run ()
    {

        server = new Server(port,inQueue, outQueue);
        //start the server thread
        server.start();

        appLog.log(Level.INFO, "App QueueWorker started");
        //singleWorker
        QueueWorker worker = new QueueWorker();
        worker.start();
        while(!exit)
        {
            //nothing lol
        }

    }
    public static void main (String[] args)
    {
        Distchat app = new Distchat(Integer.parseInt(args[0]));
        app.start();
    }
    public class QueueWorker extends Thread
    {
        public QueueWorker ()
        {
            //stub
        }
        public void run()
        {
            while (true)
            {
                try
                {
                    synchronized (inQueue){
                        inQueue.wait();
                    }
                } 
                catch (InterruptedException e)
                {
                    e.printStackTrace();
                }
                while(!inQueue.isEmpty())
                {
                    //pop messages off the inQueue
                    Message request = null;
                    synchronized (inQueue) {
                        request = inQueue.pop();
                        appLog.log(Level.INFO, "Application recieved message:\n" + "********************\n" + request + "\n*******************\n");
                    }
                    //get a response
                    Message response = getResponse(request);
                    response.id = request.id; //just in case...
                    synchronized (outQueue) {
                        outQueue.addLast(response);
                        outQueue.notify();
                    }
                    appLog.log(Level.INFO, "Application queued response message\n" + "********************\n" + response.toString() + "\n********************\n" );
                }
            }
        }
        public Message getResponse (Message message)
        {
        	/*
        	 * We need reponses for:
        	 * Login
        	 * Quit
        	 * echo
        	 */
        	
        	// QUESTION: Do we need Message response = null?
        	
            //if type login
            //  parse username from message
            //  associate username with socket id
            //  send ok
        	// Login Response
            // TODO
            if (Message.isLogin(message.toString()))
            {
                String username = Message.loginGetUsername(message.toString());
                String responseString = "";
                boolean userExists = false;

                //I dont know if it's worth catching the SQLExceptions. If we have DB problems the entire thing should fail anyways
                //TODO?
                try
                {
                    userExists = dbhandler.userExists(username);
                }
                catch (SQLException e)
                {
                    e.printStackTrace();
                }
                if (userExists)
                {
                    responseString = "ok\nmsg Welcome, " + username + "\n";
                }
                else 
                {
                    responseString = "error\nUser " + username +" Does not Exist\n";
                }
                Message response = null;
                ByteBuffer buff = ByteBuffer.wrap(responseString.getBytes());
                return Message.getMessage(buff);
            } //end Message.isLogin()

            //if type open
            if (Message.isOpen(message.toString()))
            {
                String roomName = Message.openGetRoomName(message.toString());
                String messageString = "";
                boolean roomExists = false;
                try 
                {
                    roomExists = dbhandler.roomExists(roomName);
                }
                catch (SQLException e)
                {
                    e.printStackTrace();
                }
                //The room the client is attempting to open exists
                if (roomExists)
                {
                    messageString = "ok\nOpen " + roomName + " Successful\n";
                    Message response = Message.getMessage(messageString);
                    response.id = message.id;

                    //TODO:**********IMPORTANT************************
                    //TODO:TEMPORARY STOP GAP. WE SHOULD USE SOME SORT OF TOKEN SYSTEM
                    userOpenList.put(response.id,roomName);
                    //TODO:******************************************
                    return response;
                }
                else
                {
                    messageString = "error\nRoom Doesn't Exist\n";
                    Message response = Message.getMessage(messageString);
                    response.id = message.id;
                    return response;
                }
            }
            if (Message.isMessageSend(message.toString()))
            {
                String username = userOpenList.get(message.id);
                String messageString = message.toString();
                int chatId = -1;
                String content = Message.messageSendGetContent(messageString);
                String room = Message.messageSendGetRoom(messageString);
                String nick = Message.messageSendGetNick(messageString);
                content = "<" + nick + "> " + content;

                try 
                {
                    chatId = dbhandler.getChatId(room);
                }
                catch (SQLException e)
                {
                    e.printStackTrace();
                }
                try
                {
                    dbhandler.addMessage(chatId,content);
                }
                catch (SQLException e)
                {
                    e.printStackTrace();
                }
                //TODO: send something back instead of echo?
            }
            if (Message.isPoll(message.toString()))
            {
                String messageString = message.toString();
                ArrayList<String> messageList = null;
                String messagePackage = "";
                int id = message.id;
                int chatId = -1;
                int mId = 0; //basecase, we havent polled yet so start polling from the first message

                String room = Message.pollGetRoom(messageString);
                //get chatId from the room name
                try
                {
                    chatId = dbhandler.getChatId(room);
                }
                catch (SQLException e)
                {
                    e.printStackTrace();
                    //TODO
                }
                
                if (userProgress.containsKey(id))
                {
                    mId = userProgress.get(id);
                }
                //attempt to retrive messages from that room from the message id after the one defined in our map
                try
                {
                    messageList = dbhandler.getMessagesAfter(chatId,mId);
                }
                catch (SQLException e)
                {
                    e.printStackTrace();
                }
                if (messageList.size()==0) //the are no new messages
                {
                    String responseString = "ok\nNo new Messages\n";
                    Message response = Message.getMessage(responseString);
                    response.id = message.id;
                    return response;
                }
                else //there are some new messages in the room
                {
                    String responseString = "package\n";
                    for (int i=0;i<messageList.size();i++)
                        responseString = responseString + messageList.get(i);
                    
                    responseString = responseString + "\n";
                    Message response = Message.getMessage(responseString);
                    response.id = message.id;
                    return response;

                }
            }
            // Quit/Logout Response
            if (Message.isQuit(message.toString()))
            {
            	/*TODO: rewrite
                 * if (roomList.containsKey(message.id))
            	{
            		//String username = userList.get(message.id);
                	//userList.remove(message.id);
                	Message response = null;
                	String responseString = "Have a nice day,\n";
                	ByteBuffer buff = ByteBuffer.wrap(responseString.getBytes());
                	return Message.getMessage(buff);
            	}
            	else
            	{
            		System.err.println("ERROR: User ID: " + message.id + " does not exist.");
            		Message response = null;
            		String responseString = "error user ID does not exist\n";
            		ByteBuffer buff = ByteBuffer.wrap(responseString.getBytes());
            		return Message.getMessage(buff);
            	}*/ 
                //TODO: Echo for now
                return message;
            	
            }
            // Echo
            if (Message.isEcho(message.toString()))
            {
            	/*String username = userList.get(message.id);
            	Message response = null;
            	String responseString = "echo " + username + ": " + message.toString() + "\n";
            	ByteBuffer buff = ByteBuffer.wrap(responseString.getBytes());
            	return Message.getMessage(buff);*/
                return message;
            }
            //Base case just echo....
            //probably should ret null eventually
            return message;
            // No type match
            // Return error
            /*
            else 
            {
            	Message response = null;
            	String responseString = "error message type does not match\n";
            	ByteBuffer buff = ByteBuffer.wrap(responseString.getBytes());
            	return Message.getMessage(buff);
            }*/
        }
    }
}
