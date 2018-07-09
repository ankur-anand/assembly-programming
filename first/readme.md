All the .s file is the source code, which is the human readble form of a program. In order to transform it into a program that a computer can run, we need to assemble and link it.

# the first step is to assemble it.

Assembling is the process that transforms the source code into instructions for the machine.

`as outlook.s -o outlook.o`

**as is the command which runs the assembler**

`outlook.o` is an object file. An object file is code that is in the machine's language, but has not been **completely put together** Why ?

Because In most large programs, you will have several source files, and you will convert each one into a object file.

## The linker is the program that is responsile for putting the object files together and adding information to it so that the kernel knows how to load and run it.

link the file
`ld outllook.o -o outlook`

ld is the command to run the linker
