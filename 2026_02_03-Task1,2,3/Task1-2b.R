# Get input
weight <- as.numeric(readline("Enter your weight (kg): "))
height_cm <- as.numeric(readline("Enter your height (cm): "))

# Convert cm to meter
height_m <- height_cm / 100

# Calculate BMI
bmi <- weight / (height_m^2)

# Display BMI
cat("Your BMI is:", round(bmi, 2), "\n")

# Determine category
if (bmi < 18.5) {
  cat("Status: Underweight\n")
} else if (bmi < 25) {
  cat("Status: Normal\n")
} else if (bmi < 30) {
  cat("Status: Overweight\n")
} else {
  cat("Status: Obese\n")
}