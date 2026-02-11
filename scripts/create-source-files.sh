#!/usr/bin/env bash
# Create initial Python source files from templates

set -e

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

log_info "Creating Python source files..."

# Create __init__.py files
touch "$AGENT_DIR/src/__init__.py"
touch "$AGENT_DIR/src/graphs/__init__.py"
touch "$AGENT_DIR/src/graphs/agent-feedback/__init__.py"
touch "$AGENT_DIR/src/graphs/human-feedback/__init__.py"
touch "$AGENT_DIR/src/graphs/coordinator/__init__.py"
touch "$AGENT_DIR/src/graphs/logger/__init__.py"
touch "$AGENT_DIR/src/nodes/__init__.py"
touch "$AGENT_DIR/src/skills/__init__.py"
touch "$AGENT_DIR/src/config/__init__.py"
touch "$AGENT_DIR/tests/__init__.py"
log_success "Created __init__.py files"

# Create main graph from template (cloud providers)
create_from_template "$TEMPLATES_DIR/python/main_graph.py.template" "$AGENT_DIR/src/graphs/main.py"

# Create LM Studio example graph
create_from_template "$TEMPLATES_DIR/python/main_graph_lmstudio.py.template" "$AGENT_DIR/src/graphs/main_graph_lmstudio.py"
log_info "LM Studio example available at: $AGENT_DIR/src/graphs/main_graph_lmstudio.py"

# Create test file from template
create_from_template "$TEMPLATES_DIR/python/test_graph.py.template" "$AGENT_DIR/tests/test_graph.py"

log_success "Python source files created"