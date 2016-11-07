package com.group7.distchat;

import org.junit.Test;
import static org.junit.Assert.*;
import java.nio.*;

public class TestMessageGetMessageSend
{
    @Test
    public void isMessageSendString()
    {
        //ECHO regex works
        String msgString = "message-send\n10\n11\nThis is a message\n"; //message send message
        assertTrue(Message.isMessageSend(msgString)); 
    }

    @Test
    public void isMessage()
    {
        String msgString = "message-send\n10\n11\nThis is a message\n"; //message send message
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        assertTrue(Message.isMessage(buff));
    }

    @Test 
    public void getMessage()
    {
        //put echo message into a byteBuffer
        String msgString = "message-send\n10\n11\nThis is a message\n"; //message send message
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        
        //Buffer has a message
        assertTrue(Message.isMessage(buff));
        
        Message m = Message.getMessage(buff);

        //The message we get is not null
        assertNotNull(m);

        //The message we get is of type ECHO
        assertEquals(m.getMessageType(), Message.M_MSG_SEND);

        //SUCCESS!!
    }
}
