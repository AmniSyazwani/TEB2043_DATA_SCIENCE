# Check working directory
getwd()
list.files()

# Import data
library(readxl)
titanic <- read.csv("D:/AMNI/UTP/2nd Year 2nd Sem/DS_TEB2043/2026_03_02-Task1,2/titanic.csv")
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

for (i in rownames(embark_tab)) {
  survived <- round(embark_tab[i, "1"], 2)
  
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

print("=== Scatterplot: Age vs Fare ===")

plot(x = titanic_cleaned$Age,
     y = titanic_cleaned$Fare,
     xlab = "Passenger Age",
     ylab = "Ticket Fare",
     main = "Age vs Fare of Titanic Passengers",
     col = "blue",
     pch = 19)

print("=== Bar Chart: Passenger Count by Class ===")

class_count <- table(titanic_cleaned$Pclass)

barplot(class_count,
        xlab = "Passenger Class",
        ylab = "Number of Passengers",
        main = "Number of Passengers by Class",
        col = c("red","yellow","green"))

print("=== Histogram: Fare Distribution ===")

hist(titanic_cleaned$Fare,
     xlab = "Ticket Fare",
     col = "lightblue",
     border = "black",
     main = "Distribution of Titanic Ticket Fares")


print("=== Pie Chart: Survival Distribution ===")

survival_counts <- table(titanic_cleaned$Survived)

pie(survival_counts,
    labels = c("Died","Survived"),
    main = "Titanic Survival Distribution",
    col = rainbow(length(survival_counts)))