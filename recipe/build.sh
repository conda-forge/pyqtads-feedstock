set -exou

SIP_COMMAND="sip-build"
EXTRA_FLAGS=""

$SIP_COMMAND \
--verbose \
--confirm-license \
--no-make \
$EXTRA_FLAGS

pushd build

CPATH=$PREFIX/include make -j$CPU_COUNT
make install