import json

vehicle = {
    "brand": "Tesla",
    "model": "Model Y",
    "price": 6200000
}

with open("vehicle.json", "w") as file:
    json.dump(vehicle, file, indent=4)

with open("vehicle.json") as file:
    data = json.load(file)

print(data)