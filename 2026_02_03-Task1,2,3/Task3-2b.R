# Get input
name <- readline("Enter your name: ")
phone <- readline("Enter your phone number: ")

# Convert name to uppercase
new_name <- toupper(name)

# Get first 3 and last 4 digits
first3 <- substr(phone, 1, 3)
last4 <- substr(phone, nchar(phone)-3, nchar(phone))

# Combine phone number
new_phone <- paste0(first3, "****", last4)

# Display result
cat("Name:", new_name, "\n")
cat("Phone:", new_phone, "\n")

# Display message
cat("Hi,", new_name, ". A verification code has been sent to", new_phone, "\n")