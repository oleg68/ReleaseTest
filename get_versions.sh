PROJECT_VERSION=`head -1  Version.txt`
RELEASE_VERSION=`git describe --tags --exact-match`
if $?; then
  # rem Release
  RELEASE_FLAG=ON
  VERSION_SUFFIX="ow.r"
else
  # Intermediate build
  RELEASE_FLAG=OFF
  VERSION_SUFFIX="ow.$(git rev-parse --short HEAD)"
fi
echo "::set-output name=project_ver::$PROJECT_VERSION"
echo "::set-output name=release_flag::$RELEASE_FLAG"
echo "::set-output name=ver_suffix::$VERSION_SUFFIX"