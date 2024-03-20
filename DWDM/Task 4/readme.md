# Task 4
Another question might be, do you really need to input so many attributes to get good results? Maybe only a few would do. For example, you could try just having attributes 2, 3, 5, 7, 10, 17 (and 21, the class attribute (naturally)). Try out some combinations. Train your decision tree again and report the Decision tree and cross_validation results
# Procedure:
- Use the Weka GUI Chooser.
-  Select EXPLORER present in Applications.
-  Select Preprocess Tab.
-  Go to OPEN file and browse the file that is already stored in the system “bank.csv”. 
- Select some of the attributes from attributes list which are to be removed. With this step only the 
attributes necessary for classification are left in the attributes panel. 
- The go to Classify tab. 
- Choose Classifier “Tree” and Select J48 
- Select Test options "Use training set",If need select attribute. 
- Now start Weka,Now we can see the output details in the Classifier output. 
- Right click on the result list and select “visualize tree” option. 
- Compare the output results with that of the 4th experiment.
- Check whether the accuracy increased or decreased?
- Check whether removing these attributes have any significant effect.
# Output
