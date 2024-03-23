# Task 12
Demonstration of clustering rule process on dataset student.arff using simple k- means
# Procedure
- Run the Weka explorer and load the data file student.arff in preprocessing interface.
- Inorder to perform clustering select the "cluster" tab in the explorer and click on the choose button.
This step results in a dropdown list of available clustering algorithms.
- In this case we select "simple k-means".
- Next click in text button to the right of the choose button to get popup window shown in the
screenshots. In this window we enter six on the number of clusters and we leave the value of the
seed on as it is. The seed value is used in generating a random number which is used for making
the internal assignments of instances of clusters.
- Once of the option have been specified. We run the clustering algorithm there we must make sure
that they are in the "cluster mode" panel. The use of training set option is selected and then we
click "start" button. This process and resulting window are shown in the following screenshots.
- The result window shows the centroid of each cluster as well as statistics on the number and the
percent of instances assigned to different clusters. Here clusters centroid are means vectors for
each clusters. This clusters can be used to characterized the cluster.
- Another way of understanding characterstics of each cluster through visualization,we can do this, try right clicking the result set on the result. List panel and selecting the visualize
cluster assignments.
<u><b>Interpretation of the above visualization:-</b></u><br>
From the above visualization, we can understand the distribution of age and instance number in each
cluster. For instance, for each cluster is dominated by age. In this case by changing the color dimension
to other attributes we can see their distribution with in each of the cluster.
- We can assure that resulting dataset which included each instance along with its assign cluster.
To do so we click the save button in the visualization window and save the result student k-mean .The
top portion of this file is shown in the following figure
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
# Output
For Detailed Output: [kmeans.model](https://github.com/prabhasg03/Task-Codes/blob/Data-Warehousing-and-Data-Mining/DWDM/Task%2012/kmeans.model)

![Screenshot 2024-03-23 224601](https://github.com/prabhasg03/Task-Codes/assets/121883587/f2a18356-ebee-4e66-a0ba-d3bb35b532d0)
