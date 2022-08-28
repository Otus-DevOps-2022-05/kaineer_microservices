all: init bake

init:
	packer init .
bake:
	if [ ! -f ./image-is-baked ]; then \
	  packer build -var-file=variables.json docker-base.json && \
	  touch ./image-is-baked ; \
	fi

.PHONY: init bake all
