# Illustrative expectation definitions.
# Verify exact GX API syntax against your installed release.

expectations = [
    {
        "expectation": "expect_column_values_to_not_be_null",
        "column": "vehicle_id",
    },
    {
        "expectation": "expect_column_values_to_be_between",
        "column": "speed_kmh",
        "min_value": 0,
        "max_value": 350,
    },
    {
        "expectation": "expect_column_values_to_be_unique",
        "column": "event_id",
    },
]

for expectation in expectations:
    print(expectation)
