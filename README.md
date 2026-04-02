# nanobot Docker Builder

This repository provides a pipeline to monitor [HKUDS/nanobot](https://github.com/HKUDS/nanobot) and automatically rebuild a Docker image when the upstream repository updates.

## How It Works

- Every hour (or via manual trigger), GitHub Actions checks if the upstream repository (`HKUDS/nanobot`) has a new commit.
- If an update is detected, the pipeline rebuilds a Docker image using the latest `nanobot-ai` Python package.
- The Dockerfile installs the latest `nanobot-ai` package and exposes the local gateway.

## Dockerfile

```dockerfile
FROM python:3.14-slim

RUN pip install --upgrade --no-cache-dir nanobot-ai
WORKDIR /root/.nanobot
EXPOSE 18790
ENTRYPOINT ["nanobot", "gateway"]
```

## Usage

1. **Configure Docker image pushing:**
   Add the following secrets to your repository:
   - `DOCKERHUB_USERNAME` — your Docker Hub username
   - `DOCKERHUB_TOKEN` — your Docker Hub access token

2. **Manual triggering:**
   You can run the workflow manually from the GitHub Actions UI.

3. **Customization:**
   Update the Dockerfile or workflow as needed to fit your registry or build requirements.

## License

MIT
