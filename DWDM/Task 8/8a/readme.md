# Task 8(a)
Create a data set Employee.arff by adding required data fields
# Procedure
- Open Start → Programs → Accessories → Notepad
- Type the following training data set with the help of Notepad for Employee Table.
```
@relation employee
@attribute age{<25,25-35,35-50}
@attribute income{10k,15k,17k,20k,30k,40k}
@attribute performance{poor,avg,good,best}
@attribute department{sales,management,production}
@data
<25,10k,avg,sales
<25,15k,avg,sales
<25,15k,good,sales
25-35,17k,avg,management
35-50,17k,poor,management
35-50,20k,good,management
35-50,20k,best,management
25-35,30k,good,production
25-35,30k,good,production
25-35,40k,best,production
25-35,40k,poor,production
```
- After that the file is saved with .arff file format.
- Minimize the arff file and then open Start -> Programs -> weka-3-9.
- Click on weka-3-9, then Weka dialog box is displayed on the screen.
- In that dialog box there are four modes, click on explorer.
- Explorer shows many options. In that click on open file and select the arff file
- Click on edit button which shows student table on weka.
# Output
Dataset: [emp.arff](https://github.com/prabhasg03/Task-Codes/blob/Data-Warehousing-and-Data-Mining/DWDM/Task%208/8a/emp.arff)

![Screenshot 2024-03-23 220043](https://github.com/prabhasg03/Task-Codes/assets/121883587/2cdc0e44-6da3-4d89-911b-eeb1269f8f22)
