# 23 — Installation and Setup

## Windows

Docker Desktop is a common starting point for Docker development on Windows.

After installation:

```powershell
docker --version
docker compose version
docker run --rm hello-world
```

## Linux

Use Docker's official installation documentation for your Linux distribution.

Verify:

```bash
docker --version
docker compose version
```

## First Test

```bash
docker run --rm hello-world
```

This confirms that the Docker client can communicate with the Docker engine and that an image can be pulled and executed.

## Repository Setup

```bash
cd Day-19-Docker
```

Start with:

```text
examples/01-beginner-python
```

Then:

```text
examples/02-python-postgres
```

Then:

```text
automobile-project
```

## Troubleshooting

### Docker command not found

Verify Docker is installed and restart the terminal if required.

### Docker daemon unavailable

Start Docker Desktop or the Docker service appropriate to your OS.

### Linux permission issue

Use the official Docker post-installation guidance rather than random permission changes.

## Important

Installation commands can change between versions and operating systems. Use official Docker documentation for the current procedure.
