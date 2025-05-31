# MCP server Dockerfile for Claude Desktop integration
FROM ghcr.io/astral-sh/uv:0.6.6-python3.13-bookworm
WORKDIR /
ENTRYPOINT ["./entrypoint.sh"]
RUN apt-get update && \
    apt-get install -y git && \
    git clone https://www.github.com/Teagan42/mcpo.git && \
    cd mcpo && \
    uv add websockets

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Set environment for MCP communication
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

# Install package with UV (using --system flag)
RUN uv pip install --system websockets && \
    uv pip install --system -e .

# Run the MCP server with stdio communication using the module directly
CMD ["python", "-m", "app"]