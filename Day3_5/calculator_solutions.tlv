\m4_TLV_version 1d: tl-x.org
\SV
//Calculator labs solutions here
Day 3- Cobinational Calculator

m4_TLV_version 1d: tl-x.org
\SV

// =========================================
// Welcome! Try the tutorials via the menu.
// =========================================

// Default Makerchip TL-Verilog Code Template

// Macro providing required top-level module definition, random
// stimulus support, and Verilator config.
m4_makerchip_module // (Expanded in Nav-TLV pane.)
\TLV
$reset = *reset;

$val1[31:0] = $rand1[3:0];
$val2[31:0] = $rand2[3:0];
$sum[31:0] = $val1[31:0] + $val2[31:0];
$diff[31:0] = $val1[31:0] - $val2[31:0];
$prod[31:0] = $val1[31:0] * $val2[31:0];
$div[31:0] = $val1[31:0] / $val2[31:0];
$out[31:0] = $sel[1] ? ($sel[0] ? $div[31:0] : $prod[31:0]) : ($sel[0] ? $diff[31:0] : $sum[31:0]);

// Assert these to end simulation (before Makerchip cycle limit).
*passed = *cyc_cnt > 40;
*failed = 1'b0;
\SV
endmodule
https://makerchip.com/sandbox/02kfkh2YQ/0VmhxZ5
---------------------------------------------------------------------------------

Sequential Calculator

\m4_TLV_version 1d: tl-x.org
\SV

m4_makerchip_module
\TLV
$reset = *reset;
$val1[31:0] = $reset ? 32'b0 : >>1$out;
$val2[31:0] = $rand2[3:0];
$sum[31:0] = $val1[31:0] + $val2[31:0];
$diff[31:0] = $val1[31:0] - $val2[31:0];
$prod[31:0] = $val1[31:0] * $val2[31:0];
$div[31:0] = $val1[31:0] / $val2[31:0];
$out[31:0] = $reset ? 32'b0 : ($sel[1] ? ($sel[0] ? $div[31:0] : $prod[31:0]) : ($sel[0] ? $diff[31:0] : $sum[31:0]));

*passed = *cyc_cnt > 40;
*failed = 1'b0;

\SV

endmodule

https://myth1.makerchip.com/sandbox/0o2fXhVX1/0xGh148
----------------------------------------------------------------------------------------------------------------


Counter and calculator in a single stage

\m4_TLV_version 1d: tl-x.org
\SV
// This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop

m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/bd1f186fde018ff9e3fd80597b7397a1c862cf15/tlv_lib/calculator_shell_lib.tlv'])

\SV
m4_makerchip_module // (Expanded in Nav-TLV pane.)

\TLV
|calc

   @1
     $reset = *reset;
     $val1[31:0] = $reset ? 32'b0 : >>1$out;
     $val2[31:0] = $rand2[3:0];
     $sum[31:0] = $val1[31:0] + $val2[31:0];
     $diff[31:0] = $val1[31:0] - $val2[31:0];
     $prod[31:0] = $val1[31:0] * $val2[31:0];
     $div[31:0] = $val1[31:0] / $val2[31:0];
     $cnt[31:0] = $reset ? 0 : (>>1$cnt[31:0] + 1);
     $out[31:0] = $reset ? 32'b0 : ($sel[1] ? ($sel[0] ? $div[31:0] : $prod[31:0]) : ($sel[0] ? $diff[31:0] :$sum[31:0]));
     
     https://makerchip.com/sandbox/02kfkh2YQ/076hAYq
     
     
     2 cycle calculator

|calc

  @1
     $reset = *reset;
     $val1[31:0] = $reset ? 32'b0 : >>2$out;
     $val2[31:0] = $rand2[3:0];
     $sum[31:0] = $val1[31:0] + $val2[31:0];
     $diff[31:0] = $val1[31:0] - $val2[31:0];
     $prod[31:0] = $val1[31:0] * $val2[31:0];
     $div[31:0] = $val1[31:0] / $val2[31:0];
     $valid[31:0] = $reset ? 0 : (>>1$valid[31:0] + 1);
  @2
     $out[31:0] = $reset ? 32'b0 : ($sel[1] ? ($sel[0] ? $div[31:0] : $prod[31:0]) : ($sel[0] ? $diff[31:0] : $sum[31:0]));
     $reset1 = (!$valid) || $reset;
     
     https://makerchip.com/sandbox/02kfkh2YQ/0nZh7VA
========================================================================================================================================     


Calculator with validity

|calc
@0
$valid = & $rand_valid[1:0];
|calc
?$valid
@1

        $reset = *reset;
        $val1[31:0] = $reset ? 32'b0 : >>2$out;
        $val2[31:0] = $rand2[3:0];
        $sum[31:0] = $val1[31:0] + $val2[31:0];
        $diff[31:0] = $val1[31:0] - $val2[31:0];
        $prod[31:0] = $val1[31:0] * $val2[31:0];
        $div[31:0] = $val1[31:0] / $val2[31:0];
        $valid1[31:0] = $reset ? 0 : (>>1$valid1[31:0] + 1);
        $valid_or_reset = $valid1 || $reset;
     @2
        $out[31:0] = $sel[1] ? ($sel[0] ? $div[31:0] : $prod[31:0]) : ($sel[0] ? $diff[31:0] : $sum[31:0]);
        
        https://makerchip.com/sandbox/02kfkh2YQ/0pghnZ6
 ====================================================================================================================================================       
        
 2 stage calculator with memory

$reset = *reset;
|calc

  ?$valid    // implement the valid signal (only once in two cycles)
     @1
        $val1[31:0] = $reset == 1 ? 0 : >>2$outputcal[31:0];  // output shifted by 2 stages
        $val2[31:0] = $reset == 1 ? 0 : $rand2[3:0];

        $prod[31:0]  = $val1[31:0] * $val2[31:0];
        $quot[31:0]  = $val1[31:0] / $val2[31:0];
        $diff[31:0]  = $val1[31:0] - $val2[31:0];
        $add[31:0]  = $val1[31:0] + $val2[31:0];

     @2
        //$select[2:0] = *reset ? 0 : >>1$select + 1; // TEST: Let select also loop, to get all combinations.
        // calculator output
        $outputcal[31:0] = $reset       == 1         ? 32'd0      :  //reset : set to 0
                         $select[2:0] == 4         ? >>2$mem    :  // recall the memory
                         $select[2:0] == 3         ? $prod    :  //3 multiply
                         $select[2:0] == 2         ? $quot    :  //2 divide
                         $select[2:0] == 1         ? $diff    :  //1 subtract
                                                     $add;      //0 add
        // memory element
        $mem[31:0]    =  $reset       == 1         ? 32'd0       : // reset : set to 0
                         $select[2:0] == 5         ? >>2$outputcal : // store output to memory
                                                     >>2$mem;      // default: retain ($RETAIN?)
                                                     
                                                     
        https://makerchip.com/sandbox/02kfkh2YQ/0y8hr31#
