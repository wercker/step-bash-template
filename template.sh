#!/bin/bash
while IFS= read line ; do
  while [[ "$line" =~ (\$\{[a-zA-Z_][a-zA-Z_0-9]*\}) ]] ; do
    LHS=${BASH_REMATCH[1]}
    RHS="$(eval echo "\"$LHS\"")"
    line=${line//$LHS/$RHS}
  done
  echo $line
done
