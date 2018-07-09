#PURPOSE: Simple program that exits and returns a
#         status code back to the Linux Kernel
#

#Input:   none
#

#OUTPUT: returns a status code. This can be viewed
#        by typing
#
#        echo $?
#
#        after running the program
#

#VARIABLES:
#          %eax holds the system call number
#          %ebx holds the return status
#

# Anything starting with a .period isn't directly translated
# into a machine instruction, Instead it's an instruction to
# the assember itself. These are called assembler directives.
# The .section commands breaks your program up into sections.
# data-section, where you list any memory storage you will need
# for data
.section .data

# text-section of a program is where the program instruction live
.section .text

# _start is a symbol, which means that it is going to be replaced
# by something else either during assembly or linking
# Symbols are generally used to mark locations of programs or data
# so that we can refer to them by name instead of by their location
# number. Imagine if you had to refer to every memory location
# by it's address.
# .globl means that the assembler shouln't discard this symbol, after
# assembly because the linker will need it
.globl _start
# _start defines label. A label is a symbol followed by a colon.
# Label define a symbol's value.
_start:
 # transfers the number 1 into register %eax
 # dollar sign to use immeediate mode addressing
 movl $1, %eax  # this is the linux kernel command
                # number (system call) for exiting
                # a program

 movl $0, %ebx  # this is the status number we will
                # return to the operating system.
                # change this around and it will
                # return different things to
                # echo $?

# Linux simply requires that certain registers be loaded with certain
# parameter values before making a system call. %eax is always required
# to be loaded with the system call number.
# for exit system call %ebx is required to be loaded with the exit status.

# interrupt, If we didn't signal the interrupt, then no system call
# would have been performed
# Operating System features are accessed through system calls. These are
# invoked by setting up the registers in a special way and issuing the
# instrucctions interrupt. Linux knows which system call we want to access
# by what we stored in the %eax register.
# Each system call has other requirements as to what needs to be stored
# in other registers.
# System call number 1 is the exit system call, which required the status
# code to be placed in %ebx.
 int $0x80      # this wakes up the kernel to run
                # the exit command
