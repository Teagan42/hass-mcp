import os
import re
from typing import Optional

# Home Assistant configuration
HA_URL: str = os.environ.get("HA_URL", "http://localhost:8123")
HA_TOKEN: str = os.environ.get("HA_TOKEN", "")
HA_FILTER_EXPOSED: bool = os.environ.get("HA_FILTER_EXPOSED", "false").lower() in ["1", "true", "yes"]
HA_WS_URL: str = re.sub(r"\/?$", "/api/websocket", HA_URL.replace("http", "ws"))

def get_ha_headers() -> dict:
    """Return the headers needed for Home Assistant API requests"""
    headers = {
        "Content-Type": "application/json",
    }
    
    # Only add Authorization header if token is provided
    if HA_TOKEN:
        headers["Authorization"] = f"Bearer {HA_TOKEN}"
    
    return headers
