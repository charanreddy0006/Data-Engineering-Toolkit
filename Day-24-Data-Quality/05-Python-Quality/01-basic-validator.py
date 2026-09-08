from dataclasses import dataclass
from typing import Any

@dataclass
class CheckResult:
    name: str
    passed: bool
    failed_rows: int
    message: str

def not_null(rows: list[dict[str, Any]], field: str) -> CheckResult:
    failures = sum(1 for row in rows if row.get(field) is None)
    return CheckResult(
        name=f"{field}_not_null",
        passed=failures == 0,
        failed_rows=failures,
        message=f"{failures} rows have missing {field}",
    )

def in_range(
    rows: list[dict[str, Any]],
    field: str,
    minimum: float,
    maximum: float,
) -> CheckResult:
    failures = 0
    for row in rows:
        value = row.get(field)
        if value is not None and not minimum <= value <= maximum:
            failures += 1
    return CheckResult(
        name=f"{field}_range",
        passed=failures == 0,
        failed_rows=failures,
        message=f"{failures} rows violate the range",
    )

if __name__ == "__main__":
    rows = [
        {"vehicle_id": "V001", "speed_kmh": 55},
        {"vehicle_id": "V002", "speed_kmh": 88},
        {"vehicle_id": None, "speed_kmh": 401},
    ]
    for result in [
        not_null(rows, "vehicle_id"),
        in_range(rows, "speed_kmh", 0, 350),
    ]:
        print(result)
