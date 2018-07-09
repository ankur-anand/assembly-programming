#PURPOSE: This program finds the maximum number of a
#         set of data items.
#

#VARIABLES: The registers have the following uses:
#
# %edi - Holds the index of the data item being examined.
# %ebx - Largest data item found.
# %eax - Current Data item.
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
#              to terminate the data
#

.section .data

# data-items
# data_items is a label that refers to the location that
# follows it.
# then the directive that starts with .long. That causes
# the assembler to reserve memory for the list of numbers
# that follow it. Because data_items refers to reserve
# location of the first one and is a label, any time in
# our program where we need to refer to this address we
# can use the data_items symbol and the assembler will
# substitue it with the address where the numbers start
# during assembly
data_items:
  .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

## Why we dont have the .globl declaration for data_items.
# This is because we only refer to these location within
# the program. No other file or program needs to know where
# they are located. This is in contrast to the _start symbol,
# which Linux needs to know where it is sso that it knowns
# where to begin the program's execution.
.globl _start
_start:
  #mov 0 into the index register
  movl $0, %edi
  movl data_items(,%edi, 4), %eax #load the first byte of data
  # since this is the first item, %eax is the biggest
  movl %eax, %ebx

start_loop:
  # This compare instruction alsso affects a register not
  # mentioned here, the %eflags register - the status register
  # the below comparison result is stored in the status register
  cmpl $0, %eax # check to see if we've hit the data end
  je loop_exit
  incl %edi #load the next value
  # movl BEGINNINADRESS(%BASE_OR_OFFSET,%INDEXREGISTER,WORDSIZE)
  # Index addressing mode
  movl data_items(,%edi,4), %eax
  cmpl %ebx, %eax # compare values
  # jump to loop beginning if the new one isn't bigger
  jle start_loop
  movl %eax, %ebx # move the value as the largest
  jmp start_loop # jmp to loop beginning

loop_exit:
  # %ebx is the staus code for the exit system call
  # and it already has the mzximum number
  mov $1, %eax #1 is the exit() syscall
  int $0x80
