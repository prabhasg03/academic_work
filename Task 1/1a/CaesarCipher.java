
/*
Task 1(a): Write a Java program to perform encryption and decryption using the algorithm Ceaser Cipher.
Aim: To write a Program on encryption and decryption using ceaser cipher. 
*/
//Program:
import java.util.Scanner;

public class CaesarCipher {
    public static final String ALPHABET = "abcdefghijklmnopqrstuvwxyz";
    public static String encrypt(String plainText, int shiftKey) {
        plainText = plainText.toLowerCase();
        String cipherText = "";
        for (int i = 0; i < plainText.length(); i++) {
            int charPosition = ALPHABET.indexOf(plainText.charAt(i));
            int keyVal = (shiftKey + charPosition) % 26;
            char replaceVal = ALPHABET.charAt(keyVal);
            cipherText += replaceVal;
        }
        return cipherText;
    }

    public static String decrypt(String cipherText, int shiftKey) {
        cipherText = cipherText.toLowerCase();
        String plainText = "";
        for (int i = 0; i < cipherText.length(); i++) {
            int charPosition = ALPHABET.indexOf(cipherText.charAt(i));
            int keyVal = (charPosition - shiftKey) % 26;
            if (keyVal < 0) {
                keyVal = ALPHABET.length() + keyVal;
            }
            char replaceVal = ALPHABET.charAt(keyVal);
            plainText += replaceVal;
        }
        return plainText;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the String for Encryption: ");
        String message = new String();
        message = sc.next();
        System.out.println("The Encrypted Message is: " + (encrypt(message, 4)));
        // System.out.println(encrypt(message, 4));
        System.out.println("The Decrypted Message is: " + (decrypt(encrypt(message, 4), 4)));
        sc.close();
    }
}
/*
 * E:\Study\4-1\CNS Lab\Task 1\1a> javac CaesarCipher.java
 * E:\Study\4-1\CNS Lab\Task 1\1a> java CaesarCipher
 * Enter the String for Encryption: HELLO
 * The Encrypted Message is: lipps
 * The Decrypted Message is: hello
 */