#!/usr/bin/env bash
# Generate pyproject.toml files for agent and shared packages

set -e

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

log_info "Generating pyproject.toml files..."

# Generate shared package pyproject.toml
create_from_template "$TEMPLATES_DIR/shared-pyproject.toml.template" "$SHARED_DIR/pyproject.toml"

# Create shared __init__.py
touch "$SHARED_DIR/__init__.py"
log_success "Created $SHARED_DIR/__init__.py"

# Generate agent pyproject.toml
create_from_template "$TEMPLATES_DIR/pyproject.toml.template" "$AGENT_DIR/pyproject.toml"

log_success "pyproject.toml files generated"