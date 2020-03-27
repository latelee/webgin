package main

import (
    "fmt"
    "runtime"
    "os"
    "time"
    "github.com/gin-gonic/gin"
    "net/http"
)

// uname

/*
#include <stdio.h>
#include <sys/utsname.h>

char* GetName()
{
    struct utsname myname;
    static char buffer[128] = {0};
    uname(&myname);
    
    snprintf(buffer, 128, "uname: %s %s %s %s %s\r\n", myname.sysname, 
                    myname.nodename, myname.release, 
                    myname.version, myname.machine);
    return buffer;
}
*/
import "C"

var version = "v1.0"

func myIndex (c *gin.Context) {
    uname := C.GetName()
    name := C.GoString(uname)
    hostname, _ := os.Hostname()
    arch := "arch: " + runtime.GOARCH + " os: " + runtime.GOOS + " hostname: " + hostname + "\r\n";
    timeStr := "Now: " + time.Now().Format("2006-01-02 15:04:05") + "\r\n"
    c.String(http.StatusOK, "Hello World " + version + "\r\n" + arch + name + timeStr)
}

func main(){
    router := gin.Default()
    router.GET("/", myIndex)
    fmt.Println("gin server start...")
    router.Run(":80")
}
