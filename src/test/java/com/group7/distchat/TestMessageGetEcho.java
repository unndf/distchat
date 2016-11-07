package com.group7.distchat;

import org.junit.Test;
import static org.junit.Assert.*;
import java.nio.*;

public class TestMessageGetEcho
{
    @Test
    public void isEchoString()
    {
        //ECHO regex works
        String msgString = "echo\nhello world\n"; //echo message
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        assertTrue(Message.isEcho(msgString)); //the string *IS* an echo message
    }

    @Test
    public void isMessage()
    {
        String msgString = "echo\nhello world\n"; //echo message
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        assertTrue(Message.isMessage(buff));
    }

    @Test 
    public void getMessage()
    {
        //put echo message into a byteBuffer
        String msgString = "echo\nhello world\n"; //echo message
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        
        //Buffer has a message
        assertTrue(Message.isMessage(buff));
        
        Message m = Message.getMessage(buff);

        //The message we get is not null
        assertNotNull(m);

        //The message we get is of type ECHO
        assertEquals(m.getMessageType(), Message.M_ECHO);

        //SUCCESS!!
    }
}
