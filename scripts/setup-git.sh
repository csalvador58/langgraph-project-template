#!/usr/bin/env bash
# Initialize git repository with first commit

set -e

# Source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

log_info "Setting up git repository..."

# Check if git is already initialized
if [ -d ".git" ]; then
    log_warning "Git repository already exists, skipping initialization"
    exit 0
fi

# Initialize git repository
git init
log_success "Git repository initialized"

# Add all files
git add .
log_success "Added files to git"

# Create initial commit
git commit -m "chore: initial project setup"
log_success "Created initial commit"

log_success "Git setup complete"