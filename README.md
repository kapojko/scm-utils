scm-utils
=========

scm-utils contains some number of small command-line helpers for working with Source Code Management (SCM) systems.

Supported systems:
* svn
* git
* bzr
* hg

up-all
------

This script walks directories recursively and updates (in default mode) all repositories (calls `svn update`, `git pull`, ...).

Base syntax:

    up-all
    
st-all
------

This scripts walks directories recursively and checks the state of all repositories (calls `svn status`, `git status`, ...).

Base syntax:

    st-all


Author
======

Yury Kapoyko, Saint-Petersburg, Russia
yury.kapoyko@mail.ru
