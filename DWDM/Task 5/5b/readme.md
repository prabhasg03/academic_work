# Task 5(b)
You can make your Decision Trees simpler by pruning the nodes. One approach is to use 
Reduced Error Pruning - Explain this idea briefly. Try reduced error pruning for training your Decision Trees 
using cross-validation (you can do this in Weka) and report the Decision Tree you obtain ? Also, report your 
accuracy using the pruned model. Does your accuracy increase ? 
# Procedure
- Given the Bank database for mining.
- Use the Weka GUI Chooser.
- Select EXPLORER present in Applications.
- Select Preprocess Tab. 
- Go to OPEN file and browse the file that is already stored in the system―credit-g.arff. 
- Go to Classify tab,Choose Classifier-Tree and Select J48 
- Right click on the text box besides choose button, select show properties 
- Now change the reduced error pruning "false" to "true". 
- Now start weka. 
- Now we can see the output details in the Classifier output. 
- Right click on the result list and select  "visualize tree" option.
