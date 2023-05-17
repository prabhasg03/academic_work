"""Q.)Write a Python program to create a lambda function that adds 15 to a given number passed
in as an argument, also create a lambda function that multiplies argument x with argument
y and print the result."""
#program:
m=10
a=int(input('Enter Number for adding:'))
x=lambda x:x+15
print('Result of  add lambda function',x(a))
a=int(input('Enter number 1 for multiplication:'))
b=int(input('Enter number 2 for multiplication:'))
y=lambda a,b:a*b
print('Result of product lambda function:',y(a,b))