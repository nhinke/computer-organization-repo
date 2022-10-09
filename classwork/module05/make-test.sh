#!/bin/bash

CMD="make"

if [ -d make-test ]; then
  rm -r make-test
fi

if [ "$1" ]; then
  CMD="${CMD} $1"
fi

echo ${CMD}
mkdir make-test
${CMD}

