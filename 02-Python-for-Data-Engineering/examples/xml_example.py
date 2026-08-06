import xml.etree.ElementTree as ET

tree = ET.parse("vehicle.xml")

root = tree.getroot()

print("Root:", root.tag)

for child in root:
    print(child.tag, ":", child.text)