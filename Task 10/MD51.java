/*
TASK 10:
Calculate the message digest of a text using the MD5 algorithm in JAVA.
Program: 
*/
import java.security.*;

public class MD51 {
    public static void main(String[] a) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            System.out.println("Message digest object info: ");
            System.out.println("   Algorithm = " + md.getAlgorithm());
            // System.out.println(" Provider = " +md.getProvider());
            System.out.print("   ToString = " + md.toString());
            String input = "";
            md.update(input.getBytes());
            byte[] output = md.digest();
            System.out.println("MD5(\"" + input + "\") = " + bytesToHex(output));
            input = "abc";
            md.update(input.getBytes());
            output = md.digest();
            System.out.println("MD5(\"" + input + "\") = " + bytesToHex(output));
            input = "abcdefghijklmnopqrstuvwxyz";
            md.update(input.getBytes());
            output = md.digest();
            System.out.println("MD5(\"" + input + "\") = " + bytesToHex(output));
        } catch (Exception e) {
            System.out.println("Exception: " + e);
        }
    }

    public static String bytesToHex(byte[] b) {
        char hexDigit[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
        StringBuffer buf = new StringBuffer();
        for (int j = 0; j < b.length; j++) {
            buf.append(hexDigit[(b[j] >> 4) & 0x0f]);
            buf.append(hexDigit[b[j] & 0x0f]);
        }
        return buf.toString();
    }
}
/*
Output:
PS E:\Study\4-1\CNS Lab\Task 9> javac MD51.java
PS E:\Study\4-1\CNS Lab\Task 9> java MD51      
Message digest object info: 
   Algorithm = MD5
   ToString = MD5 Message Digest from SUN, <initialized>
MD5("") = D41D8CD98F00B204E9800998ECF8427E
MD5("abc") = 900150983CD24FB0D6963F7D28E17F72
MD5("abcdefghijklmnopqrstuvwxyz") = C3FCD3D76192E4007DFB496CCA67E13B
*/