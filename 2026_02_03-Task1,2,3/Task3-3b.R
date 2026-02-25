

# Add Chemistry and Physics scores
students$Chemistry <- c(59,71,83,68,65,57,62,92,92,59)
students$Physics <- c(89,86,65,52,60,67,40,77,90,61)

# Find failed students (<=49)
chem_fail <- students$Name[students$Chemistry <= 49]
phys_fail <- students$Name[students$Physics <= 49]

# Find highest scores
max_chem <- max(students$Chemistry)
best_chem <- students$Name[students$Chemistry == max_chem]

max_phys <- max(students$Physics)
best_phys <- students$Name[students$Physics == max_phys]


print("Students who failed Chemistry (<=49):")
print(chem_fail)

print("Students who failed Physics (<=49):")
print(phys_fail)

print("Highest Chemistry score:")
print(max_chem)

print("Best Chemistry student:")
print(best_chem)

print("Highest Physics score:")
print(max_phys)

print("Best Physics student:")
print(best_phys)
