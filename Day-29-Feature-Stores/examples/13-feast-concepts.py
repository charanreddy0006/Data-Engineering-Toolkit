# Illustrative Feast-style definitions.
# Exact syntax depends on the installed Feast release.

# Conceptual structure:
#
# entity = Entity(name="vehicle", join_keys=["vehicle_id"])
#
# feature_view = FeatureView(
#     name="vehicle_health",
#     entities=[entity],
#     schema=[
#         Field(name="fault_count_24h", dtype=Int64),
#         Field(name="battery_soc_latest", dtype=Float32),
#     ],
#     source=...
# )

print("Use the official Feast documentation for release-specific APIs.")
