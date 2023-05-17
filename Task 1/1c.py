""""Q.)Write a Python program that reads a list of names and ages, then prints the list sorted by
age."""
#program
n=int(input('Size Of List:'))
list=[]
l=[]
for i in range(0,n):
    a,b=map(str,input().split())
    s=[a,int(b)]
    list.append(s)
    l.append(s)
list=sorted(list,key=lambda t:t[1])
print("Sorting of list by age:\n",list)