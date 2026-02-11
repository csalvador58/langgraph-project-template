# Build and deployment targets

.PHONY: build

build:  ## Build LangGraph application (requires langgraph-cli)
	@if [ ! -d "$(AGENT_DIR)" ]; then \
		echo "$(RED)✗ Agent directory not found. Run 'make init' first.$(RESET)"; \
		exit 1; \
	fi
	@if ! command -v langgraph &> /dev/null; then \
		echo "$(YELLOW)⚠  LangGraph CLI not found globally. Using uv run...$(RESET)"; \
		cd $(AGENT_DIR) && uv run langgraph build -t my-agent:latest; \
	else \
		echo "$(CYAN)Building LangGraph application...$(RESET)"; \
		cd $(AGENT_DIR) && langgraph build -t my-agent:latest; \
	fi