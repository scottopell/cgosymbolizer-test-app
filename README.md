# Understanding CGOSymbolizer

With this example cgo program, the cgo symbolizer doesn't appear to have any
effect on the stacktraces.

Run ./run.sh and the output is a diff between one run where the cgosymbolizer is
included and one where it is not. (Addresses are ignored).

On linux arm64 I see no difference in the output.
