import pandas as pd

def test_speed_range():
    df = pd.DataFrame({"speed_kmh": [0, 50, 350]})
    assert df["speed_kmh"].between(0, 350).all()

def test_soc_range():
    df = pd.DataFrame({"battery_soc": [0, 50, 100]})
    assert df["battery_soc"].between(0, 100).all()

def test_vehicle_id_required():
    df = pd.DataFrame({"vehicle_id": ["V001", "V002"]})
    assert df["vehicle_id"].notna().all()
