#!/bin/bash

BIN=${PACKER:-packer}

IMAGE_FAMILY="reddit-docker-app"

run_cached() {
  CMD=$1
  TAG=$2
  FILE=.cache/$TAG
  if [ ! -f $FILE ]; then
    mkdir -p .cache
    eval "$CMD" >$FILE
  fi
  [ -f $FILE ] && cat $FILE
}

bake_app() {
  source ./packer/.envrc
  ${BIN} \
    build \
    -var-file ./packer/variables.json \
    ./packer/app.json
  rm .cache/image-list
}

bake_app_if_not_baked() {
  local COUNT=$(run_cached "yc compute image list" "image-list" | grep "$IMAGE_FAMILY" | wc -l)
  if [[ "$COUNT" == "0" ]]; then
    bake_app
  else
    echo " » Image $IMAGE_FAMILY is already baked"
  fi
}

case "$1" in
  "-f"|"--force") bake_app ;;
  *) bake_app_if_not_baked ;;
esac
