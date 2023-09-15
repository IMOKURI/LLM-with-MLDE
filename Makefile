.PHONY: help
.DEFAULT_GOAL := help

NOW = $(shell date '+%Y%m%d-%H%M%S')
IMAGE_TAG = latest


build: ## Build container image.
	docker build -t llm-fine-tuning:$(IMAGE_TAG) .


help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[38;2;98;209;150m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
