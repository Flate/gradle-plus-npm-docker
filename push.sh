#!/bin/bash

docker login --email=$DOCKER_HUB_EMAIL --username=$DOCKER_HUB_USERNAME --password=$DOCKER_HUB_PASSWORD

docker push $DOCKER_HUB_USERNAME/gradle-plus-npm:latest

exit 0
