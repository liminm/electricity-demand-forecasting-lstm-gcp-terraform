# ------------- VARIABLES -------------------
VENV_ACTIVATE = . .venv/bin/activate

# ------------- TARGETS ---------------------
setup:
	# Creates venv and installs deps
	uv venv .venv && $(VENV_ACTIVATE) && uv pip install -e ".[dev]" && uv pip compile pyproject.toml --extra dev -o requirements-dev.lock

format:
	# Applies ruff formatter in-place
	ruff format .

lint:
	# Checks code style & lints (no auto-fix)
	ruff check .

test:
	# Runs all pytest suites quietly
	pytest -q

# Default target when running plain `make`
.DEFAULT_GOAL := lint
