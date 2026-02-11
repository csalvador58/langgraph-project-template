# Development targets

.PHONY: setup dev test lint format logs clean

setup: check-uv  ## Install Python dependencies with uv
	@echo "$(CYAN)Installing dependencies...$(RESET)"
	@cd $(AGENT_DIR) && uv sync --all-extras
	@if [ $$? -eq 0 ]; then \
		echo "$(GREEN)✓ Dependencies installed$(RESET)"; \
	else \
		echo "$(RED)✗ Failed to install dependencies$(RESET)"; \
		exit 1; \
	fi

dev:  ## Start LangGraph development server
	@if [ ! -d "$(AGENT_DIR)" ]; then \
		echo "$(RED)✗ Agent directory not found. Run 'make init' first.$(RESET)"; \
		exit 1; \
	fi
	@echo "$(CYAN)Starting LangGraph development server...$(RESET)"
	@echo "$(YELLOW)Server will be available at: http://localhost:8123$(RESET)"
	@cd $(AGENT_DIR) && uv run langgraph dev

test:  ## Run pytest tests
	@if [ ! -d "$(AGENT_DIR)" ]; then \
		echo "$(RED)✗ Agent directory not found. Run 'make init' first.$(RESET)"; \
		exit 1; \
	fi
	@echo "$(CYAN)Running tests...$(RESET)"
	@cd $(AGENT_DIR) && uv run pytest -v
	@if [ $$? -eq 0 ]; then \
		echo "$(GREEN)✓ All tests passed$(RESET)"; \
	else \
		echo "$(RED)✗ Some tests failed$(RESET)"; \
		exit 1; \
	fi

lint:  ## Run ruff linter
	@if [ ! -d "$(AGENT_DIR)" ]; then \
		echo "$(RED)✗ Agent directory not found. Run 'make init' first.$(RESET)"; \
		exit 1; \
	fi
	@echo "$(CYAN)Linting code...$(RESET)"
	@cd $(AGENT_DIR) && uv run ruff check src/ tests/

format:  ## Format code with ruff
	@if [ ! -d "$(AGENT_DIR)" ]; then \
		echo "$(RED)✗ Agent directory not found. Run 'make init' first.$(RESET)"; \
		exit 1; \
	fi
	@echo "$(CYAN)Formatting code...$(RESET)"
	@cd $(AGENT_DIR) && uv run ruff format src/ tests/
	@echo "$(GREEN)✓ Code formatted$(RESET)"

logs:  ## Tail application logs
	@if [ -d "logs" ] && [ -n "$$(ls -A logs 2>/dev/null)" ]; then \
		tail -f logs/*.log; \
	else \
		echo "$(YELLOW)⚠  No log files found in logs/$(RESET)"; \
	fi

clean:  ## Clean build artifacts and cache
	@echo "$(CYAN)Cleaning build artifacts...$(RESET)"
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name ".ruff_cache" -exec rm -rf {} + 2>/dev/null || true
	@find . -type f -name "*.pyc" -delete 2>/dev/null || true
	@if [ -d "$(AGENT_DIR)" ]; then \
		rm -rf $(AGENT_DIR)/dist $(AGENT_DIR)/build; \
	fi
	@echo "$(GREEN)✓ Cleaned$(RESET)"