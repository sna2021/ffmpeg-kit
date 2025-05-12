
VERSION=6.0.5
CHANGELOG="Release"
NDK_VERS="25.2.9519653"

install_deps(){
  brew install \
    autoconf \
    automake \
    libtool \
    pkg-config \
    curl \
    git \
    doxygen \
    nasm \
    cmake \
    gcc \
    gperf \
    texinfo \
    yasm \
    bison \
    autogen \
    wget \
    gettext \
    meson \
    ninja \
    ragel \
    groff \
    gtk-doc \
    libtasn1 libiconv intltool
}

assemble_ios(){
  rm ~/.xcode.for.ffmpeg.kit.sh
  export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer > ~/.xcode.for.ffmpeg.kit.sh
  ./ios.sh --xcframework --enable-gpl --enable-ios-zlib --enable-openssl --enable-zimg --enable-x264
#  ./ios.sh --xcframework --enable-ios-audiotoolbox --enable-ios-avfoundation --enable-ios-bzip2 --enable-ios-libiconv --enable-ios-videotoolbox --enable-ios-zlib
}

assemble_android(){
  export ANDROID_NDK_ROOT=$HOME/Library/Android/sdk/ndk/$NDK_VERS
  export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
  ./android.sh --full --enable-gpl --disable-lib-srt --disable-arm-v7a
}

release(){
#  zip -r ffmpegkit-bundled.xcframework.zip ./prebuilt/bundle-apple-xcframework-ios/
#  AAR_PATH=./prebuilt/bundle-android-aar/ffmpeg-kit/ffmpeg-kit.aar
#  gh release create v$VERSION $AAR_PATH -t "Release v$VERSION" -n "$CHANGELOG"
  gh release upload v$VERSION ffmpegkit-bundled.xcframework.zip
  rm ffmpegkit-bundled.xcframework.zip
}
#install_deps
#assemble_android
#assemble_ios
#assemble
release