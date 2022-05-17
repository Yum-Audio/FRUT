BASE_DIR=$(dirname "$0")
BUILD_DIR="$BASE_DIR/build"

cd "$BASE_DIR"

if [ ! -d "$BUILD_DIR" ]; then
mkdir "$BUILD_DIR"
fi

cd "$BUILD_DIR"

cmake .. -DCMAKE_INSTALL_PREFIX="../prefix" -DJUCE_ROOT="../../JUCE" -DJucer2CMake_JUCE_LICENSE=Indie 
cmake -E env CXXFLAGS="-Wno-unused-parameter" cmake ..
cmake --build . --target install --parallel 8