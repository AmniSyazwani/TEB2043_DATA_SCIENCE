
# Input vector
scores <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61,
            13, 44, 26, 24, 73, 73, 90, 39, 90, 54)

# Check pass or fail (>49)
pass_status <- scores > 49

# Assign grades
grades <- ifelse(scores >= 90, "A",
                 ifelse(scores >= 80, "B",
                        ifelse(scores >= 70, "C",
                               ifelse(scores >= 60, "D",
                                      ifelse(scores >= 50, "E", "F")))))

# Count students in each grade
grade_count <- table(grades)

# Convert to vertical table
grade_table <- data.frame(
  Grade = names(grade_count),
  Count = as.vector(grade_count)
)

# Display output

print(" Pass Status (TRUE = Pass, FALSE = Fail):")
print(pass_status)

print(" Grades for Each Student:")
print(grades)

print(" Number of Students for Each Grade:")
print(grade_table)
