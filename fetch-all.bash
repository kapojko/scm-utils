#!/usr/bin/env bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function process_dir() {
    local PREV_DIR=`pwd`
    cd $1

    if test -d ".svn"
    then
        echo "==========" `pwd` "=========="
        #svn st
        echo "Not implemented!"
        exit 1
    elif test -d ".git"
    then
        echo "==========" `pwd` "=========="
        git fetch
    elif test -d ".bzr"
    then
        echo "==========" `pwd` "=========="
        #bzr st
        echo "Not implemented!"
        exit 1
    elif test -d ".hg"
    then
        echo "==========" `pwd` "=========="
        #hg st
        echo "Not implemented!"
        exit 1
    else
        for SUB_DIR in $(find . -maxdepth 1 -mindepth 1 -type d)
        do
            process_dir "$SUB_DIR"
        done
    fi

    cd $PREV_DIR
}

process_dir .

IFS=$SAVEIFS

