def test_battery_soc_range():
    values = [0, 25, 50, 75, 100]
    assert all(0 <= value <= 100 for value in values)

def test_non_negative_counts():
    values = [0, 1, 5, 20]
    assert all(value >= 0 for value in values)
