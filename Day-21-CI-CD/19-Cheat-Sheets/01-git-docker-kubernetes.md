# Git + Docker + Kubernetes CI/CD Cheat Sheet

```bash
git checkout -b feature/change
git add .
git commit -m "Add change"
git push -u origin feature/change

pytest -q

docker build -t app:test .
docker run --rm app:test

kubectl apply -f deployment.yaml
kubectl rollout status deployment/app
kubectl rollout undo deployment/app
```

Mental model:

```text
Git → CI → artifact → registry → CD → Kubernetes → verify
```
