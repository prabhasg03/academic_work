/* Write a C program to implement the folowing operations on  CIRCULAR LINKED LIST
OPERATIONS:
1.Insert 2.Delete 3.Display 4.Search 5.Exit
Also check for "Invalid Choice"
TEST CASE :
CASE 1:
INPUT:
3
5
OUTPUT:
Empty CLL - Cannot display

CASE 2:
case = t6
input = 
1
1
100
1
2
200
1
3
300
1
4
400
3
1
7
2
5
4
300
5

output =
100 ->200 ->300 ->400 ->
Position does not exist - Cannot insert into CLL
Position does not exist - Cannot delete from CLL
300 is found in CLL


CHECK OUTPUT FOR ALL THE GIVEN OPERATIONS
NOTE : JUST REMEMEBER EVERY TEST CASE MUST END WITH EXIT OPERATION SO THAT IT WILL STOP FINITELY. 
*/
//Start writing program from here
#include<stdio.h>
#include<stdlib.h>
struct CLLnode
{
int data;
struct CLLnode *next;
};
typedef struct CLLnode node; 
node *start=NULL;
int count=0;
void CLLdisplay();
void CLLdeletepos(int x);
void CLLinsertpos(int pos);
node* CLLsearch(int key);

int main()
{
node *found;
int ch,pos,key;
while(1)
{
scanf("%d",&ch);
switch(ch)
{
case 1:scanf("%d",&pos);
	   CLLinsertpos(pos);
	   break;
case 2:scanf("%d",&pos);
	   CLLdeletepos(pos);
	   break;
case 3:CLLdisplay();
       break;	   
case 4:scanf("%d",&key);
	   found=CLLsearch(key);
	   if(found==NULL)
	     printf("\n%d is not found in CLL",key);
	   else
	     printf("\n%d is found in CLL",key);
	   break;
case 5:exit(0);
default:printf("\nInvalid Choice");
        break;
}
}
}
void CLLdisplay()
{
node *temp=start;
if(start==NULL)
{
printf("\nEmpty CLL - Cannot display");
return;
}
printf("\n");
do
{
printf("%d ->",temp->data);
temp=temp->next;
}while(temp!=start);
} 
void CLLdeletepos(int pos)
{
node *temp=start,*delnode;
int i;
if(pos<0||count==0||pos>count)
{
printf("\nPosition does not exist - Cannot delete from CLL");
return;
}
if(pos==1)
{
 delnode=start;
 if(start==start->next)
   start=NULL;
 else
 {
  while(temp->next!=start)
  temp=temp->next;  
  temp->next=start->next; 
  start=start->next;
 }
}
else
{
  for(i=1;i<=pos-2;i++)
  {
    temp=temp->next;
  }
 delnode=temp->next;
 temp->next=delnode->next;
}
count--;
printf("\nDeleted element from CLL is %d",delnode->data);
free(delnode);
}

void CLLinsertpos(int pos)
{
int i;
node *newnode,*temp=start;
if(pos<1||pos>count+1)
{
printf("\nPosition does not exist - Cannot insert into CLL");
return;
}
newnode=(node*)malloc(sizeof(node));
scanf("%d",&newnode->data);
count++;
if(pos==1)
{
    if(start==NULL)
    {
        start=newnode;
        newnode->next=start; 
    }
    else
    {
     do
     {
       temp=temp->next;
     }while(temp->next!=start);
     
     /*
     while(temp->next!=start)
       temp=temp->next
     */
       
    temp->next=newnode;
    newnode->next=start;
    start=newnode; 
   }
  } 
else
{
for(i=1;i<=pos-2;i++)
{
temp=temp->next;
}
newnode->next=temp->next;
temp->next=newnode;
}

}

node* CLLsearch(int key)
{
node *temp=start;
if(temp!=NULL)
{
do
{
if(key==temp->data)
   return(temp);
temp=temp->next;
}while(temp!=start);
}
return(NULL);
}