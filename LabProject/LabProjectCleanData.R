install.packages("dplyr")
install.packages("tidyr")
install.packages("stringr")
install.packages("writexl")

library(dplyr)
library(tidyr)
library(stringr)
library(writexl)

# Read the raw dataset
df_raw <- read.csv("C:/Users/Fatin Ayuni/Documents/DS_TEB2043/LabProject/Unclean Dataset.csv",
                   header = TRUE, stringsAsFactors = FALSE, fill = TRUE)

# Split merged columns and clean text
df_clean <- df_raw %>%
  separate(Student_ID,                    
           into = c("Student_ID","First_Name","Last_Name","Age",
                    "Gender","Course","Enrollment_Date","Total_Payments"),
           sep = "\\|", fill = "right", extra = "merge") %>%
  mutate(across(everything(), ~str_trim(.))) %>%
  mutate(
    Student_ID = as.numeric(Student_ID),
    Age = as.numeric(Age),
    Total_Payments = as.numeric(gsub("[^0-9]", "", Total_Payments)),
    Enrollment_Date = as.Date(Enrollment_Date, format = "%Y-%m-%d")
  ) %>%
  filter(!is.na(Student_ID) & 
           !is.na(First_Name) & 
           !is.na(Last_Name) & 
           !is.na(Enrollment_Date)) %>%
  mutate(
    Course = case_when(
      Course == "Machine Learnin" ~ "Machine Learning",
      Course == "Web Developmen" ~ "Web Development",
      TRUE ~ Course
    ),
    First_Name = str_to_title(First_Name),
    Last_Name = str_to_title(Last_Name),
    Course = str_to_title(Course),
    Gender = toupper(Gender)
  ) %>%
  distinct()

# Save cleaned data to Excel
write_xlsx(df_clean, "C:/Users/Fatin Ayuni/Documents/DS_TEB2043/LabProject/Clean Dataset.csv")

# Check structure and first few rows
str(df_clean)
head(df_clean)