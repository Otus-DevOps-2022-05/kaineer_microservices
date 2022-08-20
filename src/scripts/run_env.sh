#!/bin/bash

# docker network create reddit

POST_DB=post-db_1
COMMENT_DB=comment-db_1
POST=post_1
COMMENT=comment_1

COMMENT_IMAGE="kaineer/comment:2.0"
POST_IMAGE="kaineer/post"

docker run -d --network=reddit \
  --rm \
  --network-alias=${POST_DB} \
  --network-alias=${COMMENT_DB} mongo:latest

docker run -d --network=reddit \
  --rm \
  --env POST_DATABASE_HOST=${POST_DB} \
  --network-alias=${POST} kaineer/post:latest

docker run -d --network=reddit \
  --rm \
  --env COMMENT_DATABASE_HOST=${COMMENT_DB} \
  --network-alias=${COMMENT} ${COMMENT_IMAGE}

docker run -d --network=reddit \
  --rm \
  --env POST_SERVICE_HOST=${POST} \
  --env COMMENT_SERVICE_HOST=${COMMENT} \
  -p 9292:9292 kaineer/ui:latest
