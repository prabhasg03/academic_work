# Task 8(b)
Apply Association rule mining on dataset Employee.arff (Use Apriori Algorithm)
# Theory
In data mining, association rule learning is a popular and well researched method
for discovering interesting relations between variables in large databases. It can be described as
analyzing and presenting strong rules discovered in databases using different measures of
interestingness. In market basket analysis association rules are used and they are also employed
in many application areas including Web usage mining, intrusion detection and bioinformatics.
# Procedure
- Open the data file in Weka Explorer. It is presumed that the required data fields have
been discretized. In this example it is age attribute.
- Clicking on the associate tab will bring up the interface for association rule algorithm.
- We will use apriori algorithm. This is the default algorithm.
- In order to change the parameters for the run (example support, confidence etc) we click
on the text box immediately to the right of the choose button.
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
