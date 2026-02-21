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

### Token

By default, the add-on uses the **Supervisor API token** (auto-provided by Home Assistant). This works for most Core API operations out of the box.

If you need to use a **long-lived access token** instead (e.g., for HACS or certain proxy endpoints), generate one in your HA profile and paste it into the `hass_token` option.

### Options

| Option | Description | Default |
|---|---|---|
| `log_level` | Logging verbosity: `debug`, `info`, `warn`, `error` | `info` |
| `hass_token` | Optional long-lived access token. Leave blank to use the Supervisor token. | _(empty)_ |

## Network

The add-on exposes an HTTP API on **port 3000** with the following endpoints:

| Endpoint | Method | Description |
|---|---|---|
| `/health` | GET | Health check |
| `/list_devices` | GET | List all HA devices |
| `/control` | POST | Control devices |
| `/subscribe_events` | GET | SSE event subscription |
| `/get_sse_stats` | GET | SSE connection stats |

The MCP protocol is also available via stdio for direct LLM integration.

## Connecting an LLM

Point your MCP-compatible LLM client to `http://<your-ha-ip>:3001` to start controlling your smart home with natural language.

### Cursor MCP Config

Add this to your Cursor `mcp.json`:

```json
{
  "mcpServers": {
    "homeassistant": {
      "url": "http://<your-ha-ip>:3001/sse"
    }
  }
}
```
