## Description

This directory (*module09/*) contains all of the code written for assignment9. All code was written targetting armv7l and tested on a Raspberry Pi 4 Model B running Raspbian 11. The problems are enumerated as follows:

**9-1a.** Check if the data in r1 is a char using logical variables  
**9-1b.** Check if the data in r1 is a char *without* using logical variables  
**9-2.**  Convert a student's number grade to the corresponding letter grade  
**9-3.**  Find the maximum of three integer inputs  

## Build Instructions

For the purposes of this course, I will include pre-built binaries in the remote repo, so this step should not be necessary. If for some reason they must be rebuilt, simply execute the following commands in a bash shell:

```bash
chmod 755 build.sh
./build.sh
```

## Run Instructions

Simply execute each of the binaries in the *bin/* directory. For example on a Linux machine:

```bash
./bin/checkCharLogical
./bin/checkCharNoLogicals
./bin/checkGrade
./bin/maxInt
```

Each binary should print out an example input-output sequence to the active terminal.
