# Get input
str1 <- readline("Enter first string: ")
str2 <- readline("Enter second string: ")

# Convert to lowercase
s1 <- tolower(str1)
s2 <- tolower(str2)

# Compare
if (s1 == s2) {
  cat("Both strings are the same (case-insensitive).\n")
} else {
  cat("Both strings are different.\n")
}