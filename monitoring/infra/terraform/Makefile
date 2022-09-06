all: init apply

init:
	terraform init

apply:
	terraform apply -auto-approve

destroy:
	terraform apply -destroy -auto-approve

.PHONY: init all
