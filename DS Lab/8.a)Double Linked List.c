/* Write a C program to implement the folowing operations on  DOUBLE LINKED LIST
OPERATIONS:
1.Insert 2.Delete 3.Display 4.Search 5.Reverse Display 6.Exit
Also check for "Invalid Choice"
TEST CASE :
case = t2
input = 5
6
output = 
Empty DLL - Cannot display

case = t3
input = 
1
1
100
1
1
200
1
1
300
3
5
6

output =
300 ->200 ->100 ->
100 ->200 ->300 ->

case = t4
input = 
1
1
10
1
1
20
1
1
30
3
4
20
4
60
5
2
3
6
output =
30 ->20 ->10 ->
20 is found in DLL
60 is not found in DLL
10 ->20 ->30 ->
Deleted element from DLL is 10




CHECK OUTPUT FOR ALL THE GIVEN OPERATIONS
NOTE : JUST REMEMEBER EVERY TEST CASE MUST END WITH EXIT OPERATION SO THAT IT WILL STOP FINITELY. 
*/
//Start writing program from here
#include<stdio.h>
#include<stdlib.h>
struct DLLnode
{
int data;
struct DLLnode *next,*prev;
};
typedef struct DLLnode node; 
node *start=NULL,*end=NULL;
int count=0;
void DLLdisplay();
void DLLreversedisplay();
void DLLdeletepos(int x);
void DLLinsertpos(int pos);
node* DLLsearch(int key);

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
	   DLLinsertpos(pos);
	   break;
case 2:scanf("%d",&pos);
	   DLLdeletepos(pos);
	   break;
case 3:DLLdisplay();
       break;	   
case 4:scanf("%d",&key);
	   found=DLLsearch(key);
	   if(found==NULL)
	     printf("\n%d is not found in DLL",key);
	   else
	     printf("\n%d is found in DLL",key);
	   break;
case 5:DLLreversedisplay();
       break;
case 6:exit(0);
default:printf("\nInvalid Choice");
        break;
}
}
}

void DLLdisplay()
{
node *temp=start;
if(start==NULL)
{
printf("\nEmpty DLL - Cannot display");
return;
}
printf("\n");
while(temp!=NULL)
{
printf("%d ->",temp->data);
temp=temp->next;
}
} 

void DLLreversedisplay()
{
node *temp=end;
if(start==NULL)
{
printf("\nEmpty DLL - Cannot display");
return;
}
printf("\n");
while(temp!=NULL)
{
printf("%d ->",temp->data);
temp=temp->prev;
}
} 




void DLLdeletepos(int pos)
{
node *temp=start,*delnode;
int i;
if(pos<0||count==0||pos>count)
{
printf("\nPosition does not exist - Cannot delete from DLL");
return;
}
if(pos==1)
{
 delnode=start;
 if(start==end) 
   start=end=NULL;
 else
 {
  start=start->next;
  start->prev=NULL;
 }
}
else
{
  for(i=1;i<=pos-2;i++)
  {
    temp=temp->next;
  }
 delnode=temp->next;
 temp->next=delnode->next; // b to d
 if(delnode->next!=NULL)
 delnode->next->prev=temp; //d to before
 if(pos==count)
  end=end->prev;
}
count--;
printf("\nDeleted element from DLL is %d",delnode->data);
free(delnode);
}

void DLLinsertpos(int pos)
{
int i;
node *newnode,*temp=start;
if(pos<1||pos>count+1)
{
printf("\nPosition does not exist - Cannot insert into DLL");
return;
}
newnode=(node*)malloc(sizeof(node));
scanf("%d",&newnode->data);
newnode->next=newnode->prev=NULL; 
count++;
if(pos==1)
{
    if(start==NULL)
     start=end=newnode;
    else
    {
     newnode->next=start;
     start->prev=newnode;
     start=newnode;
    }
} 
else 
{
for(i=1;i<=pos-2;i++)
  temp=temp->next; 
  
  newnode->next=temp->next; 
  if(temp->next!=NULL)
   temp->next->prev=newnode; 
  newnode->prev=temp;
  temp->next=newnode; 
  if(pos==count)
  end=newnode;
}
}

node* DLLsearch(int key)
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