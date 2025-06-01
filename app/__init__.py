import os
import logging

LOGLEVEL = os.environ.get('LOGLEVEL', 'DEBUG').upper()
logging.basicConfig(level=LOGLEVEL, format="%(asctime)s %(message)s")

from .server import mcp


def run():
    """Run the MCP server with stdio communication"""
    mcp.run()