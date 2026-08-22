.section .init, "ax"
.global _start

_start:
    # Initialize the Stack Pointer to a safe address in your RAM.
    # Assuming RAM is small, we will start the stack at address 256 (0x100).
    li sp, 256
    
    # Jump to the main C function
    jal main

    # If main ever returns, trap the CPU in an infinite loop
halt:
    j halt