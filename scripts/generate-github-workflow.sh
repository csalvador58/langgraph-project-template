#!/usr/bin/env bash
# Generate GitHub Actions workflow for semantic-release

set -e

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

log_info "Generating GitHub Actions workflow..."

# Generate GitHub Actions workflow
create_from_template "$TEMPLATES_DIR/github-workflow.yml.template" ".github/workflows/release.yml"

log_success "GitHub Actions workflow generated"