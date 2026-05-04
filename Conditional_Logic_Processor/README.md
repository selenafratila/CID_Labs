# Custom Conditional Logic & Arithmetic Processor

This project implements a structural SystemVerilog processing unit that dynamically changes its arithmetic behavior based on input equality and parity conditions. It is a comprehensive exercise in modular design, signal routing, and conditional data paths.

## 1. Module Hierarchy & Structure
The design is purely structural, interconnecting several specialized modules:
*   **Comparator**: Determines the equality of A and B.
*   **DMUX (1-to-4)**: Decodes the input range when equality is met.
*   **Sumators (3-bit & 4-bit)**: Perform the core addition and apply the conditional offset.
*   **Concatenation Unit**: Dynamically builds the correction operand based on parity logic.
*   **MUX (4-bit)**: The final decision point that routes the "Pure Sum" or the "Biased Sum" to the output bus.

<img width="1432" height="540" alt="Screenshot 2026-05-05 003643" src="https://github.com/user-attachments/assets/b16e10da-d2a5-45bd-9cd3-8cc8c41e1c42" />


## 2. Functional Description
The unit processes two 3-bit inputs (**A** and **B**) and produces a result based on the following control flow:

### Scenario A: Equality ($A == B$)
*   **Behavior:** The system acts as a standard adder.
*   **Arithmetic:** `OUT = A + B`.
*   **Signaling:** The **DMUX** is enabled, acting as a "Range Decoder" based on the MSB (bit 2) of the inputs:
    *   If $A[2]$ is `High`, `OUT_dmux` = `1000`.
    *   If $A[2]$ is `Low`, `OUT_dmux` = `0001`.

### Scenario B: Inequality ($A \neq B$)
*   **Behavior:** The system enters a "Biased Sum" mode.
*   **Arithmetic:** A dynamic offset (either **6** or **14**) is added to the standard sum.
*   **Logic:** The offset is determined by a gate-level parity check ($w3$) on the Least Significant Bits of the operands.
*   **Purpose:** The addition of **14** (`1110`) serves as a dynamic bias to test the overflow logic (Carry Flag) and create a non-linear mapping for specialized encoding tasks.


<img width="1548" height="658" alt="Screenshot 2026-05-05 003821" src="https://github.com/user-attachments/assets/78f3c865-1dc3-420b-8ef4-f9f2ba00a7a6" />



## 3. Simulation & Testbench Cases
The provided `testbench` validates the following states:
1.  **Equality (Odd/Even):** Tests $7+7$ and $2+2$ to verify DMUX activation and standard addition.
2.  **Inequality (Parity Shift):** Tests cases like $5+4$ or $6+7$ to observe the application of the $+6$ or $+14$ offset and the resulting **Carry Flag (CF)**.
]
