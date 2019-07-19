. test/mock-curl.sh
testdir=test/cases/ls-all/
mkdir -p $testdir
# make some named ones
mkdir -p $testdir/nave/installed/{foo,bar,baz}/bin
cat > $testdir/nave/installed/foo/bin/node <<EOF
#!$SHELL
echo 1.2.3
EOF
cat > $testdir/nave/installed/bar/bin/node <<EOF
#!$SHELL
echo 3.2.23
EOF
cat > $testdir/nave/installed/baz/bin/node <<EOF
#!$SHELL
echo 12.69.420
EOF
mkdir -p $testdir/nave/{installed,src}/1.2.3
mkdir -p $testdir/nave/installed/12.69.420
chmod 0755 $testdir/nave/installed/{foo,bar,baz}/bin/node
XDG_CONFIG_HOME=$(cd -- $testdir &>/dev/null ; pwd)
. nave.sh ls-all
rm -rf $testdir