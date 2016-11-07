package com.group7.distchat;

import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.io.*;

public class Message
{
    /* 
    * static message types M_XYZ = #
    * These are the only valid message types
    * When implementing a new message type make sure to:
    *      Add a static message type identifier
    *      Add a Pattern that recognizes the message format (remember to use regex flag dotall)
    *      Add a method is*MessageType* that uses the pattern to determine if it is a valid message of that type
    *      Add any methods used to extract data from the string
    */
    public static final String ENCODING = "UTF-8";
    
    public static final int M_MSG_SEND = 1000;
    public static final int M_REGISTER = 1001;
    public static final int M_OPEN = 1002;
    public static final int M_ECHO = 1003;
   
    //static patterns matching the messages
    public static Pattern msgSendPattern;
    public static Pattern registerPattern;
    public static Pattern openPattern;
    public static Pattern echoPattern;

    public int id = -1;
    //message type
    private int type = -1;
    private String messageString = "";
    
    //init patterns
    static
    {
        msgSendPattern = Pattern.compile("^message-send\\r?\\n([0-9]+)\\r?\\n([0-9]+)\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
        registerPattern = Pattern.compile("^register\\r?\\n([\\w-]+)\\r?\\n",Pattern.DOTALL);
        openPattern = Pattern.compile("^open\\r?\\n([\\d]+)\\r?\\n",Pattern.DOTALL);
        echoPattern = Pattern.compile("^echo\\r?\\n(.+)\\r?\\n",Pattern.DOTALL);
    }

    public Message ()
    {
    }
    public Message (String messageString)
    {
        this.messageString = messageString;
        this.type = getMessageType(messageString);
    }
    public static boolean isMessage (ByteBuffer buff)
    {
        ByteBuffer buffCopy = buff.duplicate();
        byte[] buffBytes = new byte[buff.limit()];
        buffCopy.get(buffBytes);
        String messageString = new String (buffBytes,Charset.forName(ENCODING));

        return ( isMessageSend(messageString) 
                || isRegister(messageString)
                || isOpen(messageString)
                || isEcho(messageString)
                );
        //use regex for now
    }
    
    public static Message getMessage (ByteBuffer buff)
    {
        ByteBuffer buffCopy = buff.duplicate();
        
        byte[] buffBytes = new byte[buffCopy.limit()];
        buffCopy.get(buffBytes);
        String messageString = new String (buffBytes,Charset.forName(ENCODING));

        String retMessageString = ""; //message string for the message obj we're creating
        Message retMessage = null;

        if (isMessage(buff))
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
            buffCopy.position(byteLen-1);
            buff.compact();
        }   
        return retMessage;
    }
    public static int getMessageType (String message)
    {
        if      (isMessageSend(message)) return M_MSG_SEND;
        else if (isRegister(message))    return M_REGISTER;
        else if (isOpen(message))        return M_OPEN;
        else if (isEcho(message))        return M_ECHO;
        else                             return -1; //not a valid message
    }
    public static boolean isMessageSend (String message)
    {
        Matcher m = msgSendPattern.matcher(message);
        return m.matches();
    }

    public static boolean isRegister (String message)
    {
        Matcher m = registerPattern.matcher(message);
        return m.matches();
    }
    public static boolean isOpen (String message)
    {
        Matcher m = openPattern.matcher(message);
        return m.matches();
    }
    public static boolean isEcho(String message)
    {
        Matcher m = echoPattern.matcher(message);
        return m.matches();
    }
    public int getMessageType ()
    {
        return this.type;
    }
    public String toString()
    {
        return messageString;
    }
}
