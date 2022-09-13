NAME=fluentd
IMAGE="kaineer/${NAME}"
CONTAINER="${NAME}"

FILE="Dockerfile.2.0"

build:
	docker build -t "${IMAGE}" -f "${FILE}" .
clean:
	docker rmi ${IMAGE}
run:
	docker run -d --rm --name ${CONTAINER} ${IMAGE}
stop:
	docker stop ${CONTAINER}
