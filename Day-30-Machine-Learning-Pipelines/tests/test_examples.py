def test_battery_range():
    value = 75
    assert 0 <= value <= 100

def test_distance():
    value = 125.4
    assert value >= 0

def test_vehicle_id():
    vehicle_id = "V1001"
    assert vehicle_id
