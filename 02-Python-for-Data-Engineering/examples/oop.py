"""
File: oop.py
"""

class Vehicle:

    def __init__(self, brand, model):
        self.brand = brand
        self.model = model

    def display(self):
        print(self.brand, "-", self.model)

car = Vehicle("Mahindra", "XUV700")

car.display()