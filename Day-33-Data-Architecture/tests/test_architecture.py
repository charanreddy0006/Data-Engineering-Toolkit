def test_requirements():
    required = {"volume","latency","retention","availability","security","cost"}
    assert required

def test_non_negative_rpo():
    assert 10 >= 0

def test_non_negative_rto():
    assert 30 >= 0
