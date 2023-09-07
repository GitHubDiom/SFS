#!/bin/bash

# 如果 go.mod 文件不存在, 初始化 Go module
if [ ! -f go.mod ]; then
    go mod init
    go mod tidy
fi

if [ -f SFS-standalone ]; then
    rm SFS-standalone
fi

go build
mkdir -p result

./SFS-standalone -p c -t test2 -n 12 > ./result/cfs.txt
./SFS-standalone -p s -t test2 -n 12 > ./result/srtf.txt
./SFS-standalone -p m -t test2 -n 12 > ./result/sfs.txt
