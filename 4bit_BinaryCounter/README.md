# 4-bit Binary Counter

This project implements a **4-bit synchronous binary counter** in SystemVerilog. It serves as a fundamental example of sequential logic design, demonstrating how to use clock-driven events and control signals to manage a digital state.

## 1. Design Overview
The `Numarator` module is a simple yet robust counter that increments its value on every positive edge of the clock, provided the reset is inactive and the enable signal is high.


<img width="1015" height="354" alt="Screenshot 2026-05-05 010206" src="https://github.com/user-attachments/assets/8fbbe2fa-5213-482b-92b4-f6fb2c864235" />


### Functional Logic:
*   **Clock (`ck`)**: All operations are synchronized to the rising edge of the clock signal.
*   **Synchronous Reset (`reset`)**: When active, the counter returns to `0` at the next clock tick.
*   **Enable (`en`)**: Acts as a gate. If `en` is low, the counter holds its current value.
*   **4-bit Output (`out_num`)**: Cycles from `0` to `15` (4'b1111).

## 2. Simulation Analysis (Based on Waveform)

The provided simulation confirms the synchronous behavior of the circuit:


<img width="1109" height="493" alt="Screenshot 2026-05-05 010031" src="https://github.com/user-attachments/assets/a3c3827d-e063-462d-a294-132304312063" />



*   **Initial State**: The output starts at `X` (unknown) until the first valid clock edge.
*   **Reset Action**: When `s_reset` goes high (around 50ns), the counter immediately drops to `0` at the next rising edge of `s_ck`.
*   **Counting Sequence**: Once `s_reset` is low and `s_en` is high, we see a clean increment from `0` through `15`. 
*   **Overflow**: After reaching `15`, the counter naturally rolls over back to `0`.
*   **Enable Hold**: At the end of the simulation, when `s_en` goes low, the counter stops at value `3` and holds it, ignoring further clock cycles.

## 3. Module Interface
| Signal | Direction | Description |
| :--- | :--- | :--- |
| `ck` | Input | System clock (rising edge triggered) |
| `reset` | Input | Synchronous reset (active high) |
| `en` | Input | Counter enable signal |
| `out_num[3:0]` | Output | 4-bit current count value |

