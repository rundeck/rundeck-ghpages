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

[ -z "$CUR_VERSION" ] && {
    errorMsg "Usage: _sitebuild.sh <version>"
    exit 2
}

#generate necessary elements

JAR_NAME="rundeck-launcher-$CUR_VERSION.jar"
JAR_URL="https://github.com/downloads/dtolabs/rundeck/$JAR_NAME"

#download url and calculate SHA hash

CURL_OPTS=""

if [ -f "/tmp/$JAR_NAME" ] ; then
    CURL_OPTS="-z $JAR_NAME"
fi

pushd /tmp

curl -f -L -o "/tmp/$JAR_NAME" $CURL_OPTS $JAR_URL || fail "Unable to download $JAR_URL"
SHASUM=$(shasum "/tmp/$JAR_NAME" |cut -d' ' -f1)

popd

[ -n "$SHASUM" ] || fail "Unable to find SHASUM: /tmp/$JAR_NAME"

cat >_config.yml <<END
rd_version: "$CUR_VERSION"
rd_jar_name: "$JAR_NAME"
rd_jar_sha: "$SHASUM"

rd_jar_url: "$JAR_URL"
rd_zipball: "https://github.com/dtolabs/rundeck/zipball/v$CUR_VERSION"
rd_tarball: "https://github.com/dtolabs/rundeck/tarball/v$CUR_VERSION"
rd_releasenotes: "https://github.com/dtolabs/rundeck/blob/v$CUR_VERSION/RELEASE.md"
END

echo "Created: _config.yml"

echo "next: \n  git ci -m 'update version to $CUR_VERSION'; git push origin gh-pages"
