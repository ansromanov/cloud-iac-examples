.SHELL := /usr/bin/bash
.PHONY: init apply destroy plan

MODULE=$(shell basename $$(pwd))
ENV=$(shell (basename $$(cd ../.. && pwd && cd -)))
PROJECT=$(shell (basename $$(cd ../../../.. && pwd && cd -)))

init:
	@terraform init \
		-input=false \
		-backend=true \
		-backend-config="key=terraform/$(PROJECT)/$(ENV)/$(MODULE).tfstate"

plan: init
	@terraform plan

apply: init
	@terraform apply

destroy: init
	@terraform delete
