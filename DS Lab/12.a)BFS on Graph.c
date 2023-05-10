/* Write a C program to IMPLEMENT BREADTH FIRST SEARCH TRAVERSAL ON A GRAPH 
WE ARE USING ADJACENCY MATRIX.
OPERATIONS:
PERFORM READ GRAPH ,PRINT GRAPH AND THEN BFS. 
DEFINE MAX AS 15
READ NUMBER OF VERTICES IN "n" in first line.
from second line the adjacency matrix values 0 or 1 depending on edge exists or not.
Next read the start vertex from which tou begin BFS. 
TEST CASE :


*/
//Start writing program from here
#include<stdio.h>
#define MAX 15
int G[MAX][MAX];
int Q[MAX];
int n,r=-1,f=-1;
int Visited[MAX]={0};
void getgraph()
{ int i,j;
  for(i=1;i<=n;i++)
  { for(j=1;j<=n;j++){
   scanf("%d",&G[i][j]);   
}}}
 void printgraph()
{ 
  int i,j;
  for(i=1;i<=n;i++)
  {
  printf("\nVERTEX %d\t",i);
  for(j=1;j<=n;j++)
  {
  printf("%d  ",G[i][j]);  
  }
  }
} 
 void enqueue(int v){
 if(r==MAX-1){
 printf("\nQ Overflow");
 return;}
 Q[++r]=v;
 if(r==0)
 f=0;
 }
 int dequeue()
 {
    int ver;
    if(f==-1)
    {
      printf("\nQ Underflow");
      return -1;
    }
    ver=Q[f];
    if(r==f)
    r=f=-1;
    else
    f++;
    return(ver);
 }
 void BFS(int v)
 {
     int i,res;
     Visited[v]=1;
     enqueue(v);
     while(f!=-1)
     {
         res=dequeue();
         printf("%d ,",res);
         for(i=1;i<=n;i++)
         {
             if(G[res][i]==1&&Visited[i]==0)
             {
                 enqueue(i);
                 Visited[i]=1;
             }
         }
     }
 }
 int main()
 {
     int s,i;
     scanf("%d",&n);
     getgraph();
     printgraph();
     if(n==0)
     printf("\nGraph Empty - No BFS");
     else
     {
      scanf("%d",&s);
      printf("\nThe BFS Traversal of Graph is:\n");
      BFS(s);
      for(i=1;i<=n;i++)
      {
          if(Visited[i]==0)
          //printf("\nThe vertex %d is not reachable from %d",i,s);
          BFS(i);
       }
     }
 }