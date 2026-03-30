# Load built-in dataset
data(mtcars)

# View first rows
print(head(mtcars))

# ==============================
# 1) Scatterplot: Weight vs MPG
# ==============================
print("=== Scatterplot: Weight vs MPG ===")

plot(mtcars$wt,
     mtcars$mpg,
     xlab = "Car Weight",
     ylab = "Miles Per Gallon (MPG)",
     main = "Weight vs Fuel Efficiency",
     col = "blue",
     pch = 19)

print("Observation: Heavier cars tend to have lower MPG.")

# ==============================
# 2) Bar Chart: Number of Cars by Cylinders
# ==============================
print("=== Bar Chart: Cars by Cylinder ===")

cyl_count <- table(mtcars$cyl)

barplot(cyl_count,
        xlab = "Number of Cylinders",
        ylab = "Number of Cars",
        main = "Cars by Cylinder Count",
        col = c("red","yellow","green"))

print("Observation: Most cars in this dataset have 8 cylinders.")

# ==============================
# 3) Histogram: MPG Distribution
# ==============================
print("=== Histogram: MPG Distribution ===")

hist(mtcars$mpg,
     xlab = "Miles Per Gallon",
     main = "Distribution of MPG",
     col = "lightblue",
     border = "black")

print("Observation: Most cars have MPG between 15 and 25.")