OUTPUT_ARCH("riscv")
ENTRY(_start)

MEMORY
{
    ROM (rx) : ORIGIN = 0x00000000, LENGTH = 256
    RAM (rwx) : ORIGIN = 0x00000100, LENGTH = 256
}

SECTIONS
{
    .text : {
        *(.init)    
        *(.text*)   
        *(.rodata*) 
    } > ROM

    .data : {
        *(.data*)
        *(.bss*)
    } > RAM
}