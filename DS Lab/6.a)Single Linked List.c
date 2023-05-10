/* Write a C program to implement the folowing operations on  SINGLE LINKED LIST
OPERATIONS:
1.Insert 2.Delete 3.Display 4.Search 5.NodeCount 6.Reverse Display 7.Exit
Also check for "Invalid Choice"
TEST CASE :
CASE 1:
INPUT:
3
7
OUTPUT:
Empty SLL - Cannot display
CASE 2:
input = 5
7
output = 
No of nodes in SLL = 0

case = t4
input = 
1
1
10
1
2
20
1
3
30
1
4
40
3
2
1
3
2
2
3
2
1
2
1
3
7


output =
10 ->20 ->30 ->40 ->
Deleted element from SLL is 10
20 ->30 ->40 ->
Deleted element from SLL is 30
20 ->40 ->
Deleted element from SLL is 20
Deleted element from SLL is 40
Empty SLL - Cannot display


case = t5
input = 
1
1
100
1
2
200
3
1
4
2
3
5
6
7

output =
100 ->200 ->
Position does not exist - Cannot insert into SLL
Position does not exist - Cannot delete from SLL
No of nodes in SLL = 2
200 100 

CHECK OUTPUT FOR ALL THE GIVEN OPERATIONS
NOTE : JUST REMEMEBER EVERY TEST CASE MUST END WITH EXIT OPERATION SO THAT IT WILL STOP FINITELY. 
*/
//Start writing program from here
#include<stdio.h>
#include<stdlib.h>
struct SLLnode
{
    int data;
    struct SLLnode *next;
};
typedef struct SLLnode node;
node *start=NULL;
int count=0;
void SLLdisplay();
void SLLdeletepos(int x);
void SLLinsertpos(int pos);
node* SLLsearch(int key);
int SLLcountnodes();
void SLLreversedisplay(node *temp);
int main()
{node *found;
int ch,pos,key;
while(1)
{
    scanf("%d",&ch);
    switch(ch)
    { case 1: scanf("%d",&pos);
              SLLinsertpos(pos);
              break;
      case 2: scanf("%d",&pos);
              SLLdeletepos(pos);
              break;
      case 3: SLLdisplay();
              break;
      case 4: scanf("%d",&key);
              found=SLLsearch(key);
              if(found==NULL)
              printf("%d is not found in SLL\n",key);
              else
              printf("%d is found in SLL\n",key);
              break;
      case 5: printf("No of nodes in SLL = %d\n",SLLcountnodes());
              break;
      case 6: SLLreversedisplay(start);
              break;
      case 7: exit(0);
      default:printf("Invalid Choice\n");
              break;
    }
}
}
void SLLinsertpos(int pos)
{
    int i;
    node *newnode,*temp=start,*prev;
    if(pos<1||pos>count+1)
    {
        printf("Position does not exist - Cannot insert into SLL\n");
        return;
    }
    newnode=(node*)malloc(sizeof(node));
    scanf("%d",&newnode->data);
    count++;
    if(pos==1)
    {
        newnode->next=start;
        start=newnode;
    }
    else
    {
        for(i=1;i<pos;i++)
        {
            prev=temp;
            temp=temp->next;
        }
        newnode->next=prev->next;
        prev->next=newnode;
    }
}
void SLLdeletepos(int pos)
{
    node *delenode,*temp=start;
    int i;
    if(pos<=0||pos>count||count==0)
    {
        printf("Position does not exist - Cannot delete from SLL\n");
        return;
    }
    if(pos==1)
    {
        delenode=start;
        start=start->next;
    }
    else
    {
        for(i=1;i<=pos-2;i++)
        {
            temp=temp->next;
        }
        delenode=temp->next;
        temp->next=delenode->next;
    }
    count--;
    printf("Deleted element from SLL is %d\n",delenode->data);
    free(delenode);
}
void SLLdisplay()
{
    node *temp=start;
    if(start==NULL)
    {
        printf("Empty SLL - Cannot display\n");
        return;
    }
    printf("\n");
    do
    {
        printf("%d ->",temp->data);
        temp=temp->next;
    }while(temp!=NULL);
}
node* SLLsearch(int key)
{
 node *temp=start;
 while(temp!=NULL)
 {
     if(key==temp->data)
     return(temp);
     temp=temp->next;
 }
 return(NULL);
}
int SLLcountnodes()
{
   node *temp=start;
   int c=0;
   while(temp!=NULL)
   {
       c++;
       temp=temp->next;
       }
       return(c);
}
void SLLreversedisplay(node * temp)
{
    if(temp!=NULL)
    {
        SLLreversedisplay(temp->next);
        printf("%d ",temp->data);
    }
}