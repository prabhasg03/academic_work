"""Q.)Write a Python program to square and cube every number in a given list of integers using
Lambda."""
#program:
n=int(input("Size of List:"))
print('Enter Elements into list:')
l=list(map(int,input().split()))
s=lambda l:l**2
c=lambda l:l**3
sl=map(s,l)
cl=map(c,l)
print('Square of list:')
for i in sl:
    print(i,"",end="")
print('\nCube of list:')
for i in cl:
    print(i,"",end="")