'''4a.)Write a python program to create user defined exception.'''
class UA(Exception):
 pass
try:
    n=input('Enter Name:')
    a=int(input('Enter Age:'))
    if(a<0):
        raise TypeError("Enter age above 0")
    if(a<18):
        raise UA
    print(n,'is eligible to vote')
except TypeError as b:
        print(b)
except UA:
         print(n,"is not eligible to vote")
except ValueError:
         print("Enter a number in age above 0")

UA()