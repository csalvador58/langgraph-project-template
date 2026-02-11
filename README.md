# langgraph-project-template
LangGraph Project Scaffolding Template

## Quick Start

### Using This Template
```bash
# Clone this template
git clone <this-repo-url> my-new-langgraph-project
cd my-new-langgraph-project

# Remove template repo history
rm -rf .git

# Initialize your new project
make init

# Configure your environment
nano agents/default/.env

# Install dependencies
make setup
make dev
```

### `make init`
```
my-new-langgraph-project/
├── agents/
│   └── default/
│       ├── src/
│       │   ├── __init__.py
│       │   ├── graphs/
│       │   │   ├── __init__.py
│       │   │   ├── main.py                    # Default cloud provider graph
│       │   │   ├── main_graph_lmstudio.py     # LM Studio example
│       │   │   ├── agent-feedback/
│       │   │   │   └── __init__.py
│       │   │   ├── human-feedback/
│       │   │   │   └── __init__.py
│       │   │   ├── coordinator/
│       │   │   │   └── __init__.py
│       │   │   └── logger/
│       │   │       └── __init__.py
│       │   ├── nodes/
│       │   │   └── __init__.py
│       │   ├── skills/
│       │   │   └── __init__.py
│       │   └── config/
│       │       └── __init__.py
│       ├── tests/
│       │   ├── __init__.py
│       │   └── test_graph.py
│       ├── langgraph.json
│       ├── pyproject.toml
│       ├── .env
│       └── .env.example
├── shared/
│   ├── __init__.py
│   └── pyproject.toml
├── ui/
│   ├── macos/
│   └── web/
├── logs/
├── .github/
│   └── workflows/
│       └── release.yml
├── .python-version
├── .gitignore
├── .releaserc.json
├── CHANGELOG.md
└── README.md
```

## Available Commands

After running `make init` in your new project:
```bash
make help       # Show all available commands
make setup      # Install Python dependencies
make dev        # Start LangGraph development server
make test       # Run tests
make lint       # Lint code
make format     # Format code
make build      # Build for deployment
make clean      # Clean build artifacts
```

## Model Provider Options

### Cloud Providers (Default)

The generated `agents/default/src/graphs/main.py` is ready for:
- OpenAI
- Anthropic
- Any OpenAI-compatible provider

Configure in `.env`:
```bash
OPENAI_API_KEY=your-key
# or
ANTHROPIC_API_KEY=your-key
```

### LM Studio (Local Models)

For local development:

1. Start LM Studio and load a model
2. Configure `.env`:
```bash
   LM_STUDIO_BASE_URL=http://localhost:1234/v1
   LM_STUDIO_API_KEY=lm-studio
   LM_STUDIO_MODEL_NAME=local-model
```
3. Use the LM Studio graph:
```bash
   cp agents/default/src/graphs/main_graph_lmstudio.py \
      agents/default/src/graphs/main.py
```

## Project Structure

### Makefile System

- `Makefile` - Main entry point, loads modular makefiles
- `make/config.mk` - Shared variables and configuration
- `make/checks.mk` - Validation and prerequisite checks
- `make/init.mk` - Project initialization targets
- `make/dev.mk` - Development workflow targets
- `make/build.mk` - Build and deployment targets

### Scripts

- `scripts/utils.sh` - Shared utility functions
- `scripts/create-structure.sh` - Creates directory tree
- `scripts/generate-pyproject.sh` - Generates Python configs
- `scripts/generate-langgraph-config.sh` - Generates LangGraph config
- `scripts/generate-github-workflow.sh` - Generates CI/CD workflow
- `scripts/generate-releaserc.sh` - Generates semantic-release config
- `scripts/create-source-files.sh` - Creates initial Python files
- `scripts/setup-git.sh` - Initializes git repository

### Templates

All configuration and source files are generated from templates in `templates/`:

- `pyproject.toml.template` - Agent dependencies
- `shared-pyproject.toml.template` - Shared package config
- `langgraph.json.template` - LangGraph configuration
- `env.example.template` - Environment variables
- `releaserc.json.template` - Semantic release config
- `github-workflow.yml.template` - GitHub Actions workflow
- `gitignore.template` - Git ignore patterns
- `README.md.template` - Project README
- `python/main_graph.py.template` - Default graph
- `python/main_graph_lmstudio.py.template` - LM Studio graph
- `python/test_graph.py.template` - Test template

## Requirements

- **git** - Version control
- **make** - Build automation
- **bash** - Shell scripts
- **uv** - Python package manager (auto-installed if missing)
- **Python 3.13+** - Runtime

## Customizing the Template

### Modifying Default Configuration

1. Edit files in `templates/` directory
2. Update scripts in `scripts/` if needed
3. Test by creating a new project with `make init`

### Adding New Templates

1. Add template file to `templates/`
2. Create generation script in `scripts/`
3. Update `make/init.mk` to call your script
4. Update `scripts/create-structure.sh` if new directories needed

### Changing Python Version

Edit `make/config.mk`:
```makefile
PYTHON_VERSION := 3.13
```

## Links

- [LangGraph documentation](https://docs.langchain.com/langgraph)
- [LangSmith documentation](https://docs.langchain.com/langsmith)