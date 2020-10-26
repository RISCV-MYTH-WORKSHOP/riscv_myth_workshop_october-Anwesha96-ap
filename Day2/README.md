List of commands in day 2


Creating the C code file
$leafpad 1to9_custom.c 

Creating the assembly language code file
$leadpad load.S   

To compile the c and assembly lang code suing riscv compiler:
$riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o 1to9_custom.o 1to9_custom.c load.S  
$spike pk 1to9_custom.o

To compile and debug using spike:
$spike -d pk 1to9_custom.o

To check for the assembly outfule file:
$riscv64-unknown-elf-objdump -d 1to9_custom.c |less

To gitclone the RISC-V repository:
$git clone https://github.com/kunalg123/riscv_workshop_collaterals.git


$cd riscv_workshop_collaterals
$cd labs
$ls -ltr
$vim picorv32.v
$less picorv32.v
$vim testbench.v
$vim rv32im.sh
$chmod 777 rv32im.sh
$vim firmware.hex
$vim firmware32.hex

Programs
1to9Custom.c

#include <stdio.h>

extern int load (int x, int y);

int main()
{
	int result = 0;
	int count = 9;
	result = load(0x0, count+1);  // These are the two numbers which we are going to pass to the assembly language program through this particular function - Function call
	printf("Sum of number from 1 to %d is %d\n", count, result);
}
-=============================================================

load.s
 
.section .text
.global load
.type load, @function
#The above are some of the codes which is needed to write assembly language program

load: 
		add 	a4, a0, zero	//Instanstiate sum register a4 with 0x0; a4 =a0+0;
		add 	a2, a0, a1		//Store cunt of 10 in register a2. Register a1 is loaded with 0xa (decimal 10) from main function
		add		a3, a0, zero	//Initialize intermediate sum register a3 by 0;

loop: 
		add 	a4, a3, a4		// Increment addition : a4 = a3+a4;
		addi 	a3, a3, 1		// Increment intermediate register by 1
		blt 	a3, a2, loop	// blt means branch if less than. If a3 is less than a2, branch to label named <loop>
		add 	a0, a4, zero	// Store the final result to register a0 so that it can be read b the main program
		ret
