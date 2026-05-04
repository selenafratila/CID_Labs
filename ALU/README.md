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

## Simulation Results
Tested with **A = 12** and **B = 7**:
*   **Addition:** 19 (Overflow = 1, Out = 3)
*   **Subtraction:** 5
*   **AND:** 4
*   **XOR:** 11
*   **Enable Low:** All outputs force to 0.

