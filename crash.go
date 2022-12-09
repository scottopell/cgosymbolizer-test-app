package main

/*
void crash_now();
*/
import "C"

import (
	"fmt"

	_ "github.com/ianlancetaylor/cgosymbolizer"
)

func crash() {
	C.crash_now()
}

func main() {
	fmt.Println("Pre-crash")
	crash()
	fmt.Println("Post-crash")
}
