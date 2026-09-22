import pytest

def validate_battery_soc(value):
    if not 0 <= value <= 100:
        raise ValueError("battery_soc out of range")

def test_valid_soc():
    validate_battery_soc(65)

def test_invalid_soc():
    with pytest.raises(ValueError):
        validate_battery_soc(125)
