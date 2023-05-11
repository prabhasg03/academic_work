import java.util.*;
import java.io.*;
class week5a{
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
            System.out.print("Enter File name:");
        String file_name =input.nextLine();
        File f = new File(file_name);
        if(f.exists()){
            System.out.println("The File "+file_name+" exists");
          if(f.canRead()){
            System.out.println("The File "+file_name+" is readable");
          }
          else{
            System.out.println("The File "+file_name+"is not readable");
          }
          if(f.canWrite()){
            System.out.println("The File "+file_name+" is writable");
          }
          else{
            System.out.println("The File "+file_name+"is not writable");
          }
            System.out.println("The File type of "+file_name+" is:"+file_name.substring(file_name.indexOf('.')+1));
            System.out.println("The Length of the file is:"+file_name+" "+f.length());
        }
        else{
            System.out.println("The File "+file_name+" doesn't exists");
        }
        input.close();
    }
}