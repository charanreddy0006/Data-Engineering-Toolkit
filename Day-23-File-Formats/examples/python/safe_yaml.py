import yaml

with open("pipeline.yml", encoding="utf-8") as f:
    config = yaml.safe_load(f)

if not isinstance(config, dict):
    raise ValueError("YAML root must be a mapping")

pipeline = config.get("pipeline", {})

for field in ("name", "input_format", "output_format"):
    if field not in pipeline:
        raise ValueError(f"Missing configuration: {field}")

print(pipeline)
