from math import sqrt

def population_mean(values):
    return sum(values) / len(values)

def population_std(values):
    m = population_mean(values)
    return sqrt(sum((x - m) ** 2 for x in values) / len(values))

baseline = [45, 47, 46, 44, 48, 46]
current = [72, 70, 75, 73, 74, 71]

print("baseline_mean:", population_mean(baseline))
print("current_mean:", population_mean(current))
print("baseline_std:", population_std(baseline))
print("current_std:", population_std(current))
print("Interpret results with business context; this is not a drift test by itself.")
