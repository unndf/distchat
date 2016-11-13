package com.group7.distchat;

import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.io.*;

public class Message
{
    /** 
    * static message types M_XYZ = #
    * These are the only valid message types
    * When implementing a new message type make sure to:
    *      Add a static message type identifier
    *      Add a Pattern that recognizes the message format (remember to use regex flag dotall)
    *      Add a method is*MessageType* that uses the pattern to determine if it is a valid message of that type
    *      Add any methods used to extract data from the string
    */
    public static final String ENCODING = "UTF-8";
    
    public static final int M_INVALID = -1;
    public static final int M_MSG_SEND = 1000;
    public static final int M_REGISTER = 1001;
    public static final int M_OPEN = 1002;
    public static final int M_ECHO = 1003;
    public static final int M_ERROR = 1004;
    public static final int M_CONNECT = 1005;
    public static final int M_POLL = 1006;
    public static final int M_PACKAGE = 1007;
    public static final int M_ACCEPT = 1008;
    public static final int M_INFO = 1009;
    public static final int M_REPLICA_CONNECT = 1010;
   
    //static patterns matching the messages
    public static Pattern msgSendPattern;
    public static Pattern registerPattern;
    public static Pattern openPattern;
    public static Pattern echoPattern;
    public static Pattern errorPattern;
    public static Pattern connectPattern;
    public static Pattern pollPattern;
    public static Pattern packagePattern;
    public static Pattern acceptPattern;
    public static Pattern infoPattern;
    public static Pattern replicaConnectPattern;

    public int id = M_INVALID;
    //message type
    private int type = M_INVALID;
    private String messageString = "";
    
    //init patterns
    static
    {
        msgSendPattern = Pattern.compile("^message-send\\r?\\n([0-9]+)\\r?\\n([0-9]+)\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        registerPattern = Pattern.compile("^register\\r?\\n([\\w-]+)\\r?\\n",Pattern.DOTALL);
        openPattern = Pattern.compile("^open\\r?\\n([\\d]+)\\r?\\n",Pattern.DOTALL);
        echoPattern = Pattern.compile("^echo\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        errorPattern = Pattern.compile("^error\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        //TODO: create regexes for these patterns
        connectPattern = Pattern.compile("^connect\\r?\\n",Pattern.DOTALL);
        pollPattern = Pattern.compile("^poll\\r?\\n(info|users|room|)",Pattern.DOTALL);
        packagePattern = Pattern.compile("^error\\r?\\n(.+)\\n",Pattern.DOTALL);
        acceptPattern = Pattern.compile("^error\\r?\\n(.+)\\n",Pattern.DOTALL);
        infoPattern = Pattern.compile("^error\\r?\\n(.+)\\n",Pattern.DOTALL);
        replicaConnectPattern = Pattern.compile("^replica connect\\r?\\n",Pattern.DOTALL);
    }

    public Message ()
    {
    }
    /**
     * @Deprecated Use the static getMessage instead of the constructor
     * @see getMessage()
     */
    public Message (String messageString)
    {
        this.messageString = messageString;
        this.type = getMessageType(messageString);
    }
    /**
     * Method for determining whether a byteBuffer contains a valid message as defined by the patterns
     * @param ByteBuffer buff just a  ByteBuffer
     * @return boolean if the buffer contains a message*/
    public static boolean isMessage (ByteBuffer buff)
    {
        ByteBuffer buffCopy = buff.duplicate();
        buffCopy.position(0);
        byte[] buffBytes = new byte[buffCopy.limit()];
        buffCopy.get(buffBytes);
        String messageString = new String (buffBytes,Charset.forName(ENCODING));
        return ( isMessageSend(messageString) 
                || isRegister(messageString)
                || isOpen(messageString)
                || isEcho(messageString)
                || isError(messageString)
                || isConnect(messageString)
                || isPoll(messageString)
                || isPackage(messageString)
                || isAccept(messageString)
                || isInfo(messageString)
                || isReplicaConnect(messageString)
                );
        //use regex for now
    }
    /**
     * Method for creating retriving a message from a byteBuffer
     * This should always be used in conjunction with isMessage()
     * In the future this should probably thow an exception if it isnt a messgae
     * @param ByteBuffer buff This is the byteBuffer that we will be retruving the message from
     * @return Message This is the Message contained within the buffer
     */
    public static Message getMessage (ByteBuffer buff)
    {
        //duplicate
        ByteBuffer buffCopy = ByteBuffer.allocate(buff.capacity());
        //buffCopy.flip();
     

        //Not the cleaniest way to do things
        //requires at least n calls to isMessage for a message of n length
        //could be fixed if the protocol was changed to include the length of the message in the first few bytes...
        //TODO
        int len = 0;
        buff.position(0);
        while(!isMessage(buffCopy)){
            len++;
            buffCopy.put(buff.get());
        }
        
        byte[] buffBytes = new byte[len];
        buffCopy.flip();
        buffCopy.get(buffBytes);
        String messageString = new String (buffBytes,Charset.forName(ENCODING));

        String retMessageString = ""; //message string for the message obj we're creating
        Message retMessage = null;

        if (isMessage(buffCopy))
        {
            if(isMessageSend(messageString)){
                Matcher m = msgSendPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isRegister(messageString)){
                Matcher m = registerPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isOpen(messageString)){
                Matcher m = openPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            else if (isEcho(messageString)){
                Matcher m = echoPattern.matcher(messageString);
                m.find();
                retMessageString = m.group(0);
            }
            retMessage = new Message(retMessageString);
            int byteLen = 0;
            try{
                byteLen = retMessageString.getBytes(ENCODING).length; //inefficient...
            } catch(UnsupportedEncodingException e){
                e.printStackTrace();
            }
            
            //Take the string off the buffer
            buff.clear();
        }   
        return retMessage;
    }
    /**
     * Gets the message type as defined by our constants
     * @param String message The message we want the type of
     * @return int type of message
     */
    public static int getMessageType (String message)
    {
        if      (isMessageSend(message)) return M_MSG_SEND;
        else if (isRegister(message))    return M_REGISTER;
        else if (isOpen(message))        return M_OPEN;
        else if (isEcho(message))        return M_ECHO;
        else                             return M_INVALID; //not a valid message
    }
    /**
     * Method to determine if the Mesage is of type messageSend
     * @param String message
     * @return boolean
     */
    public static boolean isMessageSend (String message)
    {
        Matcher m = msgSendPattern.matcher(message);
        return m.matches();
    }
    /**Method to determine if the message is of type register
     * @param String message
     * @return boolean
     */
    public static boolean isRegister (String message)
    {
        Matcher m = registerPattern.matcher(message);
        return m.matches();
    }
    /**
     * Method to determine if the message is of type open
     * @param String message
     * @return boolean
     */
    public static boolean isOpen (String message)
    {
        Matcher m = openPattern.matcher(message);
        return m.matches();
    }
    /** Method to determine if the message is of type echo
     * @param String message
     * @return boolean
     */
    public static boolean isEcho(String message)
    {
        Matcher m = echoPattern.matcher(message);
        return m.find();
    }
    public static boolean isError(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public static boolean isConnect(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }   
    public static boolean isPoll(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public static boolean isPackage(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public static boolean isAccept(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public static boolean isInfo(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public static boolean isReplicaConnect(String message)
    {
        Matcher m = errorPattern.matcher(message);
        return m.find();
    }
    public int getMessageType ()
    {
        return this.type;
    }
    /**
     * Convert the Message object to it's equivelent String as defined by the constant ENCODING
     * @return String
     */
    public String toString()
    {
        return messageString;
    }
}
