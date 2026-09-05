from src.main import normalize


def test_normalize():
    result = normalize({
        "event_id": " evt-1 ",
        "vehicle_id": " VH-1 ",
        "speed_kph": "55.2",
    })

    assert result == {
        "event_id": "evt-1",
        "vehicle_id": "VH-1",
        "speed_kph": 55.2,
    }
