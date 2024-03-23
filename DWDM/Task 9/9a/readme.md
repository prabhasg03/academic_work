# Task 9(a)
Create a data set Weather.arff with required fields
# Procedure
- Open Start → Programs →Accessories → Notepad
- Type the following training data set with the help of Notepad for Weather Table.
```
@relation Weather
@attribute outlook{sunny,overcast,rainy,windy}
@attribute temperature real
@attribute humidity real
@attribute windy{true,false}
@attribute play{y,n}
@data
sunny,47,50,true,y
windy,42,44,true,n
sunny,44,45,true,y
windy,43,44,true,n
sunny,43,46,true,y
windy,40,43,true,n
sunny,40,44,true,y
windy,41,43,true,n
rainy,39,40,false,n
rainy,38,40,true,n
rainy,37,40,true,n
rainy,34,40,false,n
overcast,47,44,true,y
overcast,46,45,true,y
overcast,46,48,true,y
overcast,43,47,false,n
```
- After that the file is saved with .arff file format.
- Minimize the arff file and then open Start -> Programs -> weka-3-9.
- Click on weka-3-9, then Weka dialog box is displayed on the screen.
- In that dialog box there are four modes, click on explorer.
- Explorer shows many options. In that click on open file and select the arff file
- Click on edit button which shows weather table on weka.
# Output

![Screenshot 2024-03-23 220747](https://github.com/prabhasg03/Task-Codes/assets/121883587/6b9f46ef-ead8-418c-b61a-6b224fdf8ba6)
