ARG BUILD_FROM=node:20-alpine
FROM ${BUILD_FROM}

RUN apk add --no-cache jq git curl

WORKDIR /app

RUN git clone --depth 1 https://github.com/jaburges/homeassistant-mcp.git .

RUN npm install

RUN npm run build

COPY run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 3000

ENTRYPOINT ["/run.sh"]
