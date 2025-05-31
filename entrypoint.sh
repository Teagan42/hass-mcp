#!/bin/bash
export PATH="$PATH;/usr/local/bin"

if [[ -z "$@" ]]; then
  exec "$@"
  exit 0
fi

if [[ -z "$HA_URL" ]]; then
  echo "ENV Missing: HA_URL"
  exit 1
fi

if [[ -z "$HA_TOKEN" ]]; then
  echo "ENV Missing: HA_TOKEN"
  exit 2
fi

export HA_URL=$HA_URL
export HA_TOKEN=$HA_TOKEN
export HA_FILTER_EXPOSED="${HA_FILTER_EXPOSED:-false}"
server_cmd=(uvx /mcpo --host "${HOST:-0.0.0.0}" --port "${MCPO_PORT:-3000}" --)


# Combine everything into one final command
#source .venv/bin/activate
exec "${server_cmd[@]}" "$@"
#exec "/bin/bash"