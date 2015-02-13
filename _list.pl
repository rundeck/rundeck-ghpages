#!/usr/bin/perl -ps

#2013-01-10 00:41  47252244   s3://download.rundeck.org/debian/rundeck-1.4.4-1.deb
s/^(\d+-\d+-\d+ \d+:\d+)\s+(\d+)\s+(s3:\/\/.+?\/([^\/]+\.[a-z]+))$/* [\4]($BASE\4) (\2 bytes) - \1/;
s/^(\d+)\s+(\d+-\d+-\d+ \d+:\d+)\s+((s3:\/\/.+?)?(.+?\/)?([^\/]+\.[a-z]+))$/* [\6]($BASE\6) (\1 bytes) - \2/;