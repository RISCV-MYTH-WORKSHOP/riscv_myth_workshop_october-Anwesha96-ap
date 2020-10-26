# RISC-V_MYTH_Workshop

For students of "Microprocessor for You in Thirty Hours" Workshop, offered by for VLSI System Design (VSD) and Redwood EDA, find here accompanying live info and links.

Check the folders for assignments for particular days.

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
