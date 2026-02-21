# Home Assistant MCP Server

A Model Context Protocol (MCP) server that bridges Home Assistant and LLMs, enabling natural language control and monitoring of your smart home devices.

## Features

- **Device Control** - Lights, switches, covers, climate, and more
- **State Monitoring** - Real-time entity state via SSE
- **Automations** - List, toggle, trigger, and CRUD management
- **Scenes** - List and activate scenes
- **Notifications** - Send notifications through HA
- **Add-on Management** - Manage HA add-ons
- **HACS Packages** - Manage custom components

## Configuration

### API Key (Recommended)

Set `mcp_api_key` to a secret string of your choice. This protects the MCP endpoint so only clients with the key can connect. Without it, anyone on your network could control your smart home.

### Token

By default, the add-on uses the **Supervisor API token** (auto-provided by Home Assistant). This works for most Core API operations out of the box.

If you need to use a **long-lived access token** instead (e.g., for HACS or certain proxy endpoints), generate one in your HA profile and paste it into the `hass_token` option.

### Options

| Option | Description | Default |
|---|---|---|
| `mcp_api_key` | Secret key to protect the MCP endpoint. **Set this!** | _(empty)_ |
| `log_level` | Logging verbosity: `debug`, `info`, `warn`, `error` | `info` |
| `hass_token` | Optional long-lived access token. Leave blank to use the Supervisor token. | _(empty)_ |

## Connecting from Cursor

Add this to your Cursor `mcp.json`:

```json
{
  "mcpServers": {
    "homeassistant": {
      "url": "http://<your-ha-ip>:3001/sse?api_key=<your-mcp-api-key>"
    }
  }
}
```

Replace `<your-ha-ip>` with your Home Assistant IP and `<your-mcp-api-key>` with the key you set in the add-on config.

## Network

The add-on exposes the MCP SSE endpoint on **port 3001** (host).

| Endpoint | Method | Description |
|---|---|---|
| `/sse` | GET | MCP SSE connection (requires `api_key`) |
| `/message` | POST | MCP message endpoint (requires `api_key`) |
| `/health` | GET | Health check |
