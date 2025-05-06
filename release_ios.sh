
VERSION=6.0.4
CHANGELOG="Release"

assemble(){
  rm ~/.xcode.for.ffmpeg.kit.sh
  export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer > ~/.xcode.for.ffmpeg.kit.sh
  ./ios.sh --xcframework --enable-ios-audiotoolbox --enable-ios-avfoundation --enable-ios-bzip2 --enable-ios-libiconv --enable-ios-videotoolbox --enable-ios-zlib
}

release(){
  zip -r bundle-apple-framework-iphoneos.zip ./prebuilt/bundle-apple-framework-iphoneos
  gh release create v$VERSION bundle-apple-framework-iphoneos.zip -t "Release v$VERSION" -n "$CHANGELOG"
  rm bundle-apple-framework-iphoneos.zip
}

assemble
release