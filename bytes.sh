#!/usr/bin/env bash

# bytes
# Sum the number of bytes in a directory listing
# Written by HP Dietz | h.p.dietz@gmail.com


set -e
readonly VERSION=1.5.1
readonly ARGS="$@"

usage() {
  echo "Usage: bytes [-u | --unit <b | kb | mb | gb | tb>] [-a | --all] [-n | --newline] [-p | --precision <precision>] [-v | --version] [directory]" >&2
}

version() {
  echo "bytes v$VERSION" >&2
}


printDirSize() {
  local bytes=$1
  output=$(printf "%.${PRECISION}f" $(echo -e "scale=$PRECISION \n$bytes/$UNIT_FACTOR \nquit" | bc))
  if $PRINT_NEWLINE ; then
    echo "$output"
  else
    echo -n "$output"
  fi
}

getUnitFactor() {
  local unit=$1
  local outVar=$2
  case "$unit" in
    b)
      eval $outVar=1
      ;;
    kb)
      eval $outVar=1024
      ;;
    mb)
      let f=1024**2
      eval $outVar=$f
      ;;
    gb)
      let f=1024**3
      eval $outVar=$f
      ;;
    tb)
      let f=1024**4
      eval $outVar=$f
      ;;
    *)
      echo "Invalid unit: $unit" >&2;
      usage
      exit 1
      ;;
  esac
}

getPrecision() {
  local p=$1
  local outVar=$2

  if ! [[ "$p" =~ ^[0-9]+$ ]]; then
    echo "Invalid precision: $p" >&2
    usage
    exit 1
  fi
  eval $outVar=$p
}

parseArgs() {
  local arg
  for arg 
  do
    case "$arg" in
      # translate --long-options into short options
      --all)        args="${args}-a " ;;
      --help)       args="${args}-h " ;;
      --newline)    args="${args}-n " ;;
      --precision)  args="${args}-p " ;;
      --recursive)  args="${args}-r " ;;
      --unit)       args="${args}-u " ;;
      --version)    args="${args}-v " ;;
      # pass through anything else
      *)            args="${args} ${arg} " ;;
    esac
  done

  eval set -- $args

  local lsOpts=l
  local newline=true
  local precision=3
  local recursive=false
  local unitFactor=1

  while getopts "ahnp:ru:v" OPTION;
  do
    case $OPTION in
      a)
        lsOpts=${lsOpts}a
        ;;
      n)
        printNewline=false
        ;;
      p)
        getPrecision "$OPTARG" precision
        ;;
      r)
        recursive=true
        ;;
      u)
        getUnitFactor "$OPTARG" unitFactor
        ;;
      v)
        version
        exit 0
        ;;
      h)
        usage
        exit 0
        ;;
      *)
        usage
        exit 1
        ;;
    esac
  done
  shift $((OPTIND-1))

  local dir=.
  if [ -n "$1" ]; then 
    dir=$1
    if [ ! -d "$dir" ];
    then
      echo "No such directory: $dir"
      usage
      exit 1
    fi
  fi

  readonly LS_OPTS=$lsOpts
  readonly NEWLINE=$newline
  readonly PRECISION=$precision
  readonly UNIT_FACTOR=$unitFactor
  readonly RECURSIVE=$recursive
  readonly DIR=$dir
}

getBytesInDir() {
  local dir=$1
  local recursive=$2
  local total=0

  for bytes in $(ls -$LS_OPTS $dir | grep "^-" | awk '{ print $5 }')
  do
    let total=$total+$bytes
  done

  if $recursive ; then
    local t=0
    for subDir in $(ls -$LS_OPTS $dir | grep "^d" | awk '{ print $9 }')
    do
      if [ "$subDir" != "." ] && [ "$subDir" != ".." ]; then
        let total=$total+"$(getBytesInDir $dir/$subDir $recursive)"
      fi
    done
  fi

  echo $total
}

main() {
  parseArgs $ARGS
  printDirSize $(getBytesInDir $DIR $RECURSIVE)
}

main

