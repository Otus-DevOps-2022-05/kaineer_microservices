NAME=comment
TAG=2.0
IMAGE="kaineer/${NAME}"
CONTAINER="${NAME}"

FILE="Dockerfile"

build:
	. ./docker_build.sh
	docker build -t ${IMAGE}:${TAG} -f ${FILE} .
clean:
	docker rmi ${IMAGE}
run:
	docker run -d --rm --name ${CONTAINER} ${IMAGE}
stop:
	docker stop ${CONTAINER}
