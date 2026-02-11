#!/usr/bin/env bash
# Generate langgraph.json and .env files

set -e

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

log_info "Generating LangGraph configuration..."

# Generate langgraph.json
create_from_template "$TEMPLATES_DIR/langgraph.json.template" "$AGENT_DIR/langgraph.json"

# Generate .env.example
create_from_template "$TEMPLATES_DIR/env.example.template" "$AGENT_DIR/.env.example"

# Copy .env.example to .env
cp "$AGENT_DIR/.env.example" "$AGENT_DIR/.env"
log_success "Created $AGENT_DIR/.env (copy of .env.example)"

log_success "LangGraph configuration generated"