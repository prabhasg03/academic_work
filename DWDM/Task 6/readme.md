# Task 6
How can you convert a Decision Trees into "if-then-else rules". Make up your own small Decision 
Tree consisting of 2-3 levels and convert it into a set of rules. There also exist different classifiers 
that output the model in the form of rules - one such classifier in Weka is rules.PART, train this model 
and report the set of rules obtained. Sometimes just one attribute can be good enough in making the 
decision, yes, just one ! Can you predict what attribute that might be in this dataset? OneR classifier 
uses a single attribute to make decisions (it chooses the attribute based on minimum error). Report the 
rule obtained by training a one R classifier. Rank the performance of j48, PART and oneR.
# Procedures:
- [J48]()
- [OneR]()
- [PART]()
# Conclusion
In weka, rules.PART is one of the classifier which converts the decision trees into ―IF-THEN ELSE rules.converting Decision trees into IF-THEN-ELSE rules using rules.<br>
<b>PART classifier:-</b><br>
PART decision list<br>
checking_status = no checking AND<br> 
other_payment_plans = none AND <br>
credit_history = critical/other existing credit: good (134.0/3.0)<br> 
Number of Rules :78<br>
OneR:<br>
Yes, sometimes just one attribute can be good enough in making the decision.<br>
In this dataset (credit_g.arff), Single attribute for making the decision is credit_amount<br>
credit_amount:<br>
< 718.0 -> good <br>
< 759.5 -> bad <br>
(743/1000 instances correct)<br>
With respect to the time, the oneR classifier has higher ranking and J48 is in 2nd place and PART gets 3rd place.<br>
<table cellspacing='2' cellpadding='2'>
  <tr>
    <th></th>
    <th>J48</th>
    <th>PART</th>
    <th>OneR</th>
  </tr>
  <tr>
    <th>Time(Sec)</th>
    <td>0.02</td>
    <td>0.12</td>
    <td>0.01</td>
  </tr>
  <tr>
    <th>Rank</th>
    <td>II</td>
    <td>III</td>
    <td>I</td>
  </tr>
</table>
With respect to the accuracy , the PART classifier has higher ranking and j48 is in 2nd place and OneR gets 3rd place. 
<table>
  <tr>
    <th></th>
    <th>J48</th>
    <th>PART</th>
    <th>OneR</th>
  </tr>
  <tr>
    <th>Accuracy(%)</th>
    <td>85.5</td>
    <td>89.7</td>
    <td>74.3</td>
  </tr>
  <tr>
    <th>Rank</th>
    <td>II</td>
    <td>I</td>
    <td>III</td>
  </tr>
</table>
