/* Write a C program to implement the folowing operations on  a BINARY SEARCH TREE.
OPERATIONS:
1.Insert 2.Delete 3.Display(INORDER) 4.Search 5.Exit
Also check for "Invalid Choice"
TEST CASE :
case = t4
input = 
1
100
1
200
1
50
1
70
1
150
3
4
150
4
300
5
output =
Binary Search Tree Oprations
INORDER OF BST: 50 70 100 150 200 
Search Successful 150 is found in BST
Search Unsuccessful 300 is not found in BST

case = t5
input = 
1
10
1
20
1
5
3
2
10
3
2
5
2
20
3
2
10
5

output =
Binary Search Tree Oprations
INORDER OF BST: 5 10 20 
10 is found and deleted from BST
INORDER OF BST: 5 20 
5 is found and deleted from BST
20 is found and deleted from BST
BST EMPTY
Cannot delete 10 is not found or BST empty

CHECK OUTPUT FOR ALL THE GIVEN OPERATIONS
NOTE : JUST REMEMEBER EVERY TEST CASE MUST END WITH EXIT OPERATION SO THAT IT WILL STOP FINITELY. 
*/
//Start writing program from here
#include<stdio.h>
#include<stdlib.h>
struct BSTNode
{
   int data;
   struct BSTNode *left;
   struct BSTNode *right;
};
typedef struct BSTNode node; 
node *root = NULL;
int flag=0;
node* createBST(node*, int);
node* insertBST(node *root,int value);
void  displayBST(node *);
node* deleteBST(node* root ,int val );
int findMinRST(node *); 
node* searchBST(node *root,int key);

int main()
{
   int ch, val;
   node *temp; 
   printf("\nBinary Search Tree Oprations\n");
   while(1){
      scanf("%d",&ch);
      switch(ch)
      {
	    case 1:scanf("%d", &val);
		       root = insertBST(root,val);
		       break;
	    case 2:scanf("%d",&val);
	            root=deleteBST(root,val);
	            if(flag==1)
	              printf("\nCannot delete %d is not found or BST empty",val);
                else
                  printf("\n%d is found and deleted from BST",val);
	             break;
	    case 3: if(root==NULL)
	               printf("\nBST EMPTY");
	            else
                {
	             printf("\nINORDER OF BST: ");
	             displayBST(root);
                }
	            break;
	   case 4:scanf("%d",&val);
	          temp=searchBST(root,val);
	          if(temp == NULL)
	            printf("\nSearch Unsuccessful %d is not found in BST",val);
	          else
	            printf("\nSearch Successful %d is found in BST",val);
	       break;
	 case 5:exit(0);
	 default: printf("\nInvalid Choice");
      }
   }
}
node* createBST(node *root,int value)
{
   node *newNode;
   newNode = (node *)malloc(sizeof(node));
   newNode->data = value;
   newNode->left = newNode->right = NULL;
   return(newNode);
 }
   node* insertBST(node *root,int value)
   {
      if(root == NULL)
        root=createBST(root,value);
      else if(value<root->data)
	    root->left = insertBST(root->left,value);
      else
	    root->right = insertBST(root->right,value);
	  return root; 
  }
void displayBST(node *root)
{
   if(root!=NULL)
   {
      displayBST(root->left);
      printf("%d ",root->data);
      displayBST(root->right);
   }
}
node *deleteBST(node *root, int val)
{
   node* temp;
    if(root==NULL)
    {   
        flag=1;
        return NULL; 
    }
    if(val > root->data)
        root->right = deleteBST(root->right,val);
    else if(val < root->data)
        root->left = deleteBST(root->left,val);
    else
    {
        flag=0;
        if(root->left==NULL&&root->right==NULL)
        {
            temp=root;
            free(temp);
            root=NULL;
        }
        else if(root->left==NULL) 
        {
            temp=root;
            root=root->right;
            free(temp);
        }
        else if(root->right==NULL) 
        {
            temp = root;
            root=root->left;
            free(temp);
        }
        else
        {
            int rightMin = findMinRST(root->right);
            root->data = rightMin;
            root->right = deleteBST(root->right,rightMin);
        }

    }
 return root;
}
int findMinRST(node *root) 
{
   node *temp = root;
  while(temp->left != NULL)
   { 
    temp = temp->left;
   }
    return temp->data;
}
node *searchBST(node *root, int val)
{
    if(root == NULL)
       return NULL;
    if(root->data==val)
       return root;
    if(val > root->data)
       return(searchBST(root->right,val));
    else if(val < root->data)
        return(searchBST(root->left,val));
}