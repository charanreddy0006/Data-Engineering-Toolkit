import pyarrow.parquet as pq

path = "telemetry.parquet"

metadata = pq.read_metadata(path)

print("rows:", metadata.num_rows)
print("row groups:", metadata.num_row_groups)
print("schema:")
print(metadata.schema)

for group_id in range(metadata.num_row_groups):
    group = metadata.row_group(group_id)

    print(
        f"row_group={group_id}",
        f"rows={group.num_rows}",
    )

    for column_id in range(group.num_columns):
        column = group.column(column_id)

        print(
            column.path_in_schema,
            "compressed=",
            column.total_compressed_size,
            "uncompressed=",
            column.total_uncompressed_size,
        )
