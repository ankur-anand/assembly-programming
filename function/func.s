# stack - in memory the stacks starts at the top of memory
# and grows downward due to architectural considerations.
# When we push a value onto the stack, the top of the stack
# moves to accomodate the additional value. We can actually
# continually push values onto the stack and it will keep
# growing further and further down in memory until we hit
# our code or data.
# So how do we know where the current "top" of the stack is?
# The stack register, %esp, always contains a pointer to the
# current top of the stack, wherver it is.
# Every time we push something onto the stack with pushl, %esp
# gets substracted by 4 so that it points to the new top of the
# stack (remember, each word is four bytes long, and the stack
# grows downward). If we want to remove something from the
# stack, we simply use the popl instruction, which adds 4 to
# %esp and puts the previous top value in whatever register you
# specified.

# If we simply want to access the value on the top of the stack
# without removing it, We can simply use the %esp register in
# indirect addressing mode.
# movl (%esp), %eax
# movl %esp, %eax would just hold the pointer to the top of the
# stack rather than the value at the top.
# Putting %esp in the paranthesis causes the computer to go
# to indirect addressing mode, and therefore we get the value pointed
# to by %esp.
# if we want to access the value right below the top of the stack
# we can simply issue this instruction: movl 4(%esp), %eax
# This instruction uses the base pointer addressing mode which
# simply adds 4 to %esp before looking up the value being pointed
# to.

# In most general purpose programming, Before executing a function
# a program pushes all of the parameters for the function onto the
# stack in the reverse order that they are documented.
# Then the program issues a call instructionn indicating which
# function it wishes to start. The Call instruction does two things
# First it pushes the address of the next instruction, which is
# the return adress, onto the stack. Then it modifies the instruction
# pointer (%eip) to point to the start of the function.
# Parameter #N
# ...
# Parameter 2
# Parameter 1
# Return Address <--- (%esp)

# Function Works
# Save the current base pointer register, %ebp, by doing pushl %ebp.
# The base pointer is a special register used for accessing function
# parameters and locaal variables.
# Next, it copies the stack pointer to %ebp by doing movl %esp, %ebp
# This allow, you to be able to access the functions parameters as 
# fixed indexes from the base pointer.
