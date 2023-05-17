'''6a.)Write a Python program to shuffle the elements of a given list'''
import random
n=int(input("Enter Size of list:"))
l=[]
for i in range(n):
    l.append(input())
print('Elements before shuffling:')
print(l)
random.shuffle(l)
print('Elements after shuffling:')
print(l)