# Install packages 
install.packages("caTools")
install.packages("class")

# Load libraries
library(caTools)
library(class)

# Load dataset
data(ChickWeight)

# Check dataset
head(ChickWeight)
str(ChickWeight)

# Convert Diet into factor
ChickWeight$Diet <- as.factor(ChickWeight$Diet)

# Split data
set.seed(123)
split <- sample.split(ChickWeight$Diet, SplitRatio = 0.7)

train <- subset(ChickWeight, split == TRUE)
test <- subset(ChickWeight, split == FALSE)

# Feature scaling
train_scale <- scale(train[, c("weight", "Time")])
test_scale <- scale(test[, c("weight", "Time")])

# Test multiple K values
k_values <- c(1, 3, 5, 7, 9, 11, 15, 19)
accuracy_results <- c()

for (k in k_values) {
  pred <- knn(train = train_scale,
              test = test_scale,
              cl = train$Diet,
              k = k)
  
  acc <- mean(pred == test$Diet)
  accuracy_results <- c(accuracy_results, acc)
  
  print(paste("K =", k, "Accuracy =", acc))
}

# Best K
best_k <- k_values[which.max(accuracy_results)]
print(paste("Best K =", best_k))

# Final model using best K
final_pred <- knn(train = train_scale,
                  test = test_scale,
                  cl = train$Diet,
                  k = best_k)

# Confusion matrix
cm <- table(test$Diet, final_pred)
print(cm)

# Final accuracy
final_accuracy <- mean(final_pred == test$Diet)
print(paste("Final Accuracy =", final_accuracy))