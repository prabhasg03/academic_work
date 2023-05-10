/* Write a C program to IMPLEMENT DEPTH FIRST SEARCH TRAVERSAL ON A GRAPH 
WE ARE USING ADJACENCY MATRIX.
OPERATIONS:
PERFORM READ GRAPH ,PRINT GRAPH AND THEN DFS. 
DEFINE MAX AS 15
READ NUMBER OF VERTICES IN "n" in first line.
from second line the adjacency matrix values 0 or 1 depending on edge exists or not.
Next read the start vertex from which tou begin DFS. 
TEST CASE :
case = t2
input =
5
0
1
1
1
0
1
0
1
0
0
1
1
0
0
0
1
0
0
0
1
0
0
0
1
0
5
output = 
VERTEX 1	0  1  1  1  0  
VERTEX 2	1  0  1  0  0  
VERTEX 3	1  1  0  0  0  
VERTEX 4	1  0  0  0  1  
VERTEX 5	0  0  0  1  0  
The DFS Traversal of Graph is :
5 ,4 ,1 ,2 ,3 ,

*/
//Start writing program from here
#include<stdio.h>
#define MAX 10
int Visited[MAX]={0};
int G[MAX][MAX];
int n;
void getgraph()
{
    int i,j;
    for(i=1;i<=n;i++)
    {
        for(j=1;j<=n;j++)
        {
            scanf("%d",&G[i][j]);
        }
    }
}
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
void DFS(int v)
{
    int i;
    Visited[v]=1;
    printf("%d ,",v);
    for(i=1;i<=n;i++)
     if((G[v][i]==1)&&(Visited[i]==0))
     DFS(i);
}
int main()
{
    int i,s;
    scanf("%d",&n);
    getgraph();
    printgraph();
    if(n==0)
    printf("\nGraph Empty - No DFS");
    else
    {
        scanf("%d",&s);
        printf("\nThe DFS Traversal of Graph is :\n");
        DFS(s);
        for(i=1;i<=n;i++)
        {
            if(Visited[i]==0)
            DFS(i);
        }
    }
}