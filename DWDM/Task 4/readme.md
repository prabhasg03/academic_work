# Task 4
Another question might be, do you really need to input so many attributes to get good results? Maybe only a few would do. For example, you could try just having attributes 2, 3, 5, 7, 10, 17 (and 21, the class attribute (naturally)). Try out some combinations. Train your decision tree again and report the Decision tree and cross_validation results
# Procedure:
- Use the Weka GUI Chooser.
-  Select EXPLORER present in Applications.
-  Select Preprocess Tab.
-  Go to OPEN file and browse the file that is already stored in the system "credit-g.arff". 
- Select some of the attributes from attributes list which are to be removed. With this step only the attributes necessary for classification are left in the attributes panel. 
- The go to Classify tab. 
- Choose Classifier “Tree” and Select J48 
- Select Test options "Use training set",If need select attribute. 
- Now start Weka,Now we can see the output details in the Classifier output. 
- Right click on the result list and select “visualize tree” option. 
- Compare the output results with that of the 4th experiment.
- Check whether the accuracy increased or decreased?
- Check whether removing these attributes have any significant effect.
# Output
- Classfication Tree with all Attributes

![Screenshot 2024-03-23 195355](https://github.com/prabhasg03/Task-Codes/assets/121883587/1e632bf1-0e1c-47ba-8ed8-ce4f6ce35576)

For detailed Output:[output.model](https://github.com/prabhasg03/Task-Codes/tree/Data-Warehousing-and-Data-Mining/DWDM/Task%204/output.model)

- Classification Tree with removal of 2, 3, 5, 7, 10, 17, 21 Attributes

![Screenshot 2024-03-23 203348](https://github.com/prabhasg03/Task-Codes/assets/121883587/6836926c-c5de-40bf-b340-2720cfa47720)

For detailed Output:[output.model](https://github.com/prabhasg03/Task-Codes/tree/Data-Warehousing-and-Data-Mining/DWDM/Task%204/output1.model)
- We can say that Accuracy is increased by seeing correctly classified instances raised from 855 to 961
