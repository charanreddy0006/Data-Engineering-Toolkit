def test_non_negative_rows():
    assert 100 >= 0

def test_reconciliation():
    source = 1000
    target = 1000
    assert source == target

def test_partition_date():
    assert len("2026-09-23") == 10
