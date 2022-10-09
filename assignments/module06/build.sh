#!/bin/bash

if [ -d "bin" ]; then
  rm -r bin/
  mkdir bin
else
  mkdir bin
fi

gcc src/O2Decimal2Immediate.s -g -o bin/O2DecimalToImmediate
