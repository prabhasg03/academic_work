
/*
Implement DES-2 and DES-3 using Java cryptography package.
 */
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

public class DES2 {

	private static Cipher encryptCipher;
	private static Cipher decryptCipher;

	public static void main(String[] args) {
		try {
			KeyGenerator keygenerator = KeyGenerator.getInstance("DES");
			SecretKey secretKey = keygenerator.generateKey();
			encryptCipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
			encryptCipher.init(Cipher.ENCRYPT_MODE, secretKey);
			byte[] encryptedData = encryptData("Classified Information!");
			decryptCipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
			decryptCipher.init(Cipher.DECRYPT_MODE, secretKey);
			decryptData(encryptedData);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Encrypt Data
	 * 
	 * @param data
	 * @return
	 * @throws IllegalBlockSizeException
	 * @throws BadPaddingException
	 */
	private static byte[] encryptData(String data) throws IllegalBlockSizeException, BadPaddingException {
		System.out.println("Data Before Encryption :" + data);
		byte[] dataToEncrypt = data.getBytes();
		byte[] encryptedData = encryptCipher.doFinal(dataToEncrypt);
		System.out.println("Encryted Data: " + encryptedData);
		return encryptedData;
	}

	/**
	 * Decrypt Data
	 * 
	 * @param data
	 * @throws IllegalBlockSizeException
	 * @throws BadPaddingException
	 */
	private static void decryptData(byte[] data) throws IllegalBlockSizeException, BadPaddingException {
		byte[] textDecrypted = decryptCipher.doFinal(data);
		System.out.println("Decryted Data: " + new String(textDecrypted));
	}
}
/*
 * Output:-
 * javac DES2.java
 * java DES2
 * Data Before Encryption :Classified Information!
 * Encryted Data: [B@1963006a
 * Decryted Data: Classified Information!
 */