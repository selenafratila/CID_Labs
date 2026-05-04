# 4-bit Arithmetic Logic Unit (ALU)

This project implements a modular 4-bit ALU in SystemVerilog, designed with a power-efficient architecture that selectively activates functional units.


## Features
*   **Arithmetic Operations:** Addition (with Overflow detection) and Subtraction.
*   **Logic Operations:** Bitwise AND and Bitwise XOR.
*   **Selective Activation:** Uses a **DMUX** to enable only the active module, reducing power consumption.
*   **Output Control:** A 4-to-1 **MUX** routes the result of the active operation to the final output.


## Operation Mapping
| SEL (d/m) | Module | Operation |
| :---: | :---: | :--- |
| `00` | **SUM** | A + B (with Cout) |
| `01` | **DIF** | A - B |
| `10` | **AND** | A & B |
| `11` | **XOR** | A ^ B |
<img width="1175" height="556" alt="Screenshot 2026-05-04 231829" src="https://github.com/user-attachments/assets/01e7f3aa-fe93-42b5-a169-3fb12a02d783" />



## Simulation Waveforms
Below is the timing diagram showing the ALU operations for A=12 and B=7.

<img width="1111" height="541" alt="Screenshot 2026-05-04 232509" src="https://github.com/user-attachments/assets/9d298c03-dd26-45dc-87be-65e5284f3766" />


1. **0-20ns:** Addition -> 12+7 = 19 (Binary `10011`). `sOUT` is 3, `sOVERFLOW` is 1.
2. **20-40ns:** Subtraction -> 12-7 = 5. `sOUT` is 5.
3. **40-60ns:** AND -> `1100 & 0111` = `0100` (Decimal 4). `sOUT` is 4.
4. **60-80ns:** XOR -> `1100 ^ 0111` = `1011` (Decimal 11). `sOUT` is 11.
5. **80ns+:** Enable goes Low. `sOUT` becomes 0.

