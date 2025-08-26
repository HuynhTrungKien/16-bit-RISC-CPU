# 16-bit RISC CPU
---
## Abstract:
This project presents the design and implementation of a 16-bit Reduced Instruction Set Computing (RISC) processor using the Verilog Hardware Description Language (HDL). The processor architecture consists of essential components, including the Arithmetic Logic Unit (ALU), Register File, Control Unit, and Memory. The design was deployed on a Xilinx Basys 3 FPGA board to validate functionality. The proposed CPU is capable of fetching, decoding, and executing a set of 16-bit instructions. Experimental results demonstrate correct execution of arithmetic, logical, and control instructions, confirming the effectiveness of the design. This work provides a practical foundation for understanding computer architecture and can be extended for educational purposes or as a baseline for more advanced processors.
## Schematic:
![CPU](https://github.com/HuynhTrungKien/16-bit-RISC-CPU/blob/master/CPU.png)

## Operational Procedure:

1) IF (Instruction Fetch):  
   The Program Counter (PC) increases by 2 units from the current address because this CPU operates with 16-bit (2-byte) instructions. The updated PC is used to access the corresponding instruction from the Instruction Memory.  

2) ID (Instruction Decode):  
   The fetched instruction is decoded into several fields such as opcode, source registers, destination register, and function code (e.g., funct3). These fields are forwarded to the corresponding units for further processing.  

3) EX (Execute):  
   Based on the decoded instruction, the Control Unit generates specific control signals to drive the ALU, Branch Unit, Immediate Generator, and other functional blocks. These signals ensure that the correct operation is performed according to the instruction type.  

4) MEM (Memory Access):  
   If the instruction requires a memory operation (load/store), the Control Unit activates the necessary signals to access Data Memory.  

5) WB (Write Back):  
   In this stage, the result produced by the ALU or another functional block is written back to the destination register, if required by the instruction.  

## Instruction format:
### R-type:
| Opcode | Rs1  | Rs2  | Rd   | Funct3 |
|--------|------|------|------|--------|
| 15:12  | 11:9 | 8:6  | 5:3  | 2:0    |

| Order | Command | Opcode | Funct3 | Description           |
|-------|---------|--------|--------|-----------------------|
| 1     | ADD     | 0000   | 000    | rd ← rs1 + rs2        |
| 2     | SUB     | 0000   | 001    | rd ← rs1 – rs2        |
| 3     | AND     | 0000   | 011    | rd ← rs1 & rs2        |
| 4     | OR      | 0000   | 100    | rd ← rs1 | rs2        |
| 5     | XOR     | 0000   | 101    | rd ← rs1 ^ rs2        |
| 6     | SLT     | 0000   | 110    | rd ← (a < b) ? 1 : 0  |
| 7     | SGT     | 0000   | 111    | rd ← (a > b) ? 1 : 0  |
| 8     | SETE    | 0000   | 010    | rd ← (a == b) ? 1 : 0 |

References:

https://www.fpga4student.com/2017/04/verilog-code-for-16-bit-risc-processor.html

https://github.com/michaelriri/16-bit-risc-processor
