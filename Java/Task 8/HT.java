import java.util.Hashtable;
import java.util.Enumeration;
public class HT
{
public static void main (String[] args)
{
Enumeration<String> names;
String key;
// Creating a HashTable
Hashtable<String,String>  h =new Hashtable<String,String>();
// Adding Key and Value pairs to Hashtable
h.put("Key1","Ajeet");
h.put("Key2","Peter");
h.put("Key3","Ricky");
h.put("Key4","Mona");
names = h.keys();
while(names.hasMoreElements())
{
key = (String) names.nextElement();
System.out.println("Key: " +key+ " & Value: " +h.get(key));
}
}
}