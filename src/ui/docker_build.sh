#!/bin/bash

echo `git show --format="%h" HEAD | head -1` > build_info.txt
echo `git rev-parse --abbrev-ref HEAD` >> build_info.txt

if [ "$USER_NAME" = "travisuser" ]; then
  docker build -t $USER_NAME/ui:logging -f Dockerfile.alpine .
else
  echo " × Skip docker build, running from Makefile"
fi
