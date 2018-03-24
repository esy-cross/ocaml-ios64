#!/bin/sh -e

OCAMLFIND_LIBPATH="$1"
TARGET_OCAML_PATH="$2"

for pkg in bigarray bytes compiler-libs dynlink findlib graphics num num-top stdlib str threads unix; do
  cp -LR "${OCAMLFIND_LIBPATH}/../${pkg}" "${TARGET_OCAML_PATH}/ios-sysroot/lib/"
done

(cd "${TARGET_OCAML_PATH}/ios-sysroot/bin/" && ln -sf ocamlc.byte ocamlc)
