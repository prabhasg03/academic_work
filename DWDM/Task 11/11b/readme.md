# Task 11(b)
Write a procedure for Clustering Customer data using simple K-Means algorithm
# Procedure
- Run the Weka explorer and load the data file Customer.arff in preprocessing interface.
- Inorder to perform clustering select the "cluster" tab in the explorer and click on the choose button. This step results in a dropdown list of available clustering algorithms.
- In this case we select "simple k-means".
- Next click in text button to the right of the choose button to get popup window shown in the screenshots. In this window we enter six on the numClusters and we leave the value of the seed on as it is. The seed value is used in generating a random number which is used for making the internal assignments of instances of clusters.
- Once of the option have been specified. We run the clustering algorithm there we must make sure that they are in the "cluster mode" panel. The use of training set option is selected and then we click "start" button. This process and resulting window are shown in the following screenshots.
- The result window shows the centroid of each cluster as well as statistics on the number and the percent of instances assigned to different clusters. Here clusters centroid are means vectors for each clusters. This clusters can be used to characterized the cluster.
- Another way of understanding characterstics of each cluster through visualization ,we can do this, try right clicking the result set on the result. List panel and selecting the visualize cluster assignments.
# Output
For Detailed Outputs:[simplekmeans](https://github.com/prabhasg03/Task-Codes/blob/Data-Warehousing-and-Data-Mining/DWDM/Task%2011/11b/simplekmeans.model)

![Screenshot 2024-03-23 224117](https://github.com/prabhasg03/Task-Codes/assets/121883587/55aa9271-aa5c-47d2-bfb5-f49e0d4c06b6)
