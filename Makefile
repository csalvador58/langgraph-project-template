# LangGraph Project Initialization & Management
# Main entry point - loads modular makefiles

# Include modular makefiles
include make/config.mk
include make/checks.mk
include make/init.mk
include make/dev.mk
include make/build.mk

.PHONY: help
help:  ## Show this help message
	@echo "$(CYAN)LangGraph Project Commands:$(RESET)"
	@grep -hE '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ":.*## "}; {printf "  $(GREEN)%-20s$(RESET) %s\n", $$1, $$2}'

.DEFAULT_GOAL := help