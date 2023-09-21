.PHONY: help
.DEFAULT_GOAL := help

NOW = $(shell date '+%Y%m%d-%H%M%S')
IMAGE_TAG = latest


build: ## Build container image.
	docker build --build-arg PROXY=$(http_proxy) -t localhost:32000/llm-fine-tuning:$(IMAGE_TAG) .


push: ## Push image to registry.
	docker push localhost:32000/llm-fine-tuning:$(IMAGE_TAG)


run: ## Run experiment.
	det experiment create ./determined_run_clm.yaml .


help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[38;2;98;209;150m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
