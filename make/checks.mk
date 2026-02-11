# Validation and prerequisite checks

.PHONY: check-not-initialized check-tools check-uv

check-not-initialized:  ## Check if project is not already initialized
	@if [ -d "$(AGENT_DIR)" ] || [ -d "$(SHARED_DIR)" ] || [ -d ".github" ]; then \
		echo "$(RED)✗ Project already initialized (found $(AGENT_DIR), $(SHARED_DIR), or .github)$(RESET)"; \
		exit 1; \
	fi
	@if [ -d ".git" ]; then \
		echo "$(YELLOW)⚠  Git repository already exists, skipping git init$(RESET)"; \
	fi

check-tools:  ## Check if required tools are installed
	@command -v git >/dev/null 2>&1 || { \
		echo "$(RED)✗ git is required but not installed$(RESET)"; \
		exit 1; \
	}

check-uv:  ## Check if uv is installed, offer to install if missing
	@if ! command -v uv &> /dev/null; then \
		echo "$(CYAN)Installing uv...$(RESET)"; \
		curl -LsSf https://astral.sh/uv/install.sh | sh; \
		if [ $$? -ne 0 ]; then \
			echo "$(RED)✗ Failed to install uv$(RESET)"; \
			exit 1; \
		fi; \
		echo "$(GREEN)✓ uv installed successfully$(RESET)"; \
		echo "$(YELLOW)⚠  Please restart your shell or run: source ~/.bashrc (or ~/.zshrc)$(RESET)"; \
		exit 1; \
	fi