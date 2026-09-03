# 22 — Docker Cheat Sheet

## Version

```bash
docker --version
docker compose version
docker info
```

## Images

```bash
docker images
docker pull <image>
docker build -t app:1.0 .
docker image inspect <image>
docker rmi <image>
```

## Containers

```bash
docker run app:1.0
docker run --rm app:1.0
docker run -d --name app app:1.0
docker ps
docker ps -a
docker logs app
docker logs -f app
docker exec -it app sh
docker inspect app
docker stop app
docker rm app
```

## Ports

```bash
docker run -d -p 8080:80 nginx
```

## Environment

```bash
docker run --rm -e APP_ENV=dev app:1.0
```

## Volumes

```bash
docker volume ls
docker volume create data
docker volume inspect data
```

## Networks

```bash
docker network ls
docker network create data-network
docker network inspect data-network
```

## Compose

```bash
docker compose up
docker compose up -d
docker compose up --build
docker compose ps
docker compose logs
docker compose logs -f etl
docker compose exec <service> sh
docker compose down
docker compose down -v
```

## Mental Model

```text
Dockerfile → Image → Container
                      |
                 +----+----+
                 |         |
               Network   Volume
```
