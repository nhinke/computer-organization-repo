## Description

This directory (*final/*) contains all of the code written for the final. All code was written targetting armv7l and tested on a Raspberry Pi 4 Model B running Raspbian 11. The problems are enumerated as follows:

**final-18.** Implement looping program that prompts user for an arbitrary number of integers and then prints relevant statistics   

## Build Instructions

For the purposes of this course, I will include pre-built binaries in the remote repo, so this step should not be necessary. If for some reason they must be rebuilt, simply execute the following commands in a bash shell:

```bash
chmod 755 build.sh
./build.sh
```

## Run Instructions

Simply execute each of the binaries in the *bin/* directory. For example on a Linux machine:

```bash
./bin/loopingIntegerInputStats.s
```

Each binary should print out an example input-output sequence to the active terminal. Note that there is an additional pseudo-code python program (tested using Python 3.9.2 and 3.10.8), that can be run using the following command on a Linux machine:

```bash
python3 ./src/pseudocode.py
```
