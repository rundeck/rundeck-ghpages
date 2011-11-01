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

[ -z "$CUR_VERSION" -o -z "$CUR_REL" ] && {
    errorMsg "Usage: _sitebuild.sh <version> <release>"
    exit 2
}

#generate necessary elements

JAR_NAME="rundeck-launcher-$CUR_VERSION.jar"
JAR_URL="https://github.com/downloads/dtolabs/rundeck/$JAR_NAME"

DEB_NAME="rundeck-$CUR_VERSION-$CUR_REL.deb"
DEB_URL="https://github.com/downloads/dtolabs/rundeck/$DEB_NAME"

#download url and calculate SHA hash

CURL_OPTS=""

if [ -f "/tmp/$JAR_NAME" ] ; then
    CURL_OPTS="-z $JAR_NAME"
fi

pushd /tmp

curl -f -L -o "/tmp/$JAR_NAME" -z "/tmp/$JAR_NAME" $CURL_OPTS $JAR_URL || fail "Unable to download $JAR_URL"
JAR_SHASUM=$(shasum "/tmp/$JAR_NAME" |cut -d' ' -f1)
JAR_SIZE=$(stat -f "%z" "/tmp/$JAR_NAME")
[ -n "$JAR_SHASUM" ] || fail "Unable to find SHASUM: /tmp/$JAR_NAME"

curl -f -L -o "/tmp/$DEB_NAME" -z "/tmp/$DEB_NAME" $CURL_OPTS $DEB_URL || fail "Unable to download $DEB_URL"
DEB_SHASUM=$(shasum "/tmp/$DEB_NAME" |cut -d' ' -f1)
DEB_SIZE=$(stat -f "%z" "/tmp/$DEB_NAME")
[ -n "$DEB_SHASUM" ] || fail "Unable to find SHASUM: /tmp/$DEB_NAME"

popd


cat >_config.yml <<END
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
END

echo "Created: _config.yml"

echo "next: \n  git ci -m 'update version to $CUR_VERSION'; git push origin gh-pages"
