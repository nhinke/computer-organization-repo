#!/bin/bash

if [ -d "bin" ]; then
  rm -r bin/
  mkdir bin
else
  mkdir bin
fi

# 4a:
g++ -o bin/problem4a src/problem4a.cpp -std=c++11 -O0 -Wall -pie -lm

# 4b:
g++ -o bin/problem4b src/problem4b.cpp -std=c++11 -O0 -Wall -pie -lm

# 4c:
g++ -o bin/problem4c src/problem4c.cpp -std=c++11 -O0 -Wall -pie -lm

# 4d:
g++ -o bin/problem4d src/problem4d.cpp -std=c++11 -O0 -Wall -pie -lm
