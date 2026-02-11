#!/usr/bin/env bash
# Shared utility functions for scripts

# Color output functions
log_info() {
    echo -e "${CYAN}$1${RESET}"
}

log_success() {
    echo -e "${GREEN}✓ $1${RESET}"
}

log_warning() {
    echo -e "${YELLOW}⚠  $1${RESET}"
}

log_error() {
    echo -e "${RED}✗ $1${RESET}"
}

# Check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Create a file from a template with variable substitution
create_from_template() {
    local template_file="$1"
    local output_file="$2"
    
    if [ ! -f "$template_file" ]; then
        log_error "Template not found: $template_file"
        return 1
    fi
    
    # Use envsubst to replace environment variables in template
    envsubst < "$template_file" > "$output_file"
    
    if [ $? -eq 0 ]; then
        log_success "Created: $output_file"
        return 0
    else
        log_error "Failed to create: $output_file"
        return 1
    fi
}

# Create a directory if it doesn't exist
ensure_directory() {
    local dir="$1"
    
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        log_success "Created directory: $dir"
    fi
}