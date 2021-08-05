#!/bin/sh
svn status | perl -ne '/^\? *(.*)$/ && print $1 . "\n"' | xargs -L 1 -I X -r svn add X
# note: @ sign at the end effectively 'escapes' @ sign in the middle of the name
svn status | perl -ne '/^\!M *(.*)$/ && print $1 . "\n"' | xargs -L 1 -I X -r svn remove X@
svn status | perl -ne '/^\! *(.*)$/ && print $1 . "\n"' | xargs -L 1 -I X -r svn remove X@
