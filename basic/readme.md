## Data Storage Sizes
The x86-64 architecture supports a specific set of data storage size elements, all based
on powers of two. The supported storage sizes are as follows:
Storage Size    (bits)      Size (bytes)
Byte           8-bits       1 byte
Word           16-bits      2 bytes
Double-word    32-bits      4 bytes
Quadword       64-bits      8 bytes
Double quadword 128-bits    16 bytes

## CPU Registers
A CPU register, or just register, is a temporary storage or working location built into the
CPU itself (separate from memory). Computations are typically performed by the CPU
using registers.
## General Purpose Registers (GPRs)
There are sixteen, 64-bit General Purpose Registers (GPRs). The GPRs are described in
the following table. A GPR register can be accessed with all 64-bits or some portion or
subset accessed.

| 64-bit register | Lowest 32-bits | Lowest 16-bits | Lowest 8-bits |
| --------------- | -------------- | -------------- | ------------- |
| rax             | eax            | ax             | axl           |
| rbx             | ebx            | bx             | bxl           |
| rcx             | ecx            | cx             | cxl           |
| rdx             | edx            | dx             | dxl           |
| rsi             | esi            | si             | sil           |
| rdi             | edi            | di             | dil           |
| rbp             | ebp            | bp             | bpl           |
| rsp             | esp            | sp             | spl           |
| r8              | r8d            | r8w            | r8b           |
| r9              | r9d            | r9w            | r9b           |
| r10             | r10d           | r10w           | r10b          |
| r11             | r11d           | r11w           | r11b          |
| r12             | r12d           | r12w           | r12b          |
| r13             | r13d           | r13w           | r13b          |
| r14             | r14d           | r14w           | r14b          |
| r15             | r15d           | r15w           | r15b          |

rax = [32-bit] | eax = [ah |al]

quadword rax register is
set to 50,000,000,00010 (fifty billion), the rax register would contain the following value
in hex.
rax = 0000 000B A43B 7400

## Stack Pointer Register (RSP)
One of the CPU registers, rsp, is used to point to the current top of the stack.

## Base Pointer Register (RBP)
One of the CPU registers, rbp, is used as a base pointer during function calls

## Instruction Pointer Register (RIP)
In addition to the GPRs, there is a special register, rip, which is used by the CPU to
point to the next instruction to be executed

## Main Memory
Memory can be viewed as a series of bytes, one after another. That is, memory is byte
addressable. This means each memory address holds one byte of information

To store
a double-word, four bytes are required which use four memory addresses.

Additionally, architecture is little-endian. This means that the Least Significant Byte
(LSB) is stored in the lowest memory address. The Most Significant Byte (MSB) is
stored in the highest memory location

var1 = 5,000,00010 (004C4B40)

00 0100100B -  MSB is stored in the highest memory location
4C 0100100A
4B 01001009
40 01001008 -  LSB is stored in the lowest memory address

A properly formatted assembly source file consists of several main parts;
• Data section where initialized data is declared and defined.
• BSS section where uninitialized data is declared.
• Text section where code is placed.

The code is placed in the "section .text" section. There must be a space after the word
'section'. The instructions are specified one per line and each must be a valid instruction
with the appropriate required operands.
The text section will include some headers or labels that define the initial program entry
point. For example, assuming a basic program using the standard system linker, the
following declarations must be included.
global _start
_start:

Addresses are assigned to all statements in the program. The symbol table is a listing or
table of all the program symbols, variable names and program labels, and their
respective addresses in the program.

## Data Movement
Typically, data must be moved into a CPU register from RAM in order to be operated
upon. Once the calculations are completed, the result may be copied from the register
and placed into a variable.

mov <dest>, <src>
The source operand is copied from the source operand into the destination operand. The
value of the source operand is unchanged. The destination and source operand must be
of the same size (both bytes, both words, etc.)

mov     eax,        dword       [myVariable]
what    where       how much        memory
to do   to place    to get      location

*Note 1*, both operands cannot be memory.
*Note 2*, destination operands cannot be an immediate.

## Addresses and Values
The only way to access memory is  with the brackets ([]'s). Omitting the brackets will
not access memory and instead obtain the address of the item. For example:
mov rax, qword [var1] ; value of var1 in rax
mov rax, var1 ; address of var1 in rax
In addition, the address of a variable can be obtained with the load effective address, or
lea, instruction. The load effective address instruction is summarized as follows:
Instruction Explanation
 lea <reg64>, <mem> Place address of <mem> into reg64.