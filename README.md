# RISC-V_MYTH_Workshop

For students of "Microprocessor for You in Thirty Hours" Workshop, offered by for VLSI System Design (VSD) and Redwood EDA, find here accompanying live info and links.

Check the folders for assignments for particular days.
Day 1: Instruction set architecture
Day 1 was all about the introduction to RISC-V ISA and GNU Compiler. We were intrduced to VSD-IAT platform developed by jnaapti. Initially, the oration was given on the overall flow of the architecture. It was like how OS is used as interface between user and the machine. Then the higher level language like C/C++ through compiler is converted to Instructions. Instruction act as an abstract interface between software(program) and hardware. This Interface is called as instruction Set Architecture(ISA). This instruction is converted to Assembly Programming via assembler then into machine(binary format). It is then sent to RTL coding and then to Physical Design Implementation.

The various types of instructions used in RISC-V :

RV64I: Base Integer Instruction Set, 64-bit. Eg - lui, sd, add, jalr, ld etc.
RV64M: Standard Multiply Extension for Integer Multiplication and Division. Eg - mulw, divw etc.
RV64IM: If any CPU performs base as well as multiply and division it is Base and Mutiple extension.
RV64F and RV64D: Single and double precision floating point extensions. Eg - fadd.s, fcvt.d.s, fmv.x.d etc
If it includes all the above then: RV64IMFD

GNU Compiler is required for RISC-V and simulator. We need to set it up on Ubuntu which is installed in VM Virtual Box for Windows OS. Here we installed GNU compiler and Spike siulator which will be required for debugging as well.
Day 4
On this day, the plan was to implement the following :

Program Counter (PC)
Imem-Rd ( Instruction Memory)
Instruction Decoder
Register File Read
Arithmatic Logic Unit (ALU)
Register File Write
Branch
Thus the instruction set architecture of base integer instructions, The register file, branching,etc. and eventually the CPU core was built and tested(using appropriate testbench logic, and assembly code developed on Day 2) at the end of the day ,in similar progressive fashion like the previous day.The code can be found here.

RISC-V CORE Diagram 

RISC-V CORE Debug Vizualizer 

RISC-V CORE Waveform 

Day 5 Pipelining the RISCV Core.
Finally,we developed the pipelined model for the core developed on Day 4.

A 3 cycle RISC V pipelined core, with all the base integer instruction sets was developed.
For Load and store a Data memory element was added with neccessary instruction decoding logic.
Register Bypass and Squashing techniques were also incorporated to prevent Read followed by write and branchinghazards, arised due to pipelining.
Testing of the pipeline design was done in same manner with Load and store incorporated in asm code.
Additionally Incorporation of Jump feature (JAL and JALR instructions) was also done.
