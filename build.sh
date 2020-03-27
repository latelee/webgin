#!/bin/sh

if [ $# -eq 0 ]; then
  ver="latest"
else
  ver=$1 
fi


echo "build for version " $ver


export GOARCH=amd64
export GOOS="linux"
export GOARM= 
export CGO_ENABLED=1
export CC=gcc
GO111MODULE=off go build -o webgin
strip webgin
docker build -t registry.cn-hangzhou.aliyuncs.com/latelee/webgin-amd64:$ver . -f Dockerfile

export GOARCH=arm
export GOOS="linux"
export GOARM=7 
export CGO_ENABLED=1
export CC=arm-linux-gnueabihf-gcc
GO111MODULE=off go build -o webgin
arm-linux-gnueabihf-strip webgin
docker build -t registry.cn-hangzhou.aliyuncs.com/latelee/webgin-arm:$ver . -f Dockerfile.arm

