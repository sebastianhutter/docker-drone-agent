#!/bin/bash

function load_secret {
    # function checks if specified environment variable contains the file path to a docker secret
    # if so it overwrite the value with the file contents

    # first parameter is the environment variable name 
    name=${1}
    # second parameter is the value of the environment variable
    value=${2}

    # now check if the value equals a file in the container
    if [ -f "${value}" ]; then
        export ${name}=$(cat "${value}")
    fi
}

load_secret DRONE_SECRET ${DRONE_SECRET}

/bin/drone-agent