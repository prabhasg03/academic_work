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
- Select "Use Training Set" and Click on Start. 
- Now we can see the output details in the Classifier output. 
- Right click on the result list and select  "visualize tree" option.
# Output
- With reducedErrorPruning=false

![Screenshot 2024-03-23 195355](https://github.com/prabhasg03/Task-Codes/assets/121883587/277f4d78-345a-4d54-bbf8-33e8e80f1a12)

For Detailed Output: [Visit Model File](https://github.com/prabhasg03/Task-Codes/tree/Data-Warehousing-and-Data-Mining/DWDM/Task%205/5b/output.model)
- With reeducedErrorPruning=true

![Screenshot 2024-03-23 204107](https://github.com/prabhasg03/Task-Codes/assets/121883587/ad055b47-435b-44fc-9744-794006fd8462)

For Detailed Output: [Visit Model File](https://github.com/prabhasg03/Task-Codes/tree/Data-Warehousing-and-Data-Mining/DWDM/Task%205/5b/output1.model)
