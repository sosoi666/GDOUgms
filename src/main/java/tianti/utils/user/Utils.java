package tianti.utils.user;

import sun.misc.BASE64Encoder;

public class Utils {
    public static String encodeBase64(String str) {
        sun.misc.BASE64Encoder base64Encode = new BASE64Encoder();
        return base64Encode.encode(str.getBytes());
    }

}
