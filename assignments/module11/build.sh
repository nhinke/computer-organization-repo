#!/bin/bash

if [ -d "bin" ]; then
  rm -r bin/
fi

if [ -d "obj" ]; then
  rm -r obj/
fi

mkdir bin
mkdir obj

make All
