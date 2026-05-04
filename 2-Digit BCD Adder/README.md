# 2-Digit BCD (Binary Coded Decimal) Adder

This project implements a structural **2-digit BCD Adder** in SystemVerilog. Unlike a standard binary adder, this circuit ensures that the results are represented in decimal format (0-9 for each digit), making it suitable for driving 7-segment displays or other decimal interfaces.

## 1. Project Overview
In digital electronics, 4 bits can represent 16 values (0-15). However, BCD (Binary Coded Decimal) only uses the first 10 values (0-9). This circuit handles the addition of two-digit decimal numbers and performs automatic correction when a result exceeds 9.

### The "+6" Correction Rule
When the sum of two 4-bit BCD digits is greater than 9, or a carry is generated, the result enters the "illegal" range (10-15). To fix this, the circuit:
1.  Detects if the sum is > 9.
2.  Adds 6 (binary `0110`) to the result.
3.  This skips the 6 forbidden binary states, correctly wrapping the digit back to the 0-9 range and passing a carry to the next digit.

## 2. Circuit Architecture
The design is modular and follows a structural hierarchy:
*   **`sum4`**: A basic 4-bit adder unit.
*   **`cmp`**: A combinational comparator that detects if the sum exceeds 9.
*   **`mux`**: A selector that chooses between the raw sum and the corrected (+6) sum.
*   **`DIGIT_SUM`**: The core BCD cell that adds one decimal digit and applies correction.
*   **`TOP`**: The top-level module that chains two `DIGIT_SUM` units to handle two-digit addition (up to 199).


<img width="1435" height="547" alt="Screenshot 2026-05-05 001403" src="https://github.com/user-attachments/assets/c685e9bc-004d-4762-80ea-d05dec18b16d" />



## 3. Simulation Analysis
The following analysis is based on the functional simulation of the `TEST_TOP` module.


<img width="1107" height="461" alt="Screenshot 2026-05-05 001504" src="https://github.com/user-attachments/assets/5e4682db-8092-4311-9a73-f7463ccc5544" />


| Time Interval | Operation (Decimal) | Inputs (a1a0 + b1b0) | Result (s2 s1 s0) | BCD Correction |
| :--- | :--- | :--- | :--- | :--- |
| **0 - 50 ns** | $75 + 28$ | `75` + `28` | **103** | **Active** (5+8=13 -> 3) |
| **50 - 100 ns** | $10 + 04$ | `10` + `04` | **14** | Not Needed |
| **100 - 150 ns** | $65 + 29$ | `65` + `29` | **94** | **Active** (5+9=14 -> 4) |
| **150 - 200 ns** | $52 + 83$ | `52` + `83` | **135** | Not Needed |
| **200 - 250 ns** | $56 + 87$ | `56` + `87` | **143** | **Active** (6+7=13 -> 3) |

### Key Waveform Observations
*   **s2 (Hundreds Carry):** Becomes `1` whenever the total sum of the two digits exceeds 99.
*   **Correction Logic:** At the 0ns mark, the units addition ($5+8$) correctly results in `s0 = 3` and generates a carry to the tens digit, instead of showing the hexadecimal value `D` (13).


