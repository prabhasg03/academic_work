# Task 7(a)
Create a data set Student.arff with required data 
# Procedure
- Open Start → Programs → Accessories → Notepad
- Type the following training data set with the help of Notepad for Student Table. 
```
@relation student 
@attribute age {<30,30-40,>40} 
@attribute income {low, medium, high} 
@attribute student {yes, no} 
@attribute credit-rating {fair, excellent} 
@attribute buyspc {yes, no} 
@data 
<30, high, no, fair, no 
<30, high, no, excellent, no 
30-40, high, no, fair, yes 
>40, medium, no, fair, yes 
>40, low, yes, fair, yes 
>40, low, yes, excellent, no 
30-40, low, yes, excellent, yes 
<30, medium, no, fair, no 
<30, low, yes, fair, no 
>40, medium, yes, fair, yes 
<30, medium, yes, excellent, yes 
30-40, medium, no, excellent, yes 
30-40, high, yes, fair, yes 
>40, medium, no, excellent, no 
```
- After that the file is saved with .arff file format. 
- Minimize the arff file and then open Start ->Programs -> weka-3-9. 
- Click on weka-3-9, then Weka dialog box is displayed on the screen. 
- In that dialog box there are four modes, click on explorer. 
- Explorer shows many options. In that click on „open file‟ and select the arff file 
- Click on edit button which shows student table on weka.
# Output
