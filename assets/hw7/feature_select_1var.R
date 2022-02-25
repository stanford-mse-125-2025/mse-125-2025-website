# Build a list for index of all features in the training set
# the response variable is excluded (vote_2008, which is 8-th column)
var_list <- c( seq(1,7) , 9 ) 

max_auc <- 0
best_feature <- -1
for (v in var_list) {
  # We trim the data frame to exlude all the other variables
  # and then use every variable in the trimmed data frame for our model
  # This makes next iterations of feature selection easier
  train_data_trim <- select( <Your train set> , c(vote_2008,v) )
  model <- glm(vote_2008 ~ ., train_data_trim, family=binomial())
  **Calculate AUC for this model on validation set**
  **Update max_auc and best_feature**
}