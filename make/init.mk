# Initialization targets

.PHONY: init create-structure generate-configs setup-git show-next-steps

init: check-not-initialized check-tools create-structure generate-configs setup-git show-next-steps  ## Initialize new LangGraph monorepo project

create-structure:  ## Create project directory structure
	@echo "$(CYAN)Creating LangGraph monorepo structure...$(RESET)"
	@bash $(SCRIPTS_DIR)/create-structure.sh

generate-configs:  ## Generate all configuration files
	@echo "$(CYAN)Generating configuration files...$(RESET)"
	@bash $(SCRIPTS_DIR)/generate-pyproject.sh
	@bash $(SCRIPTS_DIR)/generate-langgraph-config.sh
	@bash $(SCRIPTS_DIR)/generate-github-workflow.sh
	@bash $(SCRIPTS_DIR)/generate-releaserc.sh
	@bash $(SCRIPTS_DIR)/create-source-files.sh

setup-git:  ## Initialize git repository
	@bash $(SCRIPTS_DIR)/setup-git.sh

show-next-steps:  ## Display next steps after initialization
	@echo ""
	@echo "$(GREEN)✓ Project initialized successfully!$(RESET)"
	@echo ""
	@echo "Next steps:"
	@echo "  1. Configure $(AGENT_DIR)/.env with your API keys"
	@echo "  2. Run 'make setup' to install dependencies"
	@echo "  3. Run 'make dev' to start the development server"
	@echo "  4. Run 'make test' to verify the setup"
	@echo ""
	@echo "For automated changelog:"
	@echo "  - Use conventional commits (feat:, fix:, etc.)"
	@echo "  - Push to main branch to trigger semantic-release"
	@echo "  - CHANGELOG.md will be updated automatically"