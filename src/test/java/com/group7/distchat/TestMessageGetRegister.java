package com.group7.distchat;

import org.junit.Test;
import static org.junit.Assert.*;
import java.nio.*;

public class TestMessageGetRegister
{
    @Test
    public void isRegisterString()
    {
        //ECHO regex works
        String msgString = "register\nSomeNick\n";
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        assertTrue(Message.isRegister(msgString)); //the string *IS* an echo message
    }

    @Test
    public void isMessage()
    {
        String msgString = "register\nSomeNick\n";
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        assertTrue(Message.isMessage(buff));
    }

    @Test 
    public void getMessage()
    {
        String msgString = "register\nSomeNick\n";
        ByteBuffer buff = ByteBuffer.wrap(msgString.getBytes());
        
        //Buffer has a message
        assertTrue(Message.isMessage(buff));
        
        Message m = Message.getMessage(buff);

        //The message we get is not null
        assertNotNull(m);

        //The message we get is of type ECHO
        assertEquals(m.getMessageType(), Message.M_REGISTER);

        //SUCCESS!!
    }
}
