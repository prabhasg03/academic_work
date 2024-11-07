/*
Task 12
Write a program in java, which performs a digital signature on a given text.  
*/
import java.security.*;

public class Digital {

    public static void main(String[] args) {
        try {
            // Generating key pair
            KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
            keyPairGenerator.initialize(2048);
            KeyPair keyPair = keyPairGenerator.generateKeyPair();

            // Creating a Signature object
            Signature signature = Signature.getInstance("SHA256withRSA");

            // Initializing the signature
            signature.initSign(keyPair.getPrivate());

            // Data to be signed
            String data = "Hello, this is the text to be signed.";

            // Update the data to be signed
            signature.update(data.getBytes());

            // Generate the digital signature
            byte[] digitalSignature = signature.sign();

            // Print the digital signature
            System.out.println("Digital Signature: " + new String(digitalSignature));

            // Verification
            Signature verificationSignature = Signature.getInstance("SHA256withRSA");
            verificationSignature.initVerify(keyPair.getPublic());
            verificationSignature.update(data.getBytes());

            // Verify the digital signature
            boolean isVerified = verificationSignature.verify(digitalSignature);
            System.out.println("Signature verified: " + isVerified);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
/*
Output:
javac Digital.java
java Digital
Digital Signature: 8,?????L?7>C???h?U[?4??q68m?I?>?yS^;?fxB???~R??R?Bg??8?`$?
{?G??a
u?/??N2NwC???,?*???s??E[?)????a?6c}?`%???=??(??K?"??z:2y???-
??;??Z? ?????f??%??1?*?R??V?
5?"S1*@jZ
2,?+?Of|=??ly??B?R???i????O?u?Zr[y?
Signature verified: true 
*/