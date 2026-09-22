from dataclasses import dataclass

@dataclass
class Metrics:
    precision: float
    recall: float
    f1: float

def passes_gate(metrics: Metrics, minimum_f1=0.80):
    return metrics.f1 >= minimum_f1

m = Metrics(0.86, 0.81, 0.835)
print({"passes": passes_gate(m)})
