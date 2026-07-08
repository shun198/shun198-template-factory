SHELL := /bin/bash
TF_DIR ?= envs/dev

.PHONY: init plan apply destroy fmt format validate lint setup test

setup: init

init:
	cd $(TF_DIR) && if [[ -f backend.hcl ]]; then terraform init -backend-config=backend.hcl; else terraform init -backend=false; fi

plan:
	cd $(TF_DIR) && terraform plan

apply:
	cd $(TF_DIR) && terraform apply

destroy:
	cd $(TF_DIR) && terraform destroy

fmt:
	terraform fmt -recursive .

format: fmt

validate:
	cd $(TF_DIR) && terraform validate

lint:
	trivy config .

test: validate
