# Task 3
One approach for solving the problem encountered in the previous question is using cross-validation? Describe what cross-validation is briefly. Train a Decision Tree again using cross- 
validation and report your results. Does your accuracy increase/decrease? Why? 
# Explanation
In cross-validation you decided on a fixed number of folds or partitions of the data. Two-third for 
training and one-third for testing and repeat procedure three times so that in the end, every instance 
has been used exactly once for testing is called stratified cross-fold validation.In training dataset 
compared with cross-validation the accuracy is decreases. 
<b>Cross validation:-</b> 
In k-fold cross-validation, the initial data are randomly portioned into k„ mutually exclusive subsets 
or folds D1, D2, D3,...,Dk. Each of approximately equal size. Training and testing is 
performed ‗k„ times. In iteration I, partition Di is reserved as the test set and the remaining partitions 
are collectively used to train the model. That is in the first iteration subsets D2, D3, , Dk collectively 
serve as the training set in order to obtain as first model. Which is tested on Di. The second trained 
on the subsets D1, D3, . . . . . ., Dk and test on the D2 and so on....
# Procedure
- Use the Weka GUI Chooser. 
- Select EXPLORER present in Applications. 
- Select Preprocess Tab. 
- Go to OPEN file and browse the file that is already stored in the system "credit- a.arff". 
- Go to Classify tab and Choose Classifier “Tree” 
- Select J48 and Select Test options “Cross-validation”. 
- Set “Folds” Ex:10,If need select attribute. 
- Now Start weka.
# Output
