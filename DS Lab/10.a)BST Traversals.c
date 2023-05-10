/* Write a C program to implement the DFS TRAVERSALS OF A BINARY SEARCH TREE.(RECURSIVE)
OPERATIONS:
1.Insert 2.PREORDER 3.INORDER 4.POSTORDER 5.Exit
Also check for "Invalid Choice"
TEST CASE :
case = t5
input = 
1
10
1
5
1
2
2
3
4
5

output =
PREORDER TRAVERSAL OF BINARY SEARCH TREE
10 5 2 
INORDER TRAVERSAL OF BINARY SEARCH TREE
2 5 10 
POSTORDER TRAVERSAL OF BINARY SEARCH TREE
2 5 10 

case = t2
input = 
3
5
output = 
BST EMPTY


CHECK OUTPUT FOR ALL THE GIVEN OPERATIONS
NOTE : JUST REMEMEBER EVERY TEST CASE MUST END WITH EXIT OPERATION SO THAT IT WILL STOP FINITELY. 
*/
//Start writing program from here
#include<stdio.h>
#include<stdlib.h>
struct BSTnode
{
int data;
struct BSTnode *left;
struct BSTnode *right;
};
typedef struct BSTnode node; 
node *root=NULL;

void preorder(node *temp);
void inorder(node *temp);
void postorder(node *temp);
node* createBST(node *root,int val);

int main()
{
int ch,val;
while(1)
{scanf("%d",&ch); 
 switch(ch)
 {
     case 1:scanf("%d",&val);
             root=createBST(root,val);
             break;
     case 2:if(root==NULL)
            printf("\nBST EMPTY");
            else
            printf("\nPREORDER TRAVERSAL OF BINARY SEARCH TREE\n");
            preorder(root);
            break;
     case 3:if(root==NULL)
            printf("\nBST EMPTY");
            else
            printf("\nINORDER TRAVERSAL OF BINARY SEARCH TREE\n");
            inorder(root);
            break;
     case 4:if(root==NULL)
            printf("\nBST EMPTY");
            else
            printf("\nPOSTORDER TRAVERSAL OF BINARY SEARCH TREE\n");
            postorder(root);
            break;
     case 5: exit(0);        
      
    default:printf("\n Invalid Choice");
}}}

node* createBST(node *root,int val)
{
    node * newnode;
    if(root==NULL)
    {
     newnode=(node *)malloc(sizeof(node));
     newnode->data=val;
     newnode->left=newnode->right=NULL;
     root=newnode;
    }
    else if(val<root->data)
        root->left=createBST(root->left,val);
    else
        root->right=createBST(root->right,val);
    return root;    
}
   

void preorder(node * temp)
{
  if(temp!=NULL)
  {
      printf("%d ",temp->data);
       preorder(temp->left);
      preorder(temp->right);
  }      
} 

void inorder(node * temp)
{
  if(temp!=NULL)
  {
      inorder(temp->left);
      printf("%d ",temp->data);
      inorder(temp->right);
  }      
} 

void postorder(node * temp)
{
  if(temp!=NULL)
  {
      postorder(temp->left);
      postorder(temp->right);
      printf("%d ",temp->data);
  }      
} 