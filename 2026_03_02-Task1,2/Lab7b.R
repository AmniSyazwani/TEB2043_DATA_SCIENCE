# Check working directory
getwd()
list.files()

# Import data
library(readxl)
titanic <- read.csv("titanic.csv")
View(titanic)


# Check NA values
sum(is.na(titanic)) 
which(is.na(titanic)) 
print(sapply(titanic, function(x) sum(is.na(x))))

# Remove NA
dim(titanic) 
titanic_cleaned <- na.omit(titanic) 
dim(titanic_cleaned)

# Install and load dplyr
install.packages("dplyr")  
library(dplyr) 

# Check column names
colnames(titanic_cleaned)

# Rename columns (if needed)
names(titanic_cleaned) <- gsub(" ", "_", colnames(titanic_cleaned)) 
names(titanic_cleaned)

# Export CSV
write.csv(titanic_cleaned, "titanic_cleaned.csv")

# Import cleaned data
library(readxl)
titanic_cleaned <- read.csv("titanic_cleaned.csv")
View(titanic_cleaned)
print("=== Survival by Class ===")



# Report Writing
print("=== Survival by Embark Location Report ===")

embark_tab <- prop.table(
  table(titanic_cleaned$Embarked, titanic_cleaned$Survived), 1) * 100

for (i in rownames(Embark_tab)) {
  survived <- round(Embark_tab[i, "1"], 2)
  
  print(paste(
    survived, "% of passengers who embarked from", i,
    "survived."
  ))
}

print("=== Adult vs Child Survival Report ===")

# Create age group column
titanic_cleaned$AgeGroup <- ifelse( titanic_cleaned$Age < 18, "Child","Adult")

age_tab <- prop.table(table(titanic_cleaned$AgeGroup, titanic_cleaned$Survived), 1) * 100

for (i in rownames(age_tab)) {
  survived <- round(age_tab[i, "1"], 2)
  
  print(paste( survived, "% of", i, "passengers survived."))
}

print("=== Survival by Gender Report ===")

gender_tab <- prop.table( table(titanic_cleaned$Sex, titanic_cleaned$Survived), 1) * 100

for (i in rownames(gender_tab)) {survived <- round(gender_tab[i, "1"], 2)
  
  print(paste(survived, "% of", i, "passengers survived."))
}