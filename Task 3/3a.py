'''3a.)Write a Python program that will prompt the user for a file name, read all the lines from
the file into a list, sort the list, and then print the lines in sorted order.
'''
fn=input('Enter File Name:')
data=open(fn,"r")
data=(data.read())
print('Contents of file:\n',data)
l=list(data.split('\n'))
l=sorted(l)
print('Contents of file After sorting:')
print(*l)