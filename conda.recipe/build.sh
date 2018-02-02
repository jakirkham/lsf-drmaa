#!/bin/bash

export CFLAGS="${CFLAGS} -std=c99"

# Hack to workaround doc build issues.
ln -s "${SRC_DIR}/README.md" "${SRC_DIR}/README"

./configure \
	--prefix="${PREFIX}" \
	--with-lsf-static \
	--with-pic \
	--enable-shared \
	--enable-static \
	--disable-debug \
	--disable-development \
	--with-gnu-ld \
|| { cat config.log; exit 1; }

make
make install
