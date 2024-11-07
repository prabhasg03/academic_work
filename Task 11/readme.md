## TASK 11
Explore the java classes related to Digital Certificates.<br>
**Aim:** <br>
To explore the Java classes related to Digital Certificates.<br>The use and verification of digital signatures is another standard engine that is included in the security provider architecture. Like the other engines we've examined, the classes that implement this engine have both a public interface and an SPI for implementors of the engine.<br>
In the JDK, the most common use of digital signatures is to create signed classes; users have the option of granting additional privileges to these signed classes using the mechanics of the access controller. In addition, a security manager and a class loader can use this information to change the policy of the security manager.<br>
**The Signature Class**<br>
Operations on digital signatures are abstracted by the *Signature* class<br>
*(java.security.Signature):*<br>
**public abstract class Signature extends SignatureSpi**<br>
Provide an engine to create and verify digital signatures. In Java 1.1, there is no *SignatureSpi* class, and this class simply extends the *Object* class. The Sun security provider includes a single implementation of this class that generates signatures based on the DSA algorithm.<br>
**Using the Signature Class**<br>
As with all engine classes, instances of the *Signature* class are obtained by calling one of these methods:<br>
**public static Signature getInstance(String algorithm)**<br>
**public static Signature getInstance(String algorithm, String provider)**<br>
Generate a signature object that implements the given algorithm. If no provider is specified, all providers are searched in order for the given algorithm otherwise, the system searches for the given algorithm only in the given provider. If an implementation of the given algorithm is not found, a *NoSuchAlgorithmException* is thrown. If the named security provider cannot be found, a  NoSuchProviderException* is thrown. If the algorithm string is "DSA", the string "SHA/DSA" is substituted for it. Hence, implementors of this class that provide support for DSA signing must register themselves appropriately (that is, with the message digest algorithm name) in the security provider.Once a signature object is obtained, the following methods can be invoked on it:<br>
**public void final initVerify(PublicKey publicKey)**<br>
Initialize the signature object, preparing it to verify a signature. A signature object must be initialized before it can be used. If the key is not of the correct type for the algorithm or is otherwise invalid, an *InvalidKeyException is thrown.*<br>
**public final void initSign(PrivateKey privateKey)**<br>
Initialize the signature object, preparing it to create a signature. A signature object must be initialized before it can be used. If the key is not of the correct type for the algorithm or is otherwise invalid, an *InvalidKeyException* is thrown.<br>
**public final void update(byte b)**<br>
**public final void update(byte[] b)**<br>
**public final void update(byte b[], int offset, int length)**<br>
Add the given data to the accumulated data the object will eventually sign or verify. If the object has not been initialized, a *SignatureException* is thrown.<br>
**public final byte[] sign()**<br>
**public final int sign(byte[] outbuf, int offset, int len)**<br>
Create the digital signature, assuming that the object has been initialized for signing. If the object has not been properly initialized, a *SignatureException* is thrown. Once the signature has been generated, the object is reset so that it may generate another signature based on some new data (however, it is still initialized for signing; a new call to the *initSign()* method is not required).<br>
In the first of these methods, the signature is returned from the method. Otherwise, the signature is stored into the *outbuf* array at the given offset, and the length of the signature is returned. If the output buffer is too small to hold the data, an *IllegalArgumentException* will be thrown.<br>
**public final boolean verify(byte[] signature)**<br>
Test the validity of the given signature, assuming that the object has been initialized for verification. If the object has not been properly initialized, then a *SignatureException* is thrown. Once the signature has been verified (whether or not the verification succeeds), the object is reset so that it may verify another signature based on some new data (no new call to the *initVerify()* method is required).<br>
**public final String getAlgorithm()**<br>
Get the name of the algorithm this object implements.<br>
**public String toString()**<br>
A printable version of a signature object is composed of the string "*Signature object:*" followed by the name of the algorithm implemented by the object, followed by the initialized state of the object. The state is either *\<not  initialized>, \<initialized  for  verifying>,* or *\<initialized  for  signing>*. However, the Sun DSA implementation of this class overrides this method to show the parameters of the DSA algorithm instead.<br>
**public final void setParameter(String param, Object value)**<br>
**public final void setParameter(AlgorithmParameterSpec param)**<br>
Set the parameter of the signature engine. In the first format, the named parameter is set to the given value; in the second format, parameters are set based on the information in the *param* specification. In the Sun implementation of the DSA signing algorithm, the only valid *param* string is *KSEED*, which requires an array of bytes that will be used to seed the random number generator used to generate the k value. There is no way to set this value through the parameter specification, which in the Sun implementation always returns an *UnsupportedOperationException*.<br>
**public final Object getParameter(String param)**<br>
Return the named parameter from the object. The only valid string for the Sun implementation is *KSEED*.<br>
**public final Provider getProvider()**<br>
Return the provider that supplied the implementation of this signature object. It is no accident that this class has many similarities to the *MessageDigest* class; a digital signature algorithm is typically implemented by performing a cryptographic operation on a private key and the message digest that represents the data to be signed. For the developer, this means that generating a digital signature is virtually the same as generating a message digest; the only difference is that a key must be presented in order to operate on a signature object. This difference is important, however, since it fills in the hole we noticed previously: a message digest can be altered along with the data it represents so that the tampering is unnoticeable. A signed message digest, on the other hand, can't be altered without knowledge of the key that was used to create it. The use of a public key in the digital signature algorithm makes the digital signature more attractive than a message authentication code, in which there must be a shared key between the parties involved in the message exchange.<br>
