#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ ! -n "$WERCKER_BASH_TEMPLATE_INPUT" ]; then
  export WERCKER_BASH_TEMPLATE_INPUT="*.template*"
fi

if [ ! -n "$WERCKER_BASH_TEMPLATE_OUTPUT" ]; then
  export WERCKER_BASH_TEMPLATE_OUTPUT="./"
fi


for input in $WERCKER_BASH_TEMPLATE_INPUT; do
  outname=${input//\.template/}
  case "$WERCKER_BASH_TEMPLATE_OUTPUT" in
    */)
      output="$WERCKER_BASH_TEMPLATE_OUTPUT$outname"
      ;;
    *)
      output=$WERCKER_BASH_TEMPLATE_OUTPUT
  esac
  echo "Templating $input -> $output"
  "$DIR/template.sh" "$input" > "$output"
done
