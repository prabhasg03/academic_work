# Task 10(a)
Demonstration of classification algorithm on dataset student.arff using j48 algorithm
# Procedure
- We begin the experiment by loading the data (student.arff)into weka.
- Next we select the "classify" tab and click "choose" button to select the "J48" classifier.
- Now we specify the various parameters. These can be specified by clicking in the text box to the
right of the chose button. In this example, we accept the default values. The default version does
perform some pruning but does not perform error pruning.
- Under the "text" options in the main panel. We select the 10-fold cross validation as our
evaluation approach. Since we don‟t have separate evaluation data set, this is necessary to get a
reasonable idea of accuracy of generated model.
- We now click "start" to generate the model .the Ascii version of the tree as well as evaluation
statistic will appear in the right panel when the model construction is complete.
- Note that the classification accuracy of model is about 69%.this indicates that we may find more
work. (Either in preprocessing or in selecting current parameters for the classification)
- Now weka also lets us a view a graphical version of the classification tree. This can be done by
right clicking the last result set and selecting "visualize tree" from the pop-up menu.
- We will use our model to classify the new instances.
- In the main panel under "text" options click the "supplied test set" radio button and then click the
"set" button. This wills pop-up a window which will allow you to open the file containing test
instances.
# Dataset
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
