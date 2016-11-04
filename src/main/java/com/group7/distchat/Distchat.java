package com.group7.distchat;

import java.util.LinkedList;

public class Distchat extends Thread
{
    private LinkedList<Message> inQueue  = new LinkedList<Message>();
    private LinkedList<Message> outQueue = new LinkedList<Message>();
    private Server server = null;
    private int port = -1;
    private boolean exit = false;

    public Distchat(int port)
    {
        this.port = port;
    }
    public void run ()
    {
        server = new Server(port,inQueue, outQueue);
        //start the server thread
        server.start();
        while(!exit)
        {
            //pop messages off the inQueue
            //process inQueue message
            //generate response
            //push reponse to outQueue
        }

    }
    public static void main (String[] args)
    {
        Distchat app = new Distchat(Integer.parseInt(args[0]));
        app.start();
    }
}
