# TASK 2(b)
Check to see if the data shows a bias against "foreign workers" (attribute 20),or "personal-status" (attribute 9).<br>
Did removing these attributes have any significant effect? Discuss.
# Explanation:
It is observed that attribute foreign-workers seems to be important and most relevant attribute<br> 
for loan approval decision. There is increase in the accuracy of the model when the "personal-status" attribute is removed.<br>
 - Click on "preproess" tab
 - Select the attributes:"foreign-workers"
 - Remove attribute by click on "remove" option.
<br>
i) If Foreign_worker is removed. Here use training set is used for testing the model.<br>

![Screenshot 2024-03-23 200416](https://github.com/prabhasg03/Task-Codes/assets/121883587/fac37b74-ec9e-4481-be65-a0c8caecd45f)

For Detailed Output : [output1.model](https://github.com/prabhasg03/Task-Codes/tree/Data-Warehousing-and-Data-Mining/DWDM/Task%202/2b/output1.model)
<p>Correctly Classified Instances 859. Accuracy = 85.9% Accuracy when "foreign-workers" was not removed with use training set for testing is 85.5%. In such a way accuracy has beenincreased by 0.4%.</p>
ii) If personal_status is removed. Use training set is used for testing the model.<br>

![Screenshot 2024-03-23 200558](https://github.com/prabhasg03/Task-Codes/assets/121883587/aeeb3064-7e1f-424d-8f96-832204177120)

For Detailed Output : [output2.model](https://github.com/prabhasg03/Task-Codes/tree/Data-Warehousing-and-Data-Mining/DWDM/Task%202/2b/output2.model)
<p>Correctly Classified Instances =866. Accuracy = 86.6 % Accuracy when "Personal_status" was not removed with Use training set for testing is 85.5%. Accuracy is increased by 1.1%.</p>
<p>Since accuracy is increased by removing this attribute,it was concluded that "Personal-status" attribute is not required for analysis.Hence we can preserve the "foreign-workers" attribute. Since there is no change in the accuracy of the model after removing "foreign-workers" attribute.</p>
