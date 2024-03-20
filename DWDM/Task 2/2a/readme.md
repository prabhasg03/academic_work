# TASK 2(a) 
Suppose you use your above model trained on the complete dataset, and classify credit <br>
good/bad for each of the examples in the dataset. What % of examples can you classify correctly? (This <br> 
is also called testing on the training set) Why do you think you cannot get 100 % training accuracy?<br>
Why or Why not?Check to see if the data shows a bias against "foreign workers" (attribute 20),or <br>
"personal-status" (attribute 9).Did removing these attributes have any significant effect? Discuss.<br>
# Explanation:
In the above model we trained complete dataset and we classified credit good/bad for each of the<br>
examples in the dataset.<br>
<br>
For example: IF purpose=vacation <br>
      THEN credit=bad <br> 
      ELSE<br>
        purpose=business THEN Credit=good <br>
In this way we classified each of the examples in the dataset. <br>
We classified 85.5% of examples correctly and the remaining 14.5% of examples are incorrectly <br> 
classified. We can„t get 100% training accuracy because out of the 20 attributes, we have some <br>
unnecessary attributes which are also been analyzed and trained. <br>
Due to this the accuracy is affected and hence we can„t get 100% training accuracy.<br> 
