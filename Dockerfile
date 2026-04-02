FROM python:3.12-slim

RUN pip install --upgrade --no-cache-dir nanobot-ai
WORKDIR /root/.nanobot
EXPOSE 18790
ENTRYPOINT ["nanobot", "gateway"]
