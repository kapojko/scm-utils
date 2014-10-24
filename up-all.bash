#!/usr/bin/env bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function up_dir() {
    local PREV_DIR=`pwd`
    cd $1

    if test -d ".svn"
    then
        echo "==========" `pwd` "=========="
        svn up
    elif test -d ".git"
    then
        echo "==========" `pwd` "=========="
        git pull
    elif test -d ".bzr"
    then
        echo "==========" `pwd` "=========="
        bzr pull
    elif test -d ".hg"
    then
        echo "==========" `pwd` "=========="
        hg pull -u
    else
        for SUB_DIR in $(find . -maxdepth 1 -mindepth 1 -type d)
        do
            up_dir "$SUB_DIR"
        done
    fi

    cd $PREV_DIR
}

up_dir .

IFS=$SAVEIFS

