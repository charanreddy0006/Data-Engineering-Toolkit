"""
File: control_flow.py
Description: Demonstrates if, loops, break, and continue.
"""

marks = 85

if marks >= 35:
    print("Pass")
else:
    print("Fail")

print()

print("For Loop")

for i in range(1, 6):
    print(i)

print()

print("While Loop")

count = 1

while count <= 5:
    print(count)
    count += 1

print()

print("Break Example")

for i in range(10):

    if i == 5:
        break

    print(i)

print()

print("Continue Example")

for i in range(5):

    if i == 2:
        continue

    print(i)