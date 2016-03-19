#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

IMAGE_NAME=casperjs

docker run -ti -v $DIR:/home/casperjs --rm --entrypoint /bin/bash --name casperjs ${IMAGE_NAME} 