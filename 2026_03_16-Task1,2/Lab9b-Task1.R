# Load dataset
data("ToothGrowth")
head(ToothGrowth)

# Check structure
str(ToothGrowth)

# Convert supplement type into numeric
ToothGrowth$supp_num <- ifelse(ToothGrowth$supp == "OJ", 1, 0)

# Select only numeric columns
tg_data <- ToothGrowth[, c("len", "dose", "supp_num")]

# Compute correlation matrix
corr_mat <- cor(tg_data)
print(corr_mat)

# Install packages if needed
install.packages("ggcorrplot")
library(ggcorrplot)

# Plot heatmap
ggcorrplot(corr_mat, lab = TRUE)