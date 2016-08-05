#!/bin/sh

eval "cat <<EOF
$(cat "$1")
EOF"
