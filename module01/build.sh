#!/bin/bash

if [ -d "bin" ]; then
  rm -r bin/
  mkdir bin
fi

# 4a:
g++ -o bin/problem4a problem4a.cpp -std=c++11 -O0 -Wall -pie -lm

# 4b:
g++ -o bin/problem4b problem4b.cpp -std=c++11 -O0 -Wall -pie -lm

# 4c:
g++ -o bin/problem4c problem4c.cpp -std=c++11 -O0 -Wall -pie -lm

# 4d:
# g++ -o bin/problem4d problem4d.cpp -std=c++11 -O0 -Wall -pie -lm
