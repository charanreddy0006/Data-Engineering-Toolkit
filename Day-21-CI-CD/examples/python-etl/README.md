# Python ETL CI Example

Local:

```bash
pip install -r requirements.txt
pytest -q
python -m src.main
```

Docker:

```bash
docker build -t vehicle-etl:test .
docker run --rm vehicle-etl:test
```

The root GitHub Actions workflow runs these tests.
