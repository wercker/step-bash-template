#!/bin/sh
if [ ! -z "$WERCKER_BASH_TEMPLATE_ERROR_ON_EMPTY" ]; then
  set -u
fi

eval "cat <<EOF
$(cat "$1")
"
