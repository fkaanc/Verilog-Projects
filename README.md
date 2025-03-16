# Verilog Projects

This repository contains various projects implemented using Verilog. Each project has its own folder, and each folder includes a testbench file (denoted with `_tb`) to test the functionality of the design.

## Projects Included

- Basic ALU (Arithmetic Logic Unit)
- HelloWorld
- Encoders
- Multiplexer (2x1)
- Flip Flops (D Flip-flop and T Flip-flop)
- Counters
- Memory (RAM)
- Parity


## How to Run the Projects with Testbenches

Each project has a corresponding testbench file that can be used to simulate and verify the design. For example, the **ALU** project includes a testbench file named `alu_tb.v` and the design file `alu.v`.

To run a project, follow these general steps:

1. Open your terminal in the project folder.
2. Run the simulation using Icarus Verilog (or any other Verilog simulator):
    ```bash
    iverilog -o <output_file> <design_file.v> <testbench_file_tb.v>
    vvp <output_file>
    ```
3. You should see the simulation results in your terminal.
![Image](https://github.com/user-attachments/assets/6f03e1ca-d8b4-4fe9-b662-d555838719c1)
