# Single-Port Synchronous RAM (128x8)

Simple implementation of a synchronous RAM module with 128 addresses and 8-bit data width.

## Features
*   **Memory Size:** 128 words x 8 bits.
*   **Synchronous Write:** Data is saved to `ram[adr]` on the rising edge of the clock when `we (write enable)`  is active.
*   **Synchronous Read:** Output `data_out` is updated on the clock edge, providing a registered and stable output.


  <img width="1035" height="366" alt="Screenshot 2026-05-05 004555" src="https://github.com/user-attachments/assets/8a56196d-ec1c-4251-8e7d-3593ef00384b" />


## How it works
1.  **Write:** Set `adr` and `data_in`, then pull `we` high for one clock cycle.
2.  **Read:** Set `adr`; the stored value appears at `data_out` on the next positive clock edge.

## Simulation Summary


<img width="1266" height="508" alt="Screenshot 2026-05-05 005038" src="https://github.com/user-attachments/assets/397e58fe-6d4d-4837-8532-281367d208a8" />



The testbench performs basic Write/Read cycles:
*   Writes values `13`, `14`, and `16` to addresses `3`, `4`, and `6`.
*   Reads them back to verify data integrity and clock synchronization.


