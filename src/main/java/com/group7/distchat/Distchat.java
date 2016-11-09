package com.group7.distchat;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.FileHandler;
import java.util.logging.SimpleFormatter;
import java.util.LinkedList;
import java.io.*;

public class Distchat extends Thread
{
    private LinkedList<Message> inQueue  = new LinkedList<Message>();
    private LinkedList<Message> outQueue = new LinkedList<Message>();
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
        server = new Server(port,inQueue, outQueue);
        //start the server thread
        server.start();

        appLog.log(Level.INFO, "App QueueWorker started");
        //singleWorker
        QueueWorker worker = new QueueWorker();
        worker.start();
        while(!exit)
        {
            //nothing
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
            return message; //echo all messages back
        }
    }
}
