#!/bin/bash
#/ generate news post about new Rundeck release ...
#/ usage: <path/to/rundeck/src> <vers>

set -exuo pipefail
IFS=$'\n\t'
readonly ARGS=("$@")
DIR=
VERS=
FILE=
DATE=$(date "+%Y-%m-%d")

usage() {
      grep '^#/' <"$0" | cut -c4- # prints the #/ lines above as usage info
}
die(){
    echo >&2 "$@" ; exit 2
}

make_release_news(){
	
	cat >$FILE <<END
---
layout: news
title: "Rundeck $VERS is now available"
categories:
  - news
comments: true
author: Rundeck Project
published: true
---


[Download Rundeck $VERS now](http://rundeck.org/downloads.html)


A copy of the [release notes](https://github.com/rundeck/rundeck/blob/v$VERS/RELEASE.md) can be found below:

--------------------

END
	cat $DIR/RELEASE.md >>$FILE 
	echo "File created: $FILE"
}

check_args(){
	: example to check args length
	if [ ${#ARGS[@]} -lt 2 ] ; then
		usage
		exit 2
	fi
	DIR=${ARGS[0]}
	VERS=${ARGS[1]}

	FILE=$PWD/news/_posts/$DATE-rundeck-$VERS.md
}

# func(){
#    local FARGS=("$@")
#  #    echo $FUNCNAME $@
#  # set -x
#  # do something
#  # set -x
#}
test_file(){
	[ -f $FILE ] && die "File already exists: $FILE" || true
}

main() {
    check_args
    test_file
    # use local vars
    #local i
    make_release_news
}
main

