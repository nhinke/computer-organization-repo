## Description

This directory (*module10/*) contains all of the code written for assignment11. All code was written targetting armv7l and tested on a Raspberry Pi 4 Model B running Raspbian 11. The problems are enumerated as follows:

**11-1.** Implement multiplication recursively using successive additions   
**11-2.** Compute n'th Fibonacci number recursively  

## Build Instructions

For the purposes of this course, I will include pre-built binaries in the remote repo, so this step should not be necessary. If for some reason they must be rebuilt, simply execute the following commands in a bash shell:

```bash
chmod 755 build.sh
./build.sh
```

## Run Instructions

Simply execute each of the binaries in the *bin/* directory. For example on a Linux machine:

```bash
./bin/pr1-recursiveMult
./bin/pr2-recursiveFib
```

Each binary should print out an example input-output sequence to the active terminal.
