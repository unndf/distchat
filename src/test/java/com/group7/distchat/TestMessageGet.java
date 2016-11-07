package com.group7.distchat;

import org.junit.Test;
import static org.junit.Assert.*;
import java.nio.*;

public class TestMessageGet
{
    //String msgString = "echo\nhello world\n"; //echo message
    String msgString = "echo\nhello world\n"; //echo message
    ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
    
    @Test
    public void itWerks()
    {
        assertTrue( true );
    }

    @Test
    public void isEchoString()
    {
        assertTrue(Message.isEcho(msgString)); //the string *IS* an echo message
    }
    @Test
    public void isMessage()
    {
        assertTrue(Message.isMessage(buff));
    }

    @Test 
    public void getMessage()
    {
        buff.position(buff.limit());
        assertTrue(Message.isMessage(buff));
        Message m = Message.getMessage(buff);
        assertNotNull (m);
    }
}
