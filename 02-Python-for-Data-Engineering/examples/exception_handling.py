"""
File: exception_handling.py
"""

try:
    value = int(input("Enter a number: "))
    print(value)
except ValueError:
    print("Invalid number entered.")
finally:
    print("Program Finished.")