SHELL := /bin/bash

.PHONY: install
install:
	# Setup serverless environment
	npm ci
	# Setup python environment
	pipenv install --ignore-pipfile --dev && \
	pipenv run pre-commit install -t pre-commit -t pre-push

.PHONY: test
test:
	pipenv run pytest

.PHONY: lint
lint:
	pipenv run pre-commit run --all-files

.PHONY: deploy
deploy:
ifndef ENVIRONMENT
	@echo "ENVIRONMENT not set"; exit 1
endif
	serverless deploy --stage $(ENVIRONMENT)
