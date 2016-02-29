#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${DIR} > /dev/null

function printAddedToPathAndExit {
  echo "bytes added to path."
  echo "You may need to restart your Terminal for changes to become effective."
  exit
}

bytesInstalled="$(cat ~/.bash_profile | grep "Setting PATH for bytes")"
bashProfile=~/.bash_profile

if [ ${#bytesInstalled} -gt 0 ]; then
  printAddedToPathAndExit
else
  echo "" >> ${bashProfile}
  echo "#Setting PATH for bytes" >> ${bashProfile}
  echo "PATH=\"${DIR}/bin:\${PATH}\"" >> ${bashProfile}
  echo "export PATH" >> ${bashProfile}
  printAddedToPathAndExit
fi

popd > /dev/null
