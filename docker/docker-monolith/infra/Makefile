all: packer terraform

.PHONY: packer terraform

packer:
	./scripts/build_packer_image.sh

terraform:
	./scripts/create_and_provision_vm.sh

clean:
	./scripts/destroy_vm.sh
