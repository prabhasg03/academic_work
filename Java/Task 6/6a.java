import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
class Week{
    private static String filepath="E:/Demo/Array/BR.java";
    public static void main(String[] args){
        BufferedReader br=null;
        String line;
        try{ 
            br=new BufferedReader(new FileReader(filepath));
            while((line=br.readLine())!=null)
            {
                System.out.println(line);
            }
        }
        catch(IOException e){
            System.err.println("An IOException was caught:"+e.getMessage());
        }
        try{
            
            System.out.println("Specified class "+Class.forName("UE")+" Found");
        }
        catch(ClassNotFoundException e){
            System.out.println("Below Specified class is not found");
            System.out.println(" A ClassNotFoundException was caught:"+e.getMessage());
        }
        finally
         {
            try{
                if(br!=null){br.close();}
            }
            catch(IOException e){
                e.printStackTrace();
            }
         }
    }
}
