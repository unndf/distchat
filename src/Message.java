import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.nio.ByteBuffer;

public class Message
{
    //static message identifers MS_XYZ = #
    public static final int MS_SEND = 1000;
    public static final int MS_REGISTER = 1000;
    
    public Message ()
    {
    }
    public static boolean isMessage (byte[] buff)
    {
        //use regex for now
        return false;
    }
    public static Message getMessage (ByteBuffer buff)
    {
        return null;
    }
    public static int getMessageType ()
    {
        return 0;
    }
}
