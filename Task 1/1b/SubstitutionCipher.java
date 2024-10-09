
/*
Task 1(b): Write a Java program to perform encryption and decryption using the algorithm
Substitution Cipher.
Aim:To write a Java Program using substitution cipher.
*/
import java.io.*;
import java.util.*;

public class SubstitutionCipher {
    static Scanner sc = new Scanner(System.in);
    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

    public static void main(String[] args) throws IOException {
        String encrypt = encrypt();
        String decrypt = decrypt(encrypt);
        System.out.println("The encrypted data is: " + encrypt);
        System.out.println("The decrypted data is: " + decrypt);
    }

    public static String encrypt() throws IOException {
        String encrypt = "";
        String a = "abcdefghijklmnopqrstuvwxyz";
        String b = "zyxwvutsrqponmlkjihgfedcba";
        System.out.print("Enter any string: ");
        String str = br.readLine();
        char c;
        for (int i = 0; i < str.length(); i++) {
            c = str.charAt(i);
            int j = a.indexOf(c);
            encrypt = encrypt + b.charAt(j);
        }
        return encrypt;
    }

    public static String decrypt(String encrypt) {
        String a = "abcdefghijklmnopqrstuvwxyz";
        String b = "zyxwvutsrqponmlkjihgfedcba";
        String decrypt = "";
        char c;
        for (int i = 0; i < encrypt.length(); i++) {
            c = encrypt.charAt(i);
            int j = a.indexOf(c);
            decrypt = decrypt + b.charAt(j);
        }
        return decrypt;
    }
}
/*
 * Output:-
 * E:\Study\4-1\CNS Lab\Task 1\1b> javac SubstitutionCipher.java
 * E:\Study\4-1\CNS Lab\Task 1\1b> java SubstitutionCipher
 * Enter any string: shankar
 * The encrypted data is: hszmpzi
 * The decrypted data is: shankar
 */