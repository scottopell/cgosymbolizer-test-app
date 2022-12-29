# Understanding CGOSymbolizer

## Results
```
goroutine 1 [syscall]:
crash_now
        /home/lima.linux/dev/cgosymbolizertest/crash.c:6 pc=0x481b88
runtime.cgocall(0x481b50, 0x4000057ee8)
        /usr/lib/go-1.19/src/runtime/cgocall.go:158 +0x54 fp=0x4000057eb0 sp=0x4000057e70 pc=0x404ca4
main._Cfunc_entryPoint()
        _cgo_gotypes.go:41 +0x34 fp=0x4000057ee0 sp=0x4000057eb0 pc=0x481a04
main.crash()
        /home/lima.linux/dev/cgosymbolizertest/crash.go:16 +0x1c fp=0x4000057ef0 sp=0x4000057ee0 pc=0x481a5c
main.main()
        /home/lima.linux/dev/cgosymbolizertest/crash.go:21 +0x64 fp=0x4000057f70 sp=0x4000057ef0 pc=0x481ae4
runtime.main()
        /usr/lib/go-1.19/src/runtime/proc.go:250 +0x254 fp=0x4000057fd0 sp=0x4000057f70 pc=0x435534
runtime.goexit()
        /usr/lib/go-1.19/src/runtime/asm_arm64.s:1172 +0x4 fp=0x4000057fd0 sp=0x4000057fd0 pc=0x45e894
```

This has one frame from C code, the actual function that crashes, `crash_now`.

Compared to GDB, this is not the full stack, there are some frames missing:

```
(gdb) bt
#0  0x0000000000481b88 in crash_now () at crash.c:6
#1  0x0000000000481bc4 in indirectionTwo (a=<optimized out>) at crash.c:15
#2  0x0000000000481bfc in indirectionOne (a=a@entry=44) at crash.c:23
#3  0x0000000000481c14 in entryPoint () at crash.c:27
#4  0x0000000000481b5c in _cgo_9bd6286f89e4_Cfunc_entryPoint (v=<optimized out>) at /tmp/go-build/cgo-gcc-prolog:49
#5  0x000000000045e6bc in runtime.asmcgocall () at /usr/lib/go-1.19/src/runtime/asm_arm64.s:973
#6  0x00000040000021a0 in ?? ()
```


## Run Locally
```
./run.sh
```

Tested with `go version go1.19.4 linux/arm64` on Ubuntu 22.04.1 LTS (Jammy Jellyfish)

## Run in Docker
```
$ docker build . -t cgosymbolizertest
$ docker run --rm cgosymbolizertest
```

On linux arm64 I see no difference in the output.
