#!/bin/bash

if [ $# -eq 0 ]; then
  ver="latest"
else
  ver=$1
fi

docker push registry.cn-hangzhou.aliyuncs.com/latelee/webgin-arm:$ver
docker push registry.cn-hangzhou.aliyuncs.com/latelee/webgin-amd64:$ver

export DOCKER_CLI_EXPERIMENTAL=enabled

docker manifest create registry.cn-hangzhou.aliyuncs.com/latelee/webgin:$ver registry.cn-hangzhou.aliyuncs.com/latelee/webgin-amd64:$ver registry.cn-hangzhou.aliyuncs.com/latelee/webgin-arm:$ver

docker manifest annotate registry.cn-hangzhou.aliyuncs.com/latelee/webgin:$ver registry.cn-hangzhou.aliyuncs.com/latelee/webgin-amd64:$ver --os linux --arch amd64
docker manifest annotate registry.cn-hangzhou.aliyuncs.com/latelee/webgin:$ver registry.cn-hangzhou.aliyuncs.com/latelee/webgin-arm:$ver --os linux --arch arm

docker manifest push registry.cn-hangzhou.aliyuncs.com/latelee/webgin:$ver

