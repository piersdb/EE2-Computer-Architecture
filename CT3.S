Input: R1 (must be an odd number > 0, operation otherwise not specified)
Output: R0
Operation: R0 := -1*-3*-5*....*-n where n is the value input in R1 (result is two's complement signed and truncated to 32 bits)
This calculates the product of all negative odd numbers up to a specified number.
You may use all registers
Your answer must use only the instructions introduced so far. No multiply instruction MUL or variant 4. No ALU instructions with S. No TST instruction. No conditional execution of instructions other than B.
All of these additional features of ARM assembler would help to simplify your answer, but they will be taught later and are not allowed now.