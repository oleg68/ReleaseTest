#!/bin/bash
GIT_VERSION=$1
[[ -z $GIT_VERSION ]] && GIT_VERSION=`git describe --tags`
PROJECT_VERSION=`echo $GIT_VERSION | cut -d- -f1`
BUILD_VERSION=`echo $GIT_VERSION | cut -d- -f2-3 --output-delimiter=.`
GIT_CHANGE_NUM=`echo $GIT_VERSION | cut -d- -f3`
if [[ -n "$GIT_CHANGE_NUM" ]] || [[ "$BUILD_VERSION" < "1" ]]; then
  RELEASE_FLAG=OFF
else
  RELEASE_FLAG=ON
fi

echo "::set-output name=project_ver::$PROJECT_VERSION"
echo "::set-output name=build_ver::$BUILD_VERSION"
echo "::set-output name=full_ver::$PROJECT_VERSION-$BUILD_VERSION"
echo "::set-output name=release_flag::$RELEASE_FLAG"

