#include<stdio.h>
#include<stdlib.h>
#define QUEUE_SIZE 4
int queue[QUEUE_SIZE];
int front=-1,rear=-1;
void enqueue(int);
void dequeue();
void display();
void main()
{
int ch,ele;
while(1)
{
scanf("%d", &ch);
switch(ch)
{
case 1:
scanf("%d", &ele);
enqueue(ele);
break;
case 2: dequeue();
break;
case 3: display();
break;
case 4: exit(0);
default: printf("invalid choice\n");
}
}
}
void enqueue(int ele)
{
if(rear==QUEUE_SIZE-1)
printf("\nQueue overflow - cannot Enqueue");
else
{
rear=rear+1;
queue[rear]=ele;
}
}
void dequeue()
{
if(front==rear)
printf("\nQueue underflow - cannot dequeue\n");
else
{
front=front+1;
printf("\nDequeued element is : %d",queue[front]);
if(front==rear)
front=rear=-1;
}
}
void display()
{
int i;
if(front==rear)
printf("\nQueue is empty - cannot display");
else
{
for(i=front+1; i<= rear; i++)
printf("\n%d ", queue[i]);
}
}