set -exou

SIP_COMMAND="sip-build"
EXTRA_FLAGS=""

if [[ $(uname) == "Linux" ]]; then
    ln -s ${GXX} g++ || true
    ln -s ${GCC} gcc || true

    export LD=${GXX}
    export CC=${GCC}
    export CXX=${GXX}

    chmod +x g++ gcc
    export PATH=${PWD}:${PATH}
fi

$SIP_COMMAND \
--verbose \
--no-make \
--ads-libdir=$PREFIX\lib
$EXTRA_FLAGS

pushd build

CPATH=$PREFIX/include make -j$CPU_COUNT
make install
