package main

// #cgo CFLAGS: -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -fno-optimize-sibling-calls
/*
void entryPoint();
*/
import "C"

import (
	"fmt"

	_ "github.com/ianlancetaylor/cgosymbolizer"
)

func crash() {
	C.entryPoint()
}

func main() {
	fmt.Println("Pre-crash")
	crash()
	fmt.Println("Post-crash")
}
