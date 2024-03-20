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
# Image
![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/01306814-3b23-49b2-b6cc-74e4103e84c3)
# Continution
Correctly Classified Instances 859. Accuracy = 85.9% Accuracy when "foreign-workers" was<br>
not removed with use training set for testing is 85.5%. In such a way accuracy has been <br>
increased by 0.4%.<br>
ii) If personal_status is removed. Use training set is used for testing the model.<br>
# Image
![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/09cfa230-0b93-4adb-9af2-922e4f60be33)
# Continution
Correctly Classified Instances =866. Accuracy = 86.6 % Accuracy when "Personal_status"<br>
was not removed with Use training set for testing is 85.5%. Accuracy is increased by 1.1%.<br> 
Since accuracy is increased by removing this attribute,it was concluded that "Personal-status"<br>
attribute is not required for analysis.<br>
Hence we can preserve the "foreign-workers" attribute. Since there is no change in the <br>
accuracy of the model after removing „foreign-workers‟ attribute.<br>
