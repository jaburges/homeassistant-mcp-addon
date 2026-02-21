FROM node:20-alpine

RUN apk add --no-cache \
    jq \
    git \
    curl \
    python3 \
    make \
    g++

WORKDIR /app

ARG BUILD_VERSION
RUN echo "Building version: ${BUILD_VERSION}" && \
    git clone --depth 1 https://github.com/jaburges/homeassistant-mcp.git .

RUN npm install --production=false

RUN npm run build

COPY run.sh /run.sh
RUN sed -i 's/\r$//' /run.sh && chmod a+x /run.sh

EXPOSE 3000

ENTRYPOINT ["/run.sh"]
