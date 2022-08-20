#!/bin/bash

# docker network create reddit

docker run -d --network=reddit \
  --rm \
  --network-alias=post-db_1 \
  --network-alias=comment-db_1 mongo:latest

docker run -d --network=reddit \
  --rm \
  --env POST_DATABASE_HOST=post-db_1 \
  --network-alias=post_1 kaineer/post:latest

docker run -d --network=reddit \
  --rm \
  --env COMMENT_DATABASE_HOST=comment-db_1 \
  --network-alias=comment_1 kaineer/comment:latest

docker run -d --network=reddit \
  --rm \
  --env POST_SERVICE_HOST=post_1 \
  --env COMMENT_SERVICE_HOST=comment_1 \
  -p 9292:9292 kaineer/ui:latest
