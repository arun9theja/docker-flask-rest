#Authored by Phillip Bailey
.PHONY: all kube_bootstrap kube_ingress kube_dashboard kube_get_token kube_join_node  kube_status kube_up kube_down kube_Destroy
.SILENT:
SHELL := '/bin/bash'

USERNAME=p0bailey

IMAGE=flask-app

all:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:  ## Start and provision kubernetes cluster and helm.
	docker build -t ${USERNAME}/${IMAGE}:latest .

run: ## Run
	docker-compose build && docker-compose up -d

stop: ## Run
	docker-compose stop && rm -rf jenkins
