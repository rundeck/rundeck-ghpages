#!/bin/bash

if [ -z "$1" ] ; then 
    echo "args: version" 
    exit 2
fi

version=$1

git submodule add -b docs$version git://github.com/rundeck/rundeck-docs.git $version
git add $version
