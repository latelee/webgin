
usge: 
1. change .go file, change Dockerfile

2. build it:
```
./build.sh v1.0
./build.sh v1.1 
etc  
```

3. push it
```
./manifest.sh v1.0
./manifest.sh v1.1
etc
```

4. run it
```
docker run -it --name webgin --rm -p 80:80 registry.cn-hangzhou.aliyuncs.com/latelee/webgin
```
note: change docker name as needed

5. test it
```
# curl localhost:80
Hello World v1.0
arch: amd64 os: linux hostname: 60acfd65857a
uname: Linux 60acfd65857a 4.4.0-174-generic #204-Ubuntu SMP Wed Jan 29 06:41:01 UTC 2020 x86_64
Now: 2020-03-26 23:10:36
```
