
/*
Task 5
Write the RC4 logic in Java.
 */
import java.io.*;

public class RC4 {
	public static void main(String args[]) throws IOException {
		int temp = 0;
		String ptext;
		String key;
		int s[] = new int[256];
		int k[] = new int[256];
		DataInputStream in = new DataInputStream(System.in);
		System.out.print("ENTER PLAIN TEXT: ");
		ptext = in.readLine();
		System.out.print("ENTER KEY TEXT: ");
		key = in.readLine();
		char ptextc[] = ptext.toCharArray();
		char keyc[] = key.toCharArray();
		int cipher[] = new int[ptext.length()];
		int decrypt[] = new int[ptext.length()];
		int ptexti[] = new int[ptext.length()];
		int keyi[] = new int[key.length()];
		for (int i = 0; i < ptext.length(); i++) {
			ptexti[i] = (int) ptextc[i];
		}
		for (int i = 0; i < key.length(); i++) {
			keyi[i] = (int) keyc[i];
		}
		for (int i = 0; i < 255; i++) {
			s[i] = i;
			k[i] = keyi[i % key.length()];
		}
		int j = 0;
		for (int i = 0; i < 255; i++) {
			j = (j + s[i] + k[i]) % 256;
			temp = s[i];
			s[i] = s[j];
			s[j] = temp;
		}
		int i = 0;
		j = 0;
		int z = 0;
		for (int l = 0; l < ptext.length(); l++) {
			i = (l + 1) % 256;
			j = (j + s[i]) % 256;
			temp = s[i];
			s[i] = s[j];
			s[j] = temp;
			z = s[(s[i] + s[j]) % 256];
			cipher[l] = z ^ ptexti[l];
			decrypt[l] = z ^ cipher[l];
		}
		System.out.print("ENCRYPTED: ");
		display(cipher);
		System.out.print("\nDECRYPTED: ");
		display(decrypt);
	}

	static void display(int disp[]) {
		char convert[] = new char[disp.length];
		for (int l = 0; l < disp.length; l++) {
			convert[l] = (char) disp[l];
			System.out.print(convert[l]);
		}
	}
}
/*
 * Output:
 * javac RC4.java
 * java RC4
 * ENTER PLAIN TEXT: 11001100
 * ENTER KEY TEXT: 01101100
 * ENCRYPTED: ìÑ▲9 #?j
 * DECRYPTED: 11001100
 */