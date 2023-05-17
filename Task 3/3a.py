fn=input('Enter File Name:')
data=open(fn,"r")
data=(data.read())
print('Contents of file:\n',data)
l=list(data.split('\n'))
l=sorted(l)
print('Contents of file After sorting:')
for i in l:
    print(i)