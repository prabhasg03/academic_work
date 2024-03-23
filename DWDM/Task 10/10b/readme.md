# Task 10(b)
Demonstration of classification rule process on dataset employee.arff using naïve bayes algorithm
# Procedure
We begin the experiment by loading the data (employee.arff) into weka.
- Next we select the “classify” tab and click “choose” button to select the “naive bayes”classifier.
- Now we specify the various parameters. These can be specified by clicking in the text box to the
right of the chose button. In this example, we accept the default values his default version does
perform some pruning but does not perform error pruning.
- Under the “text “options in the main panel. We select the 10-fold cross validation as our
evaluation approach. Since we don‟t have separate evaluation data set, this is necessary to get a
reasonable idea of accuracy of generated model.
- We now click”start”to generate the model .the ascii version of the tree as well as evaluation
statistic will appear in the right panel when the model construction is complete.
- Note that the classification accuracy of model is about 90%.this indicates that we may find more
work. (either in preprocessing or in selecting current parameters for the classification)
# Dataset
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
# Output

![Screenshot 2024-03-23 223133](https://github.com/prabhasg03/Task-Codes/assets/121883587/98a0330b-a10d-487b-988c-faf7d9cf8d13)

For Detailed Output:[naivebayes.model](https://github.com/prabhasg03/Task-Codes/blob/Data-Warehousing-and-Data-Mining/DWDM/Task%2010/10b/naivebayes.model)
