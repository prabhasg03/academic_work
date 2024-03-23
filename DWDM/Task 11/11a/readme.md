# Task 11a
Create a dataset customer.arff with required fields
# Procedure
- Open Start -> Programs -> Accessories -> Notepad
- Type the following training data set with the help of Notepad for Customer Table.
```
@relation customer
@attribute name {p,q,r,s,t,u,v,w,x}
@attribute age {youth,middle,senior}
@attribute income {high,medium,low}
@attribute class {A,B}
@data
q,youth,high,A
p,youth,low,B
s,middle,high,A
u,middle,low,B
v,senior,high,A
s,senior,low,B
t,youth,high,A
q,youth,low,B
r,middle,high,A
p,senior,high,A
```
- After that the file is saved with .arff file format.
- Minimize the arff file and then open Start -> Programs -> weka-3-9.
- Click on weka-3-9, then Weka dialog box is displayed on the screen.
- In that dialog box there are four modes, click on explorer.
- Explorer shows many options. In that click on "open file" and select the arff file
- Click on edit button which shows customer table on weka
# Output

![Screenshot 2024-03-23 223514](https://github.com/prabhasg03/Task-Codes/assets/121883587/c5f15ef0-73a6-4814-bcc9-a447c43a0136)
