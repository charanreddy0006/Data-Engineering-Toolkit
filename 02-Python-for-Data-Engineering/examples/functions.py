"""
File: functions.py
Description: Demonstrates Python functions.
"""

def greet():
    print("Welcome to Data Engineering Toolkit")


def square(number):
    return number * number


def calculate_speed(distance, time):
    return distance / time


greet()

print("Square:", square(8))

print("Average Speed:", calculate_speed(240, 3), "km/h")