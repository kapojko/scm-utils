scm-utils
=========

scm-utils contains some number of small command-line helpers for working with Source Code Management (SCM) systems.

up-all
------

This script walks directories recursively and updates (in default mode) all repositories (calls `svn update`, `git pull`, ...).

Base syntax:

    up-all
    
See `up-all --help` for detailed help.

st-all
------

This scripts walks directories recursively and checks the state of all repositories (calls `svn status`, `git status`, ...).

Base syntax:

    st-all [-d]

See `st-all --help` for detailed help.

Author
======

Yury Kapoyko, Saint-Petersburg, Russia
yury.kapoyko@live.com

License
=======

GPLv2
