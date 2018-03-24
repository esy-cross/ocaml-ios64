#!/bin/sh -e

HOST_OCAML_PATH="$1"

CROSS_CONFIG="$2"

source $CROSS_CONFIG

export HOST_OCAML_PATH
export SYSROOT
export CFLAGS
export LDFLAGS
export TRIPLE
export TRIPLEREAL

CONF_FLAMBDA="${CONF_FLAMBDA:+true}"
CONF_FLAMBDA="${CONF_FLAMBDA:-false}"
export CONF_FLAMBDA

if [[ ($ARCH = "arm") || ($ARCH = "i386") ]]
then
  patch -p1 < patches/arm_const_islands.patch
fi

substs config/Makefile.in
