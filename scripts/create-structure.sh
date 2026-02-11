#!/usr/bin/env bash
# Create project directory structure

set -e

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

log_info "Creating directory structure..."

# Create main directories
ensure_directory "$AGENT_DIR/src/graphs/agent-feedback"
ensure_directory "$AGENT_DIR/src/graphs/human-feedback"
ensure_directory "$AGENT_DIR/src/graphs/coordinator"
ensure_directory "$AGENT_DIR/src/graphs/logger"
ensure_directory "$AGENT_DIR/src/nodes"
ensure_directory "$AGENT_DIR/src/skills"
ensure_directory "$AGENT_DIR/src/config"
ensure_directory "$AGENT_DIR/tests"
ensure_directory "$SHARED_DIR"
ensure_directory "ui/macos"
ensure_directory "ui/web"
ensure_directory ".github/workflows"
ensure_directory "logs"

# Create .python-version
echo "$PYTHON_VERSION" > .python-version
log_success "Created .python-version"

# Create .gitignore from template
create_from_template "$TEMPLATES_DIR/gitignore.template" ".gitignore"

# Create README from template
create_from_template "$TEMPLATES_DIR/README.md.template" "README.md"

# Create empty CHANGELOG
touch CHANGELOG.md
log_success "Created CHANGELOG.md"

log_success "Directory structure created"