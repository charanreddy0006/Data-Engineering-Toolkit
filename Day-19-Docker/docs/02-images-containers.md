# 02 — Images and Containers

## Image

An image is a packaged filesystem and metadata used to create containers.

Examples:

```text
python:3.12-slim
postgres:16
redis:7
```

Pull:

```bash
docker pull python:3.12-slim
```

List:

```bash
docker image ls
```

Inspect:

```bash
docker image inspect python:3.12-slim
```

## Container

A container is a runtime instance of an image:

```bash
docker run -d --name web nginx
```

Then:

```bash
docker ps
docker stop web
docker rm web
```

## Relationship

```text
             +--> Container A
Image ------+--> Container B
             +--> Container C
```

## Image Layers

A simplified image:

```text
+---------------------------+
| Application layer         |
+---------------------------+
| Dependency layer          |
+---------------------------+
| Base OS/runtime layer     |
+---------------------------+
```

A running container adds a writable layer.

Important:

> Do not rely on the container writable layer as the only storage for important database data.

## Tags

Example:

```text
automotive-etl:1.0.0
```

Tags help identify releases.

For stronger artifact identity, immutable digests can also be used.

## Registry

```text
Build
 ↓
Image
 ↓
Push
 ↓
Registry
 ↓
Pull
 ↓
Deployment
```

## Automobile Example

A telemetry parser can be distributed as:

```text
company/telemetry-parser:1.4.0
```

CI can test that artifact before it is deployed.

## Important Interview Answer

Image and container are not the same.

> An image is a packaged template/artifact. A container is a runtime instance of an image.
