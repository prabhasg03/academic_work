"""Q.)Write a python program to find factorial of a given number."""
#program
import math
def rec_factr(n):
    if n==0:
        return 1
    return n*rec_factr(n-1)

def iter_factr(n):
    fact=1
    for i in range(1,n+1):
        fact=fact*i
    return fact
n=int(input("Enter Number:"))
print("Factorial of",n,"using Iterative:",iter_factr(n))
print("Factorial of",n,"using Recursion:",rec_factr(n))
print("Factorial of",n,"using Inbuilt Function:",math.factorial(n))