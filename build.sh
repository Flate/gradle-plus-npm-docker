#!/bin/bash

curl https://get.sdkman.io > get-sdkman.sh

docker build -t $DOCKER_HUB_USERNAME/gradle-plus-npm:latest .

exit 0
