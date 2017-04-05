#!/bin/sh
if [ ! -z "$WERCKER_BASH_TEMPLATE_ERROR_ON_EMPTY" ]; then
  set -eu
fi

if [ -e /dev/urandom ]; then
  RANDO=$(LANG=C tr -cd 0-9 </dev/urandom | head -c 12)
else
  RANDO=2344263247
fi

eval "cat 2> $RANDO <<EOF
$(cat "$1")
"

if [ ! -z "$WERCKER_BASH_TEMPLATE_ERROR_ON_EMPTY" ]; then
  if [ -s $RANDO ]; then
    rm -f $RANDO
    exit 1
  fi
fi
rm -f $RANDO
