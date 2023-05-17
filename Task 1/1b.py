"""Q.)Write a Python program to find GCD of two numbers."""
#program
import math
def gcd(a,b):
     if a == b:
         return a
     if a > b:
         return gcd(a-b,b)
     else:
         return gcd(a,b-a)

a=int(input("Enter a:"))
b=int(input("Enter b:"))
c=1
for i in range(1,min(a,b)+1):
    if a%i==0 and b%i==0:
        c=i
print("GCD of",a,b," using iterative approach:",c)
print("GCD of",a,b," using recursive approach:",gcd(a,b))
print("GCD of",a,b," using inbuilt function:",math.gcd(a,b))