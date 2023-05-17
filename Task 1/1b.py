"""Q.)Write a Python program to find GCD of two numbers."""
#program
import math
def rec_gcd(a,b):
     if a == b:
         return a
     if a > b:
         return rec_gcd(a-b,b)
     else:
         return rec_gcd(a,b-a)
def iter_gcd(a,b):
    c=1
    for i in range(1,min(a,b)+1):
        if a%i==0 and b%i==0:
            c=i
    return c
a=int(input("Enter a:"))
b=int(input("Enter b:"))
print("GCD of",a,b," using iterative approach:",iter_gcd(a,b))
print("GCD of",a,b," using recursive approach:",rec_gcd(a,b))
print("GCD of",a,b," using inbuilt function:",math.gcd(a,b))