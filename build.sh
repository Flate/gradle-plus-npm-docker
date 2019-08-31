#!/bin/bash

curl https://get.sdkman.io > get-sdkman.sh

docker build -t flate/gradle-plus-npm:dev .

exit 0
