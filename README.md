```
Implement the following Tasks using Weka Tool:
(Solve the tasks 1 to 6 by taking given German credit data as case study)
The German Credit Data:
Actual historical credit data is not always easy to come by because of confidentiality rules. 
Here is one such dataset, consisting of 1000 actual cases collected in Germany. Credit dataset 
(original) Excel Spreadsheet version of the German credit data. (Download from web). In spite 
of the fact that the data is German, you should probably make use of it for this assignment. 
(Unless you really can consult a real loan officer).A few notes on the German dataset:
- DM stands for Deutsche Mark, the UNIT of currency, worth about 90 cents 
Canadian (but looks and acts like aquarter).
- Own_telephone: German phone rates are much higher than in Canada, so fewer 
people own telephones.
- Foreign_worker: There are millions of these in Germany (many from Turkey). It is 
very hard to get German citizenship if you were not born of German parents.
- There are 20 attributes in judging a loan applicant. The goal is to classify the 
applicant into two categories: good orbad.
```
# TASK 1
- [List all the categorical (or nominal) attributes and the real-valued attributes separately. What 
attributes do you think might be crucial in making the credit assessment? Come up with some 
simple rules in plain English using your selected attributes. One type of model that you can 
create is a Decision Tree - train a Decision Tree using the complete dataset as the training data. 
Report the model obtained after training.]()
# TASK 2
- [Suppose you use your above model (task1) trained on the complete dataset, and classify credit 
good/bad for each of the examples in the dataset. What % of examples can you classify 
correctly? (This is also called testing on the training set) Why do you think you cannot get 100 
% training accuracy? Why or Why not? Check to see if the data shows a bias against "foreign 
workers" (attribute 20),or "personal-status" (attribute 9). Did removing these attributes have 
any significant effect? Discuss.]()
# TASK 3
- [Describe what cross-validation is briefly. Train a Decision Tree again using cross-validation 
and report your results. Does your accuracy increase/decrease? Why?]()
# TASK 4
- [Another question might be, do you really need to input so many attributes to get good results? 
Maybe only a few would do. For example, you could try just having attributes 2, 3, 5, 7, 10, 17 
(and 21, the class attribute (naturally)). Try out some combinations. Train your Decision Tree 
again and report the Decision Tree and cross-validation results.]()
# TASK 5
- [Do you think it is a good idea to prefer simple decision trees instead of having long complex 
decision trees? How does the complexity of a Decision Tree relate to the bias of the model? 
You can make your Decision Trees simpler by pruning the nodes. One approach is to use 
Reduced Error Pruning - Explain this idea briefly. Try reduced error pruning for training your 
Decision Trees using cross- validation (you can do this in Weka) and report the Decision Tree 
you obtain? Also, report your accuracy using the pruned model. Does your accuracy increase?]()
# TASK 6
- [How can you convert a Decision Trees into "if-then-else rules". Make up your own small 
Decision Tree consisting of 2-3 levels and convert it into a set of rules. There also exist different 
classifiers that output the model in the form of rules - one such classifier in Weka is rules. 
PART, train this model and report the set of rules obtained. Sometimes just one attribute can 
be good enough in making the decision, yes, just one! Can you predict what attribute that might 
be in this dataset? Report the rule obtained by training a one R classifier. Rank the performance 
of j48, PART and one R.]()
# TASK 7
 - [(a) Create a data set Student.arff with required data.]()
 - [(b) Demonstrate preprocessing techniques on dataset Student.arff]()
# TASK 8
- [(a) Create a data set Employee.arff by adding required data fields.]()
- [(b) Apply Association rule mining on dataset Employee.arff (Use Apriori Algorithm)]()
# TASK 9
- [(a) Create a data set Weather.arff with required fields.]()
- [(b) Apply preprocessing techniques on dataset Weather.arff and normalize Weather Table 
data using Knowledge Flow.]()
# TASK 10
- [(a) Demonstrate classification algorithm on dataset student.arff using j48 algorithm]()
- [(b) Demonstration of classification rule process on dataset employee.arff using naïve bayes algorithm]()
# TASK 11
- [(a) Create a data set customer.arff with required fields.]()
- [(b) Write a procedure for Clustering Customer data using Simple K-Means Algorithm.]()
# TASK 12
- [Demonstration of clustering rule process on dataset student.arff using simple k-means]()
