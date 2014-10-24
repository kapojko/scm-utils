#!/usr/bin/env bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function test_dir() {
    local PREV_DIR=`pwd`
    cd $1

    if test -d ".svn"
    then
        echo "==========" `pwd` "=========="
        svn st
    elif test -d ".git"
    then
        echo "==========" `pwd` "=========="
        git status
    elif test -d ".bzr"
    then
        echo "==========" `pwd` "=========="
        bzr st
    elif test -d ".hg"
    then
        echo "==========" `pwd` "=========="
        hg st
    else
        for SUB_DIR in $(find . -maxdepth 1 -mindepth 1 -type d)
        do
            test_dir "$SUB_DIR"
        done
    fi

    cd $PREV_DIR
}

test_dir .

IFS=$SAVEIFS

