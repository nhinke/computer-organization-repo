## Description

This directory (*module08/*) contains all of the code written for assignment8. All code was written targetting armv7l and tested on a Raspberry Pi 4 Model B running Raspbian 11. The problems are enumerated as follows:

**8-0.**  Write library of conversion functions that all other problems will utilize  
**8-1.**  Given amount of time in hours and distance in miles, find km per hour required to travel given distance  
**8-2a.** Given temperature in degrees Celsius, find equivalent temperature in degrees Fahrenheit  
**8-2b.** Given total number of inches, find equivalent number of feet and inches  

## Build Instructions

For the purposes of this course, I will include pre-built binaries in the remote repo, so this step should not be necessary. If for some reason they must be rebuilt, simply execute the following commands in a bash shell:

```bash
chmod 755 build.sh
./build.sh
```

## Run Instructions

Simply execute each of the binaries in the *bin/* directory. For example on a Linux machine:

```bash
./bin/kphTest
./bin/CToFTest
./bin/InchesToFeetTest
```

Each binary should print out an example input-output sequence to the active terminal.
