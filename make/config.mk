# Shared configuration and variables

# Colors for output
CYAN := \033[0;36m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
RESET := \033[0m

# Project paths
AGENT_DIR := agents/default
SHARED_DIR := shared
SCRIPTS_DIR := scripts
TEMPLATES_DIR := templates

# Python configuration
PYTHON_VERSION := 3.13

# Export variables for scripts
export CYAN GREEN YELLOW RED RESET
export AGENT_DIR SHARED_DIR PYTHON_VERSION
export SCRIPTS_DIR TEMPLATES_DIR