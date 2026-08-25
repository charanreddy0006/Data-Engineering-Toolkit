from pathlib import Path

DAGS = Path(__file__).resolve().parents[1] / "dags"

def test_basic_dag_exists():
    assert (DAGS / "basic_etl.py").exists()

def test_automobile_dag_exists():
    assert (DAGS / "automobile_service_dag.py").exists()

def test_basic_dag_has_dependencies():
    text = (DAGS / "basic_etl.py").read_text()
    assert "extract" in text
    assert "validate" in text
    assert "transform" in text
    assert "load" in text
