
/*
Task 4: Write a C/JAVA Program to implement the AES algorithm logic.
Aim: To implement AES Algorithm logic.
*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import java.security.SecureRandom;

public class AES {
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("Enter Text to be Encrypted: ");
		String plainText = br.readLine();
		SecretKey secKey = getSecretEncryptionKey();
		byte[] cipherText = encryptText(plainText, secKey);
		String decryptedText = decryptText(cipherText, secKey);
		System.out.println("Original Text: " + plainText);
		System.out.println("AES Key (Hex Form): " + bytesToHex(secKey.getEncoded()));
		System.out.println("Encrypted Text (Hex Form): " + bytesToHex(cipherText));
		System.out.println("Decrypted Text: " + decryptedText);
	}

	public static SecretKey getSecretEncryptionKey() throws Exception {
		KeyGenerator generator = KeyGenerator.getInstance("AES");
		generator.init(128, new SecureRandom()); // AES key size is 128 bits
		SecretKey secKey = generator.generateKey();
		return secKey;
	}

	public static byte[] encryptText(String plainText, SecretKey secKey) throws Exception {
		Cipher aesCipher = Cipher.getInstance("AES");
		aesCipher.init(Cipher.ENCRYPT_MODE, secKey);
		byte[] byteCipherText = aesCipher.doFinal(plainText.getBytes());
		return byteCipherText;
	}

	public static String decryptText(byte[] byteCipherText, SecretKey secKey) throws Exception {
		Cipher aesCipher = Cipher.getInstance("AES");
		aesCipher.init(Cipher.DECRYPT_MODE, secKey);
		byte[] bytePlainText = aesCipher.doFinal(byteCipherText);
		return new String(bytePlainText);
	}

	private static String bytesToHex(byte[] bytes) {
		StringBuilder sb = new StringBuilder();
		for (byte b : bytes) {
			sb.append(String.format("%02X", b)); // Format each byte as a hex string
		}
		return sb.toString();
	}
}
/*
Output:-
E:\Study\4-1\CNS Lab\Task 4> javac AES.java
E:\Study\4-1\CNS Lab\Task 4> java AES
Enter Text to be Encrypted: prabhas
Original Text: prabhas
AES Key (Hex Form): B9A1AA453D70C26A5B784B530CDBD1C3
Encrypted Text (Hex Form): D104F52879E0C0CA0309EC0EC8E08E69
Decrypted Text: prabhas
*/