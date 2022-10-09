## Description

This directory (*module06/*) contains all of the code written for assignment6. All code was written targetting armv7l and tested on a Raspberry Pi 4 Model B running Raspbian 11. The problems are enumerated as follows:

**6-2.** Given decimal integer values, determine corresponding Operand2 immediate values  

## Build Instructions

For the purposes of this course, I will include pre-built binaries in the remote repo, so this step should not be necessary. If for some reason they must be rebuilt, simply execute the following commands in a bash shell:

```bash
chmod 755 build.sh
./build.sh
```

## Run Instructions

Simply execute each of the binaries in the *bin/* directory. For example on a Linux machine:

```bash
./bin/O2Decimal2Immediate
```

Each binary should print out an example input-output sequence to the active terminal.
