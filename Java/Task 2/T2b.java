import java.util.Scanner;
public class T2b {
     public static void main(String[] args){
        Scanner s=new Scanner(System.in);
        System.out.println("Enter size of array");
        int n=s.nextInt();
        String[] a=new String[n];
        s.nextLine();
        for(int i=0;i<n;i++){
            a[i]=s.nextLine();
        }
        for(int i=0;i<n;i++){
            for(int j=1;j<n;j++){
                if(a[j].compareTo(a[j-1])<0){
                    String t=a[j];
                    a[j]=a[j-1];
                    a[j-1]=t;
                }
            }
        }
        for(String b:a){System.out.print(b+" ");}
    s.close();
    }
}
