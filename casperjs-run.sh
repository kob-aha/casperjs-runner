#!/bin/bash

function getPath {
    local __resultvar="$2"
    local path="$( cd "$( dirname "$1" )" && pwd )"
    
    if [[ "$__resultvar" ]]; then
        eval $__resultvar="'$path'"
    else
        echo "$path"
    fi
}

getPath "${BASH_SOURCE[0]}" DIR

# In case we got a script name to run we'll extract it's path
if [[ "$1" ]]; then
    getPath "$1" SCRIPT_PATH
    SCRIPT_NAME="$(basename $1)"
    SCRIPT="/scripts/${SCRIPT_NAME}"
else
    SCRIPT_PATH=${DIR}
    SCRIPT=""
fi

IMAGE_NAME=casperjs

docker run -v $DIR:/home/casperjs -v $SCRIPT_PATH:/scripts --rm --name casperjs ${IMAGE_NAME} ${SCRIPT} 