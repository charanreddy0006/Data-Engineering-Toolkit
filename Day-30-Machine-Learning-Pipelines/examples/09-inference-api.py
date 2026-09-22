from fastapi import FastAPI
from pydantic import BaseModel, Field

app = FastAPI(title="Maintenance Risk API")

class Request(BaseModel):
    vehicle_id: str = Field(min_length=1)

@app.post("/v1/predict")
def predict(request: Request):
    return {
        "vehicle_id": request.vehicle_id,
        "risk_score": 0.82,
        "model_version": "maintenance-risk-v1"
    }
