all: packer terraform

packer:
	cd packer && . ./.envrc && make && cd -

terraform:
	cd terraform && . ./.envrc && make && cd -

destroy:
	cd terraform && . ./envrc && make destroy && cd -

.PHONY: packer terraform all destroy
