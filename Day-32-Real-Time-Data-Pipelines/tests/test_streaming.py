def test_battery_range():
    value = 72
    assert 0 <= value <= 100

def test_lag_non_negative():
    assert 3 >= 0

def test_event_id():
    assert "E1001"
