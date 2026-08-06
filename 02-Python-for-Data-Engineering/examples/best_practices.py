vehicle_name = "Mahindra XUV700"
vehicle_price = 2200000

gst = 0.18

final_price = vehicle_price * (1 + gst)

print(f"Vehicle : {vehicle_name}")
print(f"Final Price : ₹{final_price:,.2f}")