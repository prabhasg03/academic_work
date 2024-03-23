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
View Output file:[result](https://github.com/prabhasg03/Task-Codes/blob/Data-Warehousing-and-Data-Mining/DWDM/Task%208/8b/apriori.txt)

![Screenshot 2024-03-23 220258](https://github.com/prabhasg03/Task-Codes/assets/121883587/b4411062-f38e-4a6c-adf7-9a3e5010f80d)

```
=== Run information ===

Scheme:       weka.associations.Apriori -N 10 -T 0 -C 0.9 -D 0.05 -U 1.0 -M 0.1 -S -1.0 -c -1
Relation:     employee
Instances:    11
Attributes:   4
              age
              income
              performance
              department
=== Associator model (full training set) ===


Apriori
=======

Minimum support: 0.2 (2 instances)
Minimum metric <confidence>: 0.9
Number of cycles performed: 16

Generated sets of large itemsets:

Size of set of large itemsets L(1): 15

Size of set of large itemsets L(2): 17

Size of set of large itemsets L(3): 8

Size of set of large itemsets L(4): 1

Best rules found:

 1. department=production 4 ==> age=25-35 4    <conf:(1)> lift:(2.2) lev:(0.2) [2] conv:(2.18)
 2. department=sales 3 ==> age=<25 3    <conf:(1)> lift:(3.67) lev:(0.2) [2] conv:(2.18)
 3. age=<25 3 ==> department=sales 3    <conf:(1)> lift:(3.67) lev:(0.2) [2] conv:(2.18)
 4. age=35-50 3 ==> department=management 3    <conf:(1)> lift:(2.75) lev:(0.17) [1] conv:(1.91)
 5. income=15k 2 ==> age=<25 2    <conf:(1)> lift:(3.67) lev:(0.13) [1] conv:(1.45)
 6. income=30k 2 ==> age=25-35 2    <conf:(1)> lift:(2.2) lev:(0.1) [1] conv:(1.09)
 7. income=40k 2 ==> age=25-35 2    <conf:(1)> lift:(2.2) lev:(0.1) [1] conv:(1.09)
 8. income=20k 2 ==> age=35-50 2    <conf:(1)> lift:(3.67) lev:(0.13) [1] conv:(1.45)
 9. income=15k 2 ==> department=sales 2    <conf:(1)> lift:(3.67) lev:(0.13) [1] conv:(1.45)
10. income=17k 2 ==> department=management 2    <conf:(1)> lift:(2.75) lev:(0.12) [1] conv:(1.27)
```
