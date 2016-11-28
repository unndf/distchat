package com.group7.distchat;

import java.net.Socket;
import java.util.Random;
import java.net.ServerSocket;
import java.net.*;
import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.util.Iterator;
import java.util.Set;
import java.util.HashMap;
import java.util.LinkedList;
import java.nio.charset.Charset;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.FileHandler;
import java.util.logging.SimpleFormatter;

public class Server extends Thread{
    //constants
    public static final int MAX_MESSAGE_SIZE = 2048;
    public static final int MAX_BUFFER_SIZE = MAX_MESSAGE_SIZE * 2;
    public static final int SELECT_TIMEOUT = 500; //milliseconds
    public static final String ENCODING = "UTF-8";
    public static final String LOGFILE = "server.log";

    private boolean exit = false;
    private int port = 0;
    private Logger serverLog = Logger.getLogger("com.group7.distchat.Server");
    private DatagramChannel datagramChannel = null;
    private LinkedList<Message> inQueue = null;
    private LinkedList<Message> outQueue = null;

    /**
     * This is the constructor to init a server object
     * @param int port This is the port number the serversocket will bind to
     * @param LinkedList<Message> inq This will be treated as a queue of message used for incoming messages (to application)
     * @param LinkedList<Message> outq This will be treated as a queue used for outgoing messages (to clients)
     * @return Nothing
     */
    Server(int port, LinkedList<Message> inq, LinkedList<Message> outq)
    {
        this.port = port;
        try {
            FileHandler fh = new FileHandler (LOGFILE);
            fh.setFormatter(new SimpleFormatter());
            serverLog.addHandler(fh);
        } catch (IOException e){
            e.printStackTrace();
        }
        //get a reference to the Message queues
        inQueue = inq;
        outQueue = outq;
    }
    /**
     * Run Method for the Server
     * A selector is opened and register for accepting
     * The operation of the Server is as follows
     * while (true)
     *  -Let QueueWorker(s) unload the outq
     *  -select()
     *  -forall (sockets with operation)
     *      -if (operation is read)
     *          -read or continue reading
     *          if (hasMessage)
     *              -add message to incoming queue
     */
    public void run ()
    {
        try
        {
            //open a datagram channel
            datagramChannel = DatagramChannel.open();

            //make the datagramChannel  non-blocking
            datagramChannel.configureBlocking(false);
            
            //get the address for our network adapter
            InetSocketAddress serverAddress = new InetSocketAddress(port);

            //bind to local address
            datagramChannel.bind(serverAddress);
            
            serverLog.log(Level.INFO, "Server started on: " + serverAddress);

            //open selector
            Selector selector = Selector.open();

            //register datagramChannel for reading and writing
            datagramChannel.register(selector,
                    SelectionKey.OP_READ, //we dont care about OP_WRITE, UDP send() will always succeed given there is enough buffer space
                    null //no attachments
                    );

            //start the OutqueueWorker
            OutqueueWorker outqueueWorker = new OutqueueWorker();
            outqueueWorker.start();

            while (!exit)
            {
                //select
                int numKeys = selector.select();

                //something went horribly wrong
                if (numKeys < 0)
                {
                    System.exit(1);
                }

                //Iterate through the set of readyKeys
                Set<SelectionKey> readyKeys = selector.selectedKeys();
                Iterator<SelectionKey> readyIter = readyKeys.iterator();
                while (readyIter.hasNext())
                {
                    SelectionKey key = readyIter.next();
                    //we have received a datagram
                    //read (receive() the datagram)
                    if (key.isReadable())
                    {
                        ByteBuffer buff = ByteBuffer.allocate(MAX_BUFFER_SIZE);
                        SocketAddress addr = datagramChannel.receive(buff);
                        
                        //we recieved a datagram!
                        if (addr != null)
                        {
                            serverLog.log(Level.INFO, "UDP Datagram received from: " + addr);
                            
                            if (Message.isMessage(buff))
                            {
                                Message message = Message.getMessage(buff);
                                
                                //set our return address
                                message.address = addr;
                                
                                //queue our message
                                synchronized(inQueue)
                                {
                                    inQueue.addLast(message); //put recieved message on the queue
                                    inQueue.notify(); //tell application we have a message
                                    serverLog.log(Level.INFO, "Message from " + addr + " queued. Application thread notify()");
                                }
                            }
                        }
                    } //key.isReadble()
                } //while(readyIter.hasNext())
            } //while(!exit)
            
        } 
        catch (IOException e) 
        {
            e.printStackTrace();
        }
    }
    /**
     * @Deprecated only used for testing
     * @see Distchat
     */
    public static void main (String[] args)
    {
        LinkedList<Message> inq = new LinkedList<>();
        LinkedList<Message> outq = new LinkedList<>();
        Server mainServ = new Server(Integer.parseInt(args[0]),inq,outq);
        mainServ.start();
    }
    public class OutqueueWorker extends Thread
    {
        public OutqueueWorker()
        {
            //stub
        }
        public void run()
        {
            while (true)
            {
                try
                {
                    synchronized(outQueue){
                        outQueue.wait(1000); //wait for messages to send
                    }
                } catch (InterruptedException e){
                    e.printStackTrace();//do nothing
                }
                //handles all the messages in the sendQueue
                //TODO: threadpool implementation
                //would only handle ONE message not the entire queue like the code below
                while (!outQueue.isEmpty())
                {
                    //echo every message back to the client
                    Message response = outQueue.pop();
                    SocketAddress addr = response.address;
                    ByteBuffer responseBuffer = response.buffer();
                    try
                    {
                        int bytesSent = datagramChannel.send(responseBuffer,addr);
                        
                        //no bytes sent, put response back on queue
                        if (bytesSent == 0) outQueue.addLast(response);
                    }
                    catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}
