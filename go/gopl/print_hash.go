// Write a program that prints the SHA256 hash of its standard
// input by default but supports a command-line flag to print
// the SHA384 or SHA512 hash instead.

// Exercise 4.2 from "The Go Programming Language"

package main

import (
	"bufio"
	"crypto/sha256"
	"fmt"
	"os"
)

func printHash(input []byte) {
	// Print the SHA256 hash of standard input from its slice of bytes.
	fmt.Printf("%s sha256 hash is: %x\n", input, sha256.Sum256(input))

}

func main() {
	input := bufio.NewScanner(os.Stdin)
	for input.Scan() {
		// Create a byte slice from the standard input text
		nbytes := []byte(input.Text())
		printHash(nbytes)
	}

}
