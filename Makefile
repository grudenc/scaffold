PROJECT_NAME := scaffold

VENVS_DIR := $(HOME)/.venvs
VENV_DIR := $(VENVS_DIR)/$(PROJECT_NAME)

venv:
	@test -d "$(VENVS_DIR)" || mkdir -p "$(VENVS_DIR)"
	@rm -Rf "$(VENV_DIR)"
	@eval python3 -m venv "$(VENV_DIR)"
	@/bin/bash -c "source $(VENV_DIR)/bin/activate && pip install --upgrade pip setuptools wheel && pip install -r requirements.txt"
	@echo -e "Enter the virtual environment using: \n $(VENV_DIR)/bin/activate\n"

venv-update:
	@/bin/bash -c "source $(VENV_DIR)/bin/activate && pip install --upgrade pip setuptools wheel && pip install --upgrade -r requirements.txt"
	@echo -e "Enter virtual environment using:\n. $(VENV_DIR)/bin/activate\n"

format:
	black *.py

lint:
	pylint --disable=R,C hello.py

test:
	python -m pytest -vv --cov=hello test_hello.py
