# Home Assistant MCP Add-on Repository

[![Home Assistant Add-on](https://img.shields.io/badge/Home%20Assistant-Add--on-blue.svg)](https://www.home-assistant.io/addons/)

A Home Assistant add-on that runs the [Home Assistant MCP Server](https://github.com/jaburges/homeassistant-mcp) — a Model Context Protocol bridge that lets LLMs control and monitor your smart home.

## Installation

1. In Home Assistant, navigate to **Settings → Add-ons → Add-on Store**
2. Click the **⋮** menu (top right) → **Repositories**
3. Add this repository URL:

   ```
   https://github.com/jaburges/homeassistant-mcp-addon
   ```

4. Click **Add**, then close the dialog
5. Find **Home Assistant MCP Server** in the add-on store and click **Install**
6. Once installed, go to the **Configuration** tab to set options
7. Start the add-on

## Add-ons in this repository

### [Home Assistant MCP Server](./homeassistant-mcp)

MCP server for LLM integration with Home Assistant. Exposes device control, automation management, scene activation, notifications, and real-time state monitoring via HTTP API and SSE.

## Support

- [Source Code (MCP Server)](https://github.com/jaburges/homeassistant-mcp)
- [Issues](https://github.com/jaburges/homeassistant-mcp-addon/issues)
