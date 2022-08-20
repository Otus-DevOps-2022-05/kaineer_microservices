NAME=ui
IMAGE="kaineer/${NAME}"
CONTAINER="${NAME}"

build:
	. ./docker_build.sh
	docker build -t ${IMAGE} .
clean:
	docker rmi ${IMAGE}
run:
	docker run -d --rm --name ${CONTAINER} ${IMAGE}
stop:
	docker stop ${CONTAINER}
