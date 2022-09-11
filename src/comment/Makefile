NAME=comment
TAG=logging
IMAGE="kaineer/${NAME}"
CONTAINER="${NAME}"

FILE="Dockerfile.alpine"

build:
	. ./docker_build.sh
	docker build -t ${IMAGE}:${TAG} -f ${FILE} .
clean:
	docker rmi ${IMAGE}
run:
	docker run -d --rm --name ${CONTAINER} "${IMAGE}:${TAG}"
stop:
	docker stop ${CONTAINER}
