#!/bin/sh -e

CURR_INSTALL="$1"

for pkg in bigarray bytes compiler-libs dynlink findlib graphics num num-top stdlib str threads unix; do
  cp -r "${CURR_INSTALL}/lib/${pkg}" "${CURR_INSTALL}/ios-sysroot/lib/"
done

# mkdir -p "${CURR_INSTALL}/lib/findlib.conf.d"
# cp ios.conf "${CURR_INSTALL}/lib/findlib.conf.d"

(cd "${CURR_INSTALL}/ios-sysroot/bin/" && ln -sf ocamlc.byte ocamlc)
