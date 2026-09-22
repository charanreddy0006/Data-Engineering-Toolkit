from dataclasses import dataclass

@dataclass
class Artifact:
    name: str
    rows: int

def validate(values):
    clean = [float(x) for x in values if x is not None]
    if not clean:
        raise ValueError("No usable training data")
    return clean

def train(values):
    return Artifact("maintenance-demo-v1", len(values))

data = [10, 20, None, 30]
clean = validate(data)
print(train(clean))
