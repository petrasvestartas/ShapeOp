#!/bin/bash

mkdir -p build
cd build
cmake -B . -S .. -DDOWNLOAD_DEPENDECIES=ON -DBUILD=OFF -G "Unix Makefiles" && make
cmake -B . -S .. -DDOWNLOAD_DEPENDECIES=OFF -DBUILD=ON -G "Unix Makefiles" && make