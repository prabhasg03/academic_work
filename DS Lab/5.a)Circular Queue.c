    /* Write a C program to implement the folowing operations on  CIRCULAR QUEUE using arrays
CONSIDER A MAX SIZE OF 4
1.ENQUEUE 2.DEQUEUE 3.Display 4.Exit
Also check for "Invalid choice"

case = t1
input = 2
4
output = 
Circular Queue Underflow cannot dequeue

case = t2
input = 3
4
output = 
Circular Queue is empty nothing to display

case = t3
input = 
1
10
1
20
1
30
1
40
3
1
50
4
output =
10 20 30 40 
Circular Queue overflow cannot enqueue 

case = t4
input = 
1
12
1
23
2
2
2
3
4
output =
Dequeued element is:12
Dequeued element is:23
Circular Queue Underflow cannot dequeue
Circular Queue is empty nothing to display


CHECK OUTPUT ALL THE GIVEN OPERATIONS
NOTE : JUST REMEMEBER EVERY TEST CASE MUST END WITH EXIT OPERATION SO THAT IT WILL STOP FINITELY. 
*/
//Start writing program from here
#include<stdio.h>
#include<stdlib.h>
#define MAX 4
int cqueue[MAX];
int rear=-1,front=-1;
void CQenqueue(int val);
void CQdequeue();
void CQdisplay();
int main()
{	 	  	 	   	    	  	   	 	
    int ch,x;
    while(1)
    {
        scanf("%d",&ch);
        switch(ch)
        {
            
            case 1:scanf("%d",&x);
            CQenqueue(x);break;
            case 2:CQdequeue();break;
            case 3:CQdisplay();break;
            case 4:exit(0);
            default:printf("\nInvalid choice");
            
            
            
        }
        
    }
}
void CQenqueue(int val)
{
    if((front==0&&rear==MAX-1||front==rear+1))
    {
        printf("\nCircular Queue Overflow cannot enqueue");
        return;
    }
    if(rear==-1)
    rear=front=0;
    else if(rear==MAX-1)
    rear=0;
    else
    rear++;
    cqueue[rear]=val;
}
void CQdequeue()
{	 	  	 	   	    	  	   	 	
    if(front==-1)
    {
        printf("\nCircular Queue Underflow cannot dequeue");
        return;
    }
    printf("\n Dequeued element is : %d",cqueue[front]);
    if(rear==front)
    rear=front=-1;
    else if(front==MAX-1)
    front=0;
    else
    front++;
}
void CQdisplay()
{
    int i;
    if(front==-1)
    {
        printf("\nCircular Queue is empty nothing to display");
        return;
    }
    printf("\n");
    if(front<rear)
    {
        for(i=front;i<=rear;i++)
        printf("%d ",cqueue[i]);
    }
    else
    {
        for(i=0;i<=rear;i++)
        printf("%d ",cqueue[i]);
        for(i=front;i<=MAX-1;i++)
        printf("%d ",cqueue[i]);
    }
}	 	  	 	   	    	  	   	 	
