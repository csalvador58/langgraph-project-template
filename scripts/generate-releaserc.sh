#!/usr/bin/env bash
# Generate .releaserc.json for semantic-release

set -e

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

log_info "Generating semantic-release configuration..."

# Generate .releaserc.json
create_from_template "$TEMPLATES_DIR/releaserc.json.template" ".releaserc.json"

log_success "Semantic-release configuration generated"