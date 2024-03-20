# Task 5(a):
 [Do you think it is a good idea to prefer simple decision trees instead of having long complex 
decision trees? How does the complexity of a Decision Tree relate to the bias of the model?]()
# Task 5(b):
[You can make your Decision Trees simpler by pruning the nodes. One approach is to use 
Reduced Error Pruning - Explain this idea briefly. Try reduced error pruning for training your Decision Trees 
using cross-validation (you can do this in Weka) and report the Decision Tree you obtain ? Also, report your 
accuracy using the pruned model. Does your accuracy increase ?]()
# THEORY: 
Reduced-error pruning 
- Each node of the (over-fit) tree is examined for pruning 
- A node is pruned (removed) only if the resulting pruned tree performs no worse than the original over the validation set 
- Pruning a node consists of 
 - Removing the sub-tree rooted at the pruned node
 - Making the pruned node a leaf node
 - Assigning the pruned node the most common classification of the training instances attached to that node 
- Pruning nodes iteratively
 - Always select a node whose removal most increases the DT accuracy over the validation set
 - Stop when further pruning decreases the DT accuracy over the validation set 
