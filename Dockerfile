FROM python:3.14-slim

ARG NANOBOT_VERSION=main
ENV NANOBOT_VERSION=$NANOBOT_VERSION

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    fzf \
    && curl -fsSL https://deb.nodesource.com/setup_25.x | bash - \
    && apt-get install -y nodejs \
    && git clone --depth 1 https://github.com/HKUDS/nanobot.git /opt/nanobot && \
    cd /opt/nanobot && \
    git fetch --depth 1 origin "$NANOBOT_VERSION" && \
    git checkout "$NANOBOT_VERSION" && \
    pip install --no-cache-dir /opt/nanobot && \
    cd / && \
    rm -rf /opt/nanobot && \
    apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

WORKDIR /root/.nanobot
EXPOSE 18790

ENTRYPOINT ["nanobot"]
CMD ["status"]
