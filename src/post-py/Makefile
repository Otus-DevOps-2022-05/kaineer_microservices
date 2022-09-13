NAME=post
IMAGE="kaineer/${NAME}"
FILE="Dockerfile.alpine"
CONTAINER="${NAME}"
TAG=logging

build:
	. ./docker_build.sh
	docker build -t "${IMAGE}:${TAG}" -f "${FILE}" .
clean:
	docker rmi ${IMAGE}
run:
	docker run -d --rm --name ${CONTAINER} "${IMAGE}:${TAG}"
stop:
	docker stop ${CONTAINER}
