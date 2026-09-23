# 8. Full Loads

A full load processes all source records.

## Advantages
- simple
- easy to validate
- easy to rebuild

## Disadvantages
- expensive at scale
- longer runtime
- higher source load

## Good use cases
- small reference tables
- initial loads
- occasional complete rebuilds

## Automobile

A small vehicle-model reference table may be fully refreshed because its size is manageable.

Do not blindly use full loads for massive event tables.
