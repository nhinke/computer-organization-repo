#!/bin/bash

if [ -d "bin" ]; then
  rm -r bin/
  mkdir bin
else
  mkdir bin
fi

# problem 5.1:
gcc src/CelsToFahr.s -o bin/CelsToFahr
gcc src/FahrToCels.s -o bin/FahrToCels

# problem 5.2:
gcc src/PrintNegInt.s -o bin/PrintNegInt

# problem 5.3:
gcc src/FeetToInches.s -o bin/FeetToInches
gcc src/InchesToFeet.s -o bin/InchesToFeet

# problem 5.4:
gcc src/ShiftMultiply.s -o bin/ShiftMultiply

# problem 5.5 (EC):
gcc src/SwapVars.s -o bin/SwapVars
