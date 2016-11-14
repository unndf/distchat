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

public class Distchat extends Thread
{
    private LinkedList<Message> inQueue  = new LinkedList<Message>();
    private LinkedList<Message> outQueue = new LinkedList<Message>();
    private ArrayList<String> roomList = new ArrayList<String>();
    private Map<Integer,String> userList = new HashMap<Integer,String>();
    private Logger appLog = Logger.getLogger("com.group7.distchat.Distchat");
    private Server server = null;
    private int port = -1;
    private boolean exit = false;
    
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
        } catch (IOException e){
            e.printStackTrace();
        }
    }
    public void run ()
    {
        //Temporary TODO: Let users add the rooms (somehow....)
        roomList.add("Some-room-name");
        roomList.add("Another-room");
        roomList.add("Demoroom");
        roomList.add("Bestroom");

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
                } catch (InterruptedException e)
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

                    synchronized (outQueue) {
                        outQueue.addLast(response);
                        outQueue.notify();
                    }
                }
            }
        }
        public Message getResponse (Message message)
        {
            //if type login
            //  parse username from message
            //  associate username with socket id
            //  send ok
            if (Message.isLogin(message.toString()))
            {
                String username = Message.loginGetUsername(message.toString());
                userList.put(message.id, username);
                Message response = null;
                String responseString = "Welcome, " + username + "\n";
                ByteBuffer buff = ByteBuffer.wrap(responseString.getBytes());
                return Message.getMessage(buff);
            }
            //if type open
            if (Message.isOpen(message.toString()))
            {
                String roomName = Message.openGetRoomName(message.toString());
                String messageString = "";
                //The room the client is attempting to open exists
                if (roomList.contains(roomName))
                {
                    messageString = "ok\nOpen " + roomName + "Successful\n";
                    Message response = Message.getMessage(messageString);
                System.out.println("WE MADE IT");
                    return response;
                }
                else
                {
                    messageString = "error\nRoom Doesn't Exist\n";
                    Message response = Message.getMessage(messageString);
                System.out.println("BAD");
                    return response;
                }
            }
            //if type echo
            return message; //echo all messages back
            //if type open
            //if type info
            //if type get message
        }
    }
}
