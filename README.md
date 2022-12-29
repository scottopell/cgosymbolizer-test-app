# Understanding CGOSymbolizer

With this example cgo program, the cgo symbolizer doesn't appear to have any
effect on the stacktraces.

## Results
Running this program with the cgosymbolizer import, I see:
```
goroutine 1 [syscall]:
runtime.cgocall(0x481b10, 0x4000057ee8)
        /usr/lib/go-1.19/src/runtime/cgocall.go:158 +0x54 fp=0x4000057eb0 sp=0x4000057e70 pc=0x404c64
main._Cfunc_crash_now()
        _cgo_gotypes.go:41 +0x34 fp=0x4000057ee0 sp=0x4000057eb0 pc=0x4819c4
main.crash()
        /home/lima.linux/dev/cgosymbolizertest/crash.go:15 +0x1c fp=0x4000057ef0 sp=0x4000057ee0 pc=0x481a1c
main.main()
        /home/lima.linux/dev/cgosymbolizertest/crash.go:20 +0x64 fp=0x4000057f70 sp=0x4000057ef0 pc=0x481aa4
runtime.main()
        /usr/lib/go-1.19/src/runtime/proc.go:250 +0x254 fp=0x4000057fd0 sp=0x4000057f70 pc=0x4354f4
runtime.goexit()
        /usr/lib/go-1.19/src/runtime/asm_arm64.s:1172 +0x4 fp=0x4000057fd0 sp=0x4000057fd0 pc=0x45e854
```

I would have expected to see frames for `crash_now`, `indirectionOne` and
`indirectionTwo` coming from `crash.c`.
Maybe the latter two would be inlined (although I attempted to disable
inlining), but I would expect to at least see `crash_now`.

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
