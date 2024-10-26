
/*
Task 7
Write a Java program to implement RSA algorithm.
Program:
*/
import java.math.BigInteger;
import java.util.Random;
import java.io.*;
public class RSA {
    private BigInteger p;
    private BigInteger q;
    private BigInteger N;
    private BigInteger phi;
    private BigInteger e;
    private BigInteger d;
    private int bitlength = 1024;
    private int blocksize = 256;
    // blocksize in byte
    private Random r;
    public RSA() {
        r = new Random();
        p = BigInteger.probablePrime(bitlength, r);
        q = BigInteger.probablePrime(bitlength, r);
        N = p.multiply(q);
        phi = p.subtract(BigInteger.ONE).multiply(q.subtract(BigInteger.ONE));
        e = BigInteger.probablePrime(bitlength / 2, r);
        while (phi.gcd(e).compareTo(BigInteger.ONE) > 0 && e.compareTo(phi) < 0) {

            e.add(BigInteger.ONE);
        }
        d = e.modInverse(phi);
    }
    public RSA(BigInteger e, BigInteger d, BigInteger N) {
        this.e = e;
        this.d = d;
        this.N = N;

    }
    public static void main(String[] args) throws IOException {
        RSA rsa = new RSA();
        DataInputStream in = new DataInputStream(System.in);
        String teststring;
        System.out.print("Enter the plain text:");
        teststring = in.readLine();
        System.out.println("Encrypting String: " + teststring);
        System.out.println("String in Bytes: " + bytesToString(teststring.getBytes()));
        // encrypt
        byte[] encrypted = rsa.encrypt(teststring.getBytes());
        System.out.println("Encrypted String in Bytes: " + bytesToString(encrypted));
        // decrypt
        byte[] decrypted = rsa.decrypt(encrypted);
        System.out.println("Decrypted String in Bytes: " + bytesToString(decrypted));
        System.out.println("Decrypted String: " + new String(decrypted));
    }

    private static String bytesToString(byte[] encrypted) {
        String test = "";
        for (byte b : encrypted) {
            test += Byte.toString(b);
        }
        return test;
    }

    // Encrypt message
    public byte[] encrypt(byte[] message) {
        return (new BigInteger(message)).modPow(e, N).toByteArray();
    }
    // Decrypt message

    public byte[] decrypt(byte[] message) {

        return (new BigInteger(message)).modPow(d, N).toByteArray();
    }
}
/*
Output:
javac RSA.java
java RSA      
Enter the plain text:AIML
Encrypting String: AIML
String in Bytes: 65737776
Encrypted String in Bytes: 26109-104348-17-5812-99104-12584-12-102-378232-22-997066-29-1030110-468-11585-13603-119-106633912682-116109-1121115-4639-2232-5242-10551469231543-561095672-112-57126-2953-21-57-61897088-92-42-39108261-39-65837046-22-7444-80-74-125987-383794359115-6461-4042-4592-1023322135060-63600-8049112-117718939-57-694-376-6339-10767-38612395125119109-54-11-714085-106-67117-60-68-82-988-7221-911-66-122-6-42-3129398745-90-4295-179014-12458-1081148035-10867-10824-106-7892-9-53-59113-12101-106121124-1269152-102-125-50-75108-1208-88-37-41-11872123-354681-4045-9-9217-78-123-94-4-50-7108-5332741-8942-121-100-25-68-28-125121-53-76-3922-1051098360-711034-86119-52-120-58-39-813846122793
Decrypted String in Bytes: 65737776
Decrypted String: AIML
*/