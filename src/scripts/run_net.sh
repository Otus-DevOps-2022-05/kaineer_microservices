#!/bin/bash

docker network create back_net --subnet=10.0.2.0/24
docker network create front_net --subnet=10.0.1.0/24

NW_FRONT=front_net
NW_BACK=back_net

POST_DB=post-db
COMMENT_DB=comment-db
POST=post
COMMENT=comment

COMMENT_IMAGE="kaineer/comment:2.0"
POST_IMAGE="kaineer/post:latest"
UI_IMAGE="kaineer/ui:2.0"

docker run -d --network=${NW_BACK} \
  --rm \
  --volume reddit_db:/data/db \
  --network-alias=${POST_DB} \
  --network-alias=${COMMENT_DB} mongo:latest

docker run -d --network=${NW_BACK} \
  --env POST_DATABASE_HOST=${POST_DB} \
  --name ${POST} \
  --network-alias=${POST} ${POST_IMAGE}

docker run -d --network=${NW_BACK} \
  --env COMMENT_DATABASE_HOST=${COMMENT_DB} \
  --name ${COMMENT} \
  --network-alias=${COMMENT} ${COMMENT_IMAGE}

docker run -d --network=${NW_FRONT} \
  --rm \
  --env POST_SERVICE_HOST=${POST} \
  --env COMMENT_SERVICE_HOST=${COMMENT} \
  -p 9292:9292 ${UI_IMAGE}

## Now let us link post and comment to front

docker network connect $NW_FRONT $POST
docker network connect $NW_FRONT $COMMENT
