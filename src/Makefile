build:
	cd post-py && make build && cd -
	cd comment && make build && cd -
	cd ui && make build && cd -
clean:
	cd post-py && make build && cd -
	cd comment && make build && cd -
	cd ui && make build && cd -
run:
	. ./scripts/run.sh
run_env:
	. ./scripts/run_env.sh
kill:
	. ./scripts/kill_all.sh

## docker 4
network_none:
	docker run -it --rm --network none joffotron/docker-net-tools -c ifconfig

network_host:
	docker run -it --rm --network host joffotron/docker-net-tools -c ifconfig
