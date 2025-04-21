//
// Assembler program to print "Hello World!"
// to stdout.
//
// X0-X2 - parameters to Linux function services
// X8 - Linux function number
// CHANGES:
// X16 - Mach System Call function number
//
.global _start // Provide program starting address
.align 4 // Darwin Likes to Be Aligned
// Setup the parameters to print hello world
// and then call Darwin/MacOS to do it.
_start: mov X0, #1 // 1 = StdOut move 1 into R0
	adr X1, helloworld // string to print ldr -> adr? // load address of helloworld into R1
	mov X2, #13 // length of our string // load length of string 13 into R2 
	mov X16, #4 // MacOS write system call //load write system call 4, into R16 (for MacOS)
	svc #0x80 // Call MacOS to output the string
// Setup the parameters to exit the program
// and then call MacOS to do it.
	mov X0, #0 // Use 0 return code
	mov X16, #1 // Service code 93 terminates
	svc #0x80 // Call Linux to terminate

helloworld: .ascii "Hello World!\n"
