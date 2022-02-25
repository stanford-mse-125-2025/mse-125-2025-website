var_list <- c( seq(1,7) , 9 ) 

# Initialization to empty vectors
# best_subset is the output of forward selection, and is the best set of features it can find.
best_subset <- vector()
max_auc <- 0
selected_subset <- vector()

# Iteratively, increase the size of selected subset of features
# There are 8 feature variables in the original data set
for (num_features in seq(8)) {
  max_local_auc <- 0
  best_feature <- -1
  for (v in var_list) {
    # Add the variable to the best subset from previous iteration
    crnt_subset <- c(selected_subset, v)
    # Trim the data frame to exlude all the other variables
    # and then use every variable in the trimmed data frame for our model
    train_data_trim <- select( <Your train set> , c(vote_2008,crnt_subset) )
    model <- glm(vote_2008 ~ ., train_data_trim, family=binomial())
    **Calculate AUC for this model on validation set**
    **Update max_local_auc and best_feature**
  }
  **Update selected_subset**
  **Train the model with selected_subset and calculate performance on validation set**
  **Update max_auc and best_subset**
  # Remove best_var from var_list
  var_list = var_list[-which(var_list==best_feature)]
}
