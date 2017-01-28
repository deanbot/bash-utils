#!/bin/sh


## input utils

# accepts any non-empty input
non_null_val() {
  local __prompt="$1"
  local __default="$2"
  while true; do
    if [ ! -z "$__default" ]; then
      read -e -p "$__prompt" -i "$__default" val
    else
      read -e -p "$__prompt" val
    fi
    if [ ! -z "$val" ]; then
      break
    fi
  done
  echo "$val"
}
export -f non_null_val

# accepts only inputs: yYnN
y_or_n_val() {
  local __prompt="$1"
  local __default="$2"
  while true; do
    if [ ! -z "$__default" ]; then
      read -e -p "$__prompt" -i "$__default" val
    else
      read -e -p "$__prompt" val
    fi
    if [ ! -z "$val" ]; then
      if [[ "$val" =~ ^([yY]|[nN])$ ]]; then
        break
      fi
    fi
  done
  echo "$val"
}
export -f y_or_n_val

## output utils

# display message from cat
function catsay() {
	echo -n $'\E[0m'
	echo $''
	echo $''
	echo $'       /\\__/\\'
	echo $'      /`    \'\\'
	echo $'    === 0  0 ==='
	echo $'      \  --  /'
	echo $'     /        \\'
	echo $'    /          \\'
	echo $'   |            |'
	echo $'    \\  ||  ||  /'
	echo $'     \\_oo__oo_/#######o'
	echo $''
	echo "      $@"
	echo $''
}
export -f catsay