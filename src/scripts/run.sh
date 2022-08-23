#!/bin/bash

docker network create reddit

docker run -d --network=reddit \
  --network-alias=post_db --network-alias=comment-db mongo:latest


docker run -d --network=reddit \
  --network-alias=post kaineer/post:latest

docker run -d --network=reddit \
  --network-alias=comment kaineer/comment:latest

docker run -d --network=reddit \
  -p 9292:9292 kaineer/ui:latest
