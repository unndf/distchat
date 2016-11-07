package com.group7.distchat;

import org.junit.Test;
import static org.junit.Assert.*;
import java.nio.*;

public class TestMessageGetOpen
{
    @Test
    public void isOpenString()
    {
        //ECHO regex works
        String msgString = "open\n1337\n"; //open message
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        assertTrue(Message.isOpen(msgString)); //the string *IS* an echo message
    }

    @Test
    public void isMessage()
    {
        String msgString = "open\n1337\n"; //open message
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        assertTrue(Message.isMessage(buff));
    }

    @Test 
    public void getMessage()
    {
        //put echo message into a byteBuffer
        String msgString = "open\n1337\n"; //open message
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        
        //Buffer has a message
        assertTrue(Message.isMessage(buff));
        
        Message m = Message.getMessage(buff);

        //The message we get is not null
        assertNotNull(m);

        //The message we get is of type OPEN
        assertEquals(m.getMessageType(), Message.M_OPEN);

        //SUCCESS!!
    }
}
