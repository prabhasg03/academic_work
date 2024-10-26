/*
Task 8
Implement the Diffie-Hellman Key Exchange mechanism
*/
import java.io.*;
import java.math.BigInteger;

public class DiffieHellmanExchange {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("Enter prime number: ");
        BigInteger p = new BigInteger(br.readLine());
        System.out.print("Enter primitive root of " + p + ": ");
        BigInteger g = new BigInteger(br.readLine());
        System.out.print("Enter value for x less than " + p + ": ");
        BigInteger x = new BigInteger(br.readLine());
        BigInteger R1 = g.modPow(x, p);
        System.out.println("R1=" + R1);
        System.out.print("Enter value for y less than " + p + ": ");
        BigInteger y = new BigInteger(br.readLine());
        BigInteger R2 = g.modPow(y, p);
        System.out.println("R2=" + R2);
        BigInteger k1 = R2.modPow(x, p);
        System.out.println("Key1 calculated :" + k1);
        BigInteger k2 = R1.modPow(y, p);
        System.out.println("Key2 calculated :" + k2);
        System.out.println("Deffie Hellman secret key Encryption has Taken");
    }
}
/*
Output:
PS E:\Study\4-1\CNS Lab\Task 8> javac DiffieHellmanExchange.java
PS E:\Study\4-1\CNS Lab\Task 8> java DiffieHellmanExchange      
Enter prime number: 23
Enter primitive root of 23: 5
Enter value for x less than 23: 6
R1=8
Enter value for y less than 23: 15
R2=19
Key1 calculated :2
Key2 calculated :2
Deffie Hellman secret key Encryption has Taken
*/