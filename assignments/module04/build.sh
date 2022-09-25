#!/bin/bash

if [ -d "bin" ]; then
  rm -r bin/
  mkdir bin
fi

gcc src/problem4-1.s -o bin/problem4-1
gcc src/problem4-2.s -o bin/problem4-2
gcc src/problem4-3.s -o bin/problem4-3
