# Task 9(a)
Create a data set Weather.arff with required fields
# Procedure
- Open Start → Programs →Accessories → Notepad
- Type the following training data set with the help of Notepad for Weather Table.
```
@relation weather
@attribute outlook {sunny, overcast, rainy}
@attribute temperature real
@attribute humidity real
@attribute windy {TRUE, FALSE}
@attribute play {yes, no}
@data
sunny,85,85,FALSE,no
sunny,80,90,TRUE,no
overcast,83,86,FALSE,yes
rainy,70,96,FALSE,yes
rainy,68,80,FALSE,yes
rainy,65,70,TRUE,no
overcast,64,65,TRUE,yes
sunny,72,95,FALSE,no
sunny,69,70,FALSE,yes
rainy,75,80,FALSE,yes
sunny,75,70,TRUE,yes
overcast,72,90,TRUE,yes
overcast,81,75,FALSE,yes
rainy,71,91,TRUE,no
```
- After that the file is saved with .arff file format.
- Minimize the arff file and then open Start -> Programs -> weka-3-9.
- Click on weka-3-9, then Weka dialog box is displayed on the screen.
- In that dialog box there are four modes, click on explorer.
- Explorer shows many options. In that click on open file and select the arff file
- Click on edit button which shows weather table on weka.
# Output
