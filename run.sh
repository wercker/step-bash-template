#!/bin/sh
DIR=$WERCKER_STEP_ROOT
if [ ! -n "$WERCKER_BASH_TEMPLATE_INPUT" ]; then
  export WERCKER_BASH_TEMPLATE_INPUT="*.template*"
fi

if [ ! -n "$WERCKER_BASH_TEMPLATE_OUTPUT" ]; then
  export WERCKER_BASH_TEMPLATE_OUTPUT="./"
fi

for input in $WERCKER_BASH_TEMPLATE_INPUT; do
  outname=$(echo "$input" | sed 's/\.template//')
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
