'''6b.)Write a Python program to read and display the content of a given CSV file'''
import pandas as pd
'''names = pd.read_csv("C:\\21241A6625\\Task 6\\names.csv")
names = pd.read_csv("C:/21241A6625/Task 6/names.csv")
names = pd.read_csv(r"C:\21241A6625\Task 6\names.csv")
'''
names = pd.read_csv(input()+".csv")
print("Contents of file:")
print(names.shape)
print (names.head())
x = names['Age']
y = names.drop('Age',axis=1)
print('AGE:')
print (x.head())
print('Contents after dropping Age:')
print (y.head())
print("Contents of last two members of file:")
print(y.tail(2))