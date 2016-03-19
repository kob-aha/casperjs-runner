#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

IMAGE_NAME=casperjs

docker run -v $DIR:/home/casperjs --rm --name casperjs ${IMAGE_NAME} "$@" 