# 4-bit Adder with 7-Segment Display Output

This project implements a 4-bit binary adder that displays the result on a physical 7-segment display. It is designed to be synthesized and programmed onto an FPGA development board .

## FPGA Implementation & Logic

The system translates binary math into a human-readable format through the following hardware-software interaction:

### 1. Hardware Input (Switches)
*   The FPGA reads the state of **8 switches**: 4 for operand `A` and 4 for operand `B`.
*   These physical inputs are mapped to the `sw_a` and `sw_b` logic vectors in the `top_calculator` module.

### 2. Processing (The Adder)
*   The `sumator_4biti` module performs the addition.
*   Even though the inputs are 4-bit, the internal `fir_suma` is **5-bit** to handle the potential carry-out (15 + 15 = 30).

### 3. Display Logic (The Decoder)
*   **Modulo 10 Operation:** Since the FPGA board has 7-segment displays that can only show one digit at a time (0-9), the code uses `valoare % 10`. This extracts the **units digit** of the sum. 
    *   *Example:* If $A+B=12$, the display will show `2`.
*   **Active Low Segments:** Most FPGA boards use common-anode displays. To light up a segment, the corresponding bit in the `segmente` vector must be set to `0`.
*   **Anode Control:** The `anodes = 4'b1110` line tells the FPGA to activate only the rightmost digit while keeping the others turned off.


<img width="1048" height="449" alt="Screenshot 2026-05-04 235711" src="https://github.com/user-attachments/assets/ab6f8017-34bf-4f00-8d5d-19dcb2cceffc" />


## How to Test on FPGA
1.  **Constraints File (.xdc):** Map `sw_a` and `sw_b` to the physical slide switches. Map `segments` and `anodes` to the 7-segment display pins.
2.  **Synthesis & Bitstream:** Run the synthesis in Vivado and generate the bitstream.
3.  **Operation:** Toggle the switches to see the sum changing in real-time on the display.
