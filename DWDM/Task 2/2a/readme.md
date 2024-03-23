# TASK 2(a) 
<p>Suppose you use your above model trained on the complete dataset, and classify credit good/bad for each of the examples in the dataset. What % of examples can you classify correctly? (This is also called testing on the training set) Why do you think you cannot get 100 % training accuracy?Why or Why not?Check to see if the data shows a bias against "foreign workers" (attribute 20),or "personal-status" (attribute 9).Did removing these attributes have any significant effect? Discuss.</p>

# Explanation:
It is performed using dataset [credit-g.arff](https://github.com/prabhasg03/Task-Codes/tree/Data-Warehousing-and-Data-Mining/DWDM/Task%202/2a/credit-g.arff) file
In the above model we trained complete dataset and we classified credit good/bad for each of the examples in the dataset.<br>
<br>
For example: IF purpose=vacation <br>
      THEN credit=bad <br> 
      ELSE<br>
        purpose=business THEN Credit=good <br><br>
<p>In this way we classified each of the examples in the dataset.We classified 85.5% of examples correctly and the remaining 14.5% of examples are incorrectly
classified. We can't get 100% training accuracy because out of the 20 attributes, we have some unnecessary attributes which are also been analyzed and trained.
Due to this the accuracy is affected and hence we can't get 100% training accuracy.</p>
- Classifying with all attributes

![Screenshot 2024-03-23 195355](https://github.com/prabhasg03/Task-Codes/assets/121883587/3e52eef3-3149-466f-adf5-adc477752e7d)

Visit the [Model file](https://github.com/prabhasg03/Task-Codes/tree/Data-Warehousing-and-Data-Mining/DWDM/Task%202/2a/output.model) for clear output
- Classifying Without foreign_workers
 
![Screenshot 2024-03-23 200416](https://github.com/prabhasg03/Task-Codes/assets/121883587/b1e6bfe2-3411-437f-af0e-35318ffe095f)

Visit the [Model file](https://github.com/prabhasg03/Task-Codes/tree/Data-Warehousing-and-Data-Mining/DWDM/Task%202/2a/output1.model) for clear output
- Classfiying without personal_status

![Screenshot 2024-03-23 200558](https://github.com/prabhasg03/Task-Codes/assets/121883587/d6b91a6e-0a87-46fc-89d9-c8a5f86a1393)

Visit the [Model file](https://github.com/prabhasg03/Task-Codes/tree/Data-Warehousing-and-Data-Mining/DWDM/Task%202/2a/output2.model)
