
# Create list
students <- list(
  Name = c("Robert","Hemsworth","Scarlett","Evans","Pratt",
           "Larson","Holland","Paul","Simu","Renner"),
  Score = c(59,71,83,68,65,57,62,92,92,59)
)

# Calculate values
highest <- max(students$Score)
lowest <- min(students$Score)
average <- mean(students$Score)

# Find students
highest_student <- students$Name[students$Score == highest]
lowest_student <- students$Name[students$Score == lowest]


print("Highest score:")
print(highest)

print("Lowest score:")
print(lowest)

print("Average score:")
print(average)

print("Student with highest score:")
print(highest_student)

print("Student with lowest score:")
print(lowest_student)
