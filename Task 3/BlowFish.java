/*
Task 3: Write a C/JAVA Program to implement the Blowfish algorithm logic
Aim:To write a Program to implement Blowfish algorithm logic.
*/
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.CipherOutputStream;
import javax.crypto.KeyGenerator;
import java.util.Base64;

public class BlowFish {
    public static void main(String[] args) throws Exception {
        KeyGenerator keyGenerator = KeyGenerator.getInstance("Blowfish");
        keyGenerator.init(128);
        Key secretKey = keyGenerator.generateKey();
        Cipher cipherOut = Cipher.getInstance("Blowfish/CFB/NoPadding");
        cipherOut.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] iv = cipherOut.getIV();
        if (iv != null) {
            System.out.println("Initialization Vector of the Cipher: " + Base64.getEncoder().encodeToString(iv));
        }
        FileInputStream fin = new FileInputStream("inputFile.txt");
        byte[] inputBytes = fin.readAllBytes();
        String inputText = new String(inputBytes);
        System.out.println("Content of Input File:");
        System.out.println(inputText);
        try (FileOutputStream fout = new FileOutputStream("outputFile.txt");
                CipherOutputStream cout = new CipherOutputStream(fout, cipherOut)) {
            cout.write(inputBytes);
        }
        FileInputStream encryptedFin = new FileInputStream("outputFile.txt");
        byte[] encryptedBytes = encryptedFin.readAllBytes();
        String encryptedText = Base64.getEncoder().encodeToString(encryptedBytes);
        System.out.println("Content of Encrypted Output File (Base64 Encoded):");
        System.out.println(encryptedText);
        System.out.println("File encryption completed successfully.");
        fin.close();
        encryptedFin.close();
    }
}
/*
 * E:\Study\4-1\CNS Lab\Task 3> javac BlowFish.java
 * E:\Study\4-1\CNS Lab\Task 3> java BlowFish
 * Initialization Vector of the Cipher: ZydyT2IgV4E=
 * Content of Input File:
 * Hello My Name is Prabhas
 * Iam from IV AIMLA
 * Content of Encrypted Output File (Base64 Encoded):
 * Ft564bvDyQiPHqSXLi6HFs1Esg4eMyv7MFMXdxjcNoZlvUABpA9mi0Nh0Q==
 * File encryption completed successfully.
 */