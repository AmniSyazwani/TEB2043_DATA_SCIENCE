# Load dataset
data(Theoph)

# Check dataset
head(Theoph)
str(Theoph)

# Create linear model
model <- lm(Dose ~ Weight, data = Theoph)

# View model
print(model)

# Summary
summary(model)

# Plot regression graph
plot(Theoph$Weight, Theoph$Dose,
     main = "Dose vs Weight",
     xlab = "Weight (kg)",
     ylab = "Dose (mg/kg)",
     col = "blue",
     pch = 16)

abline(model, col = "red", lwd = 2)

# Predict for new weights
new_weight <- data.frame(Weight = c(90, 95, 100))
predicted_dose <- predict(model, new_weight)
print(predicted_dose)
