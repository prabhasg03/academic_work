class Dish{
    int price,quantity_sold;
    String name;
    Dish(int a,String b,int c){
        this.price=a;
        this.name=b;
        this.quantity_sold=c;
    }
}
class Menu{
    String cuisine;
    int bill,p,c=0,t=0;
    int[] n=new int[p];
    Dish[] items;
    Dish[] obj=new Dish[1];
    Menu(String y,int x,Dish[] z){
        this.p=z.length;
        this.cuisine=y;
        this.bill=x;
        items=new Dish[p];
        items=z;
        for(int i=0;i<items.length;i++)
        {
            for(int j=0;j<items.length-i-1;j++)
            {
                if(items[j].quantity_sold < items[j+1].quantity_sold)
                {
                    obj[0]= items[j];
                    items[j]=items[j+1];
                    items[j+1]=obj[0];
                }
            }
        }

        for(int i=0;i<3;i++)
        {
            for(int j=0;j<3-i-1;j++)
            {
                if(items[j].price < items[j+1].price)
                {
                    obj[0]= items[j];
                    items[j]=items[j+1];
                    items[j+1]=obj[0];
                }
            }
        }
    }
    void top3_dishes(){
       if(p<3){System.out.println("Menu have less than 3 items");}
       else{
        System.out.println("Top 3 dishes:");
        for(int i=0;i<3;i++){
            System.out.println(items[i].name);
        }
       }}
    void cheapest_dish(){
        int m=items[0].price,c=0;
        for(int i=0;i<p;i++){
            if(items[i].price<m){
                m=items[i].price;
                c=i;
            }
        }
        System.out.println("Cheapest Dish:"+items[c].name);
    }
    void updateBill(){
        bill=0;
        if(p==3)
        {
        for(int i=0;i<p;i++){bill+=items[i].price;}
        System.out.println("Total Bill:"+bill);
        }
    else if(p>3){
        for(int i=0;i<3;i++){
            bill+=items[i].price;}
            System.out.println("Total Bill:"+bill); 
        }
        else{
            System.out.println("Menu have less than 3 items");
        }
    }
    }
class Main{
    public static void main(String[] args){
        Dish[] items=new Dish[5];
        items[0]=new Dish(200,"Burger",2);
        items[1]=new Dish(100,"Pizza",1);
        items[2]=new Dish(150,"Taco",3);
        items[3]=new Dish(500,"French Fries",8);
        items[4]=new Dish(250,"Pasta",3);
        Menu ob=new Menu("Indian",10,items);
        ob.top3_dishes();
        ob.cheapest_dish();
        ob.updateBill();
    }
}
