package main

/*
void crash_now(char *b);
*/
import "C"

import (
	"fmt"

	_ "github.com/ianlancetaylor/cgosymbolizer"
)

func crash() {
	C.crash_now(C.CString("some string"))
}

func main() {
	fmt.Println("Pre-crash")
	crash()
	fmt.Println("Post-crash")
}
