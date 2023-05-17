'''3b. Write a Python program that asks the user for a filename, and then prints the number of
characters, words, and lines in the file.'''
fn=input('Enter File Name:')
data=open(fn,"r")
data=(data.read())
print('Number of Characters:',len(data))
print('Number of Words:',len(data.split()))
print('Number of Sentences:',len(data.split('\n')))