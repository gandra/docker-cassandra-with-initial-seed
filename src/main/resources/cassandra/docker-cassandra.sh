#!/bin/bash

SCRIPT_NAME="$0"
CMD="$1"
CASSANDRA_IMG_NAME=cassandra-demo-image
CASSANDRA_CNR_NAME=cassandra-demo-container
CASSANDRA_HOST_PORT=9042

FORCE_IMG_REMOVE=true

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

function check_is_present () {
    arg_pos="$1"
    arg_name="$2"
    arg_value="$3"

    if [ -z "$arg_value" ]
    then 
        >&2 echo "ERROR $SCRIPT_NAME, missing arg $arg_pos: $arg_name"
        exit 1 
    fi
}

function cassandra_stop () {
    # stop mongodb container if is running
    cnr_id=$(docker ps --filter "name=$CASSANDRA_CNR_NAME" -q)
    [ "$?" != "0" ] && { >&2 echo "docker ps failed"; exit 1; }
    [ ! -z "$cnr_id" ] &&  docker stop $CASSANDRA_CNR_NAME
}

function cassandra_start () {
    # check if docker image is present and remove image if present
    if [ "$FORCE_IMG_REMOVE" = true ]
    then
        echo "Removing image $CASSANDRA_IMG_NAME ..."
        docker image inspect $CASSANDRA_IMG_NAME >/dev/null 2>&1 && docker image rm $CASSANDRA_IMG_NAME || echo "image $CASSANDRA_IMG_NAME not present"
    fi
    docker build -t $CASSANDRA_IMG_NAME .
    docker run --rm --name $CASSANDRA_CNR_NAME -d -p8091:8091 -p1099:1099 -p9001:9001 -p$CASSANDRA_HOST_PORT:9042 $CASSANDRA_IMG_NAME
}

check_is_present 1 "<cmd> (start, stop, restart)" "$CMD"

>&2 echo "command .............. : $CMD"
>&2 echo "docker cassandra image ... : $CASSANDRA_IMG_NAME"
>&2 echo "docker cassandra container : $CASSANDRA_CNR_NAME"
>&2 echo "docker cassandra port .... : $CASSANDRA_HOST_PORT"

if [ "$CMD" == "start" ]
then
    cassandra_stop
    cassandra_start
elif [ "$CMD" == "restart" ]
then
    cassandra_stop
    cassandra_start
elif [ "$CMD" == "stop" ]
then
    cassandra_stop
else
    >&2 echo "ERROR $SCRIPT_NAME, arg <cmd> at pos $arg_pos must be one of (start, stop, restart), got: $CMD"
fi
