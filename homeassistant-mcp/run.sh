#!/bin/sh
set -e

CONFIG_PATH=/data/options.json

LOG_LEVEL="info"
HASS_TOKEN_OPT=""
MCP_API_KEY_OPT=""

if [ -f "$CONFIG_PATH" ]; then
    LOG_LEVEL=$(jq -r '.log_level // "info"' "$CONFIG_PATH")
    HASS_TOKEN_OPT=$(jq -r '.hass_token // ""' "$CONFIG_PATH")
    MCP_API_KEY_OPT=$(jq -r '.mcp_api_key // ""' "$CONFIG_PATH")
fi

if [ -n "$HASS_TOKEN_OPT" ]; then
    export HASS_TOKEN="$HASS_TOKEN_OPT"
    export HASS_HOST="http://homeassistant:8123"
    export HASS_SOCKET_URL="ws://homeassistant:8123/api/websocket"
else
    export HASS_TOKEN="${SUPERVISOR_TOKEN}"
    export HASS_HOST="http://supervisor/core"
    export HASS_SOCKET_URL="ws://supervisor/core/api/websocket"
fi

export PORT=3000
export MCP_TRANSPORT=sse
export MCP_API_KEY="$MCP_API_KEY_OPT"
export NODE_ENV=production
export LOG_LEVEL

echo "Starting Home Assistant MCP Server..."
echo "  HASS_HOST:    ${HASS_HOST}"
echo "  MCP SSE:      port ${PORT} (/sse)"
echo "  LOG_LEVEL:    ${LOG_LEVEL}"
echo "  Token source: $([ -n "$HASS_TOKEN_OPT" ] && echo 'user-provided' || echo 'supervisor')"
echo "  API key auth: $([ -n "$MCP_API_KEY" ] && echo 'enabled' || echo 'DISABLED - set mcp_api_key in config!')"

cd /app
exec node dist/src/index.js
