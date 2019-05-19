#!/usr/bin/env bash
set -e

# data/
#   a 2 bytes
#   b 3 bytes
#   c
#     a 2 bytes
#     d
#       b 3 bytes
#     e
#       b 3 bytes
#       .f 2 bytes

run() {
  echo $(
    cd "${SRC_DIR}" && \
    cd .. && \
    ./bytes.sh "${1}"
  )
}

assertEq() {
  local name=${1}
  local a=${2}
  local b=${3}
  echo "${name}"
  if [ ${a} == ${b} ]; then
    echo "green"
  else
    echo "Failing: ${a} not equal to ${b}!"
    exit 1
  fi
}

readonly SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
readonly DATA_DIR="${SRC_DIR}/data"
echo $DATA_DIR

readonly DATA_DIR_NON_RECURSIVE=$(run "${DATA_DIR}")
assertEq 'data dir non-recursive is 5 bytes' ${DATA_DIR_NON_RECURSIVE} 5.000

readonly DATA_DIR_RECURSIVE=$(run "-r ${DATA_DIR}")
assertEq 'data dir recursive is 13 bytes' ${DATA_DIR_RECURSIVE} 13.000

readonly DATA_C_RECURSIVE=$(run "-r ${DATA_DIR}/c")
assertEq 'data/c recursive is 8 bytes' ${DATA_C_RECURSIVE} 8.000

readonly DATA_DIR_NON_RECURSIVE_KB=$(run "-u kb ${DATA_DIR}")
assertEq 'data dir non-recursive is 0.004 kilobytes' ${DATA_DIR_NON_RECURSIVE_KB} 0.004

readonly DATA_DIR_NON_RECURSIVE_P2=$(run "-p 2 ${DATA_DIR}")
assertEq 'data dir non-recursive with 2 floating points precision is 5.00' ${DATA_DIR_NON_RECURSIVE_P2} 5.00

readonly DATA_DIR_RECURSIVE_P7_KB=$(run "-u kb -p 7 ${DATA_DIR}")
assertEq 'data dir recursive with 7 floating points is 0.0048828 kilobytes' ${DATA_DIR_RECURSIVE_P7_KB} 0.0048828

readonly DATA_C_E_ALL=$(run "-a ${DATA_DIR}/c/e")
assertEq 'data/c/e including hidden files is 5 bytes' ${DATA_C_E_ALL} 5.000
