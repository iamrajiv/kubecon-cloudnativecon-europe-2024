package main

import "unsafe"

//go:wasmimport env fasthash // HL
func fasthash(p unsafe.Pointer, n int32) uint64
