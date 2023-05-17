"""Q.)Write a program to demonstrate working with tuples in python."""
#Program
'''Adding'''
t=(25,10,96.1,'Prabhas')
t=list(t)
t.append(9.31)
t=tuple(t)
s=(25,)
t+=s
print(t)
'''Removing'''
t=list(t)
t.remove("Prabhas")
t=tuple(t)
print(t)
'''Accessing'''
print(t[-2]+t[0])
for i in t:
    print(i,"",end='')
'''Searching'''
k=(input('\nEnter Element to search:'))
k=float(k) if type(k)==float else str(k)
if t.index(k)!=-1:
     print("Element found at:",t.index(k)+1,"place first,occuring",t.count(k),"times" if t.count(k)>1 else"time")
else:
     print("Element not found")