"""
File: file_handling.py
"""

with open("sample.txt", "w") as file:
    file.write("Vehicle Sales Report\n")

with open("sample.txt", "r") as file:
    print(file.read())