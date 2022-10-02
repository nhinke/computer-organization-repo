## Description

This directory (*module05/*) contains all of the code written for assignment5. All code was written targetting armv7l and tested on a Raspberry Pi 4 Model B running Raspbian 11. The problems are enumerated as follows:

**5-1.** Convert between Celsius and Fahrenheit  
**5-2.** Read input integer and print negated version  
**5-3.** Convert between inches and feet+inches   
**5-4.** Multiply integer using left shift  
**5-5.** Swap variables using exclusive or (EC)   

## Build Instructions

For the purposes of this course, I will include pre-built binaries in the remote repo, so this step should not be necessary. If for some reason they must be rebuilt, simply execute the following commands in a bash shell:

```bash
chmod 755 build.sh
./build.sh
```

## Run Instructions

Simply execute each of the binaries in the *bin/* directory. For example on a Linux machine:

```bash
./bin/CelsToFahr
./bin/FahrToCels
./bin/PrintNegInt
./bin/FeetToInches
./bin/InchesToFeet
./bin/ShiftMultiply
./bin/SwapVars
```

Each binary should print out an example input-output sequence to the active terminal.
