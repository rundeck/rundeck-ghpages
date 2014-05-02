#!/bin/bash
#
# generate the _config.yml with
# metadata for: current version,download URLS and SHA sum
#

errorMsg() {
   echo "$*" 1>&2
}
fail(){
    errorMsg "FAIL: $@"
    exit 2
}

CUR_VERSION=$1
CUR_REL=$2
DL_LOC=${3:-/tmp}

[ -z "$CUR_VERSION" -o -z "$CUR_REL" ] && {
    errorMsg "Usage: _sitebuild.sh <version> <release> [download dir]"
    exit 2
}

#generate necessary elements

JAR_NAME="rundeck-launcher-$CUR_VERSION.jar"
JAR_URL="http://download.rundeck.org/jar/$JAR_NAME"

DEB_NAME="rundeck-$CUR_VERSION-$CUR_REL.deb"
DEB_URL="http://download.rundeck.org/deb/$DEB_NAME"

#download url and calculate SHA hash

CURL_OPTS=""

cd $DL_LOC

if [ ! -f "$DL_LOC/$JAR_NAME" ] ; then
    curl -f -L -o "$DL_LOC/$JAR_NAME" -z "$DL_LOC/$JAR_NAME" $CURL_OPTS $JAR_URL || fail "Unable to download $JAR_URL"
fi
JAR_SHASUM=$(shasum "$DL_LOC/$JAR_NAME" |cut -d' ' -f1)
JAR_SIZE=$(stat -c "%s" "$DL_LOC/$JAR_NAME")
[ -n "$JAR_SHASUM" ] || fail "Unable to find SHASUM: $DL_LOC/$JAR_NAME"

if [ ! -f "$DL_LOC/$DEB_NAME" ] ; then
    curl -f -L -o "$DL_LOC/$DEB_NAME" -z "$DL_LOC/$DEB_NAME" $CURL_OPTS $DEB_URL || fail "Unable to download $DEB_URL"
fi
DEB_SHASUM=$(shasum "$DL_LOC/$DEB_NAME" |cut -d' ' -f1)
#gnu stat
DEB_SIZE=$(stat -c "%s" "$DL_LOC/$DEB_NAME")
#bsd stat
#DEB_SIZE=$(stat -f "%z" "$DL_LOC/$DEB_NAME")
[ -n "$DEB_SHASUM" ] || fail "Unable to find SHASUM: $DL_LOC/$DEB_NAME"

cd -


cat >_config.yml <<END
baseurl: ""
url: ""
full_url: "http://www.rundeck.org"
rd_version: "$CUR_VERSION"
rd_jar_name: "$JAR_NAME"
rd_jar_sha: "$JAR_SHASUM"
rd_jar_url: "$JAR_URL"
rd_jar_size: "$JAR_SIZE"
rd_deb_name: "$DEB_NAME"
rd_deb_url: "$DEB_URL"
rd_deb_sha: "$DEB_SHASUM"
rd_deb_size: "$DEB_SIZE"
rd_zipball: "https://github.com/dtolabs/rundeck/zipball/v$CUR_VERSION"
rd_tarball: "https://github.com/dtolabs/rundeck/tarball/v$CUR_VERSION"
rd_releasenotes: "https://github.com/dtolabs/rundeck/blob/v$CUR_VERSION/RELEASE.md"
markdown: kramdown
END

echo "Created: _config.yml"

echo "next: \n  git ci -m 'update version to $CUR_VERSION'; git push origin gh-pages"
