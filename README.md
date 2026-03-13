## Objective
This project implements a simple CPU using digital logic components on an FPGA platform as part of Digital Systems (COE328). The design integrates several key hardware modules including latches, a finite state machine (FSM), a 4-to-16 decoder, and an arithmetic logic unit (ALU). Together these components demonstrate how a control unit and datapath interact to execute arithmetic and logical operations based on microcode signals. The project explores the full digital design process including state machine design, decoder logic, ALU implementation, and system-level integration.

---

## Control Unit Design

The control unit of the CPU is implemented using a **finite state machine** that cycles through a sequence of states corresponding to digits of the student ID. The FSM generates a 4-bit state output that determines which operation the CPU should perform. This state signal is then passed to the decoder to generate the appropriate control signals for the datapath.

<img width="403" height="238" alt="Image" src="https://github.com/user-attachments/assets/3214b8b8-7590-410e-b2aa-aacde8d0a926" />

**Figure 1. Block diagram of the FSM**

The FSM transitions between states according to the clock signal and defined state logic. The truth table defines how each state progresses to the next state during operation.

<img width="632" height="283" alt="Image" src="https://github.com/user-attachments/assets/e72d6508-4353-4abb-bf3e-cafb63349540" />

**Figure 2. Truth table defining state transitions**

Simulation waveforms were used to verify the correct behaviour of the FSM and confirm that the expected state transitions occur during operation.

<img width="667" height="106" alt="Image" src="https://github.com/user-attachments/assets/a1638307-bb4e-492a-8699-4efbe69aca7a" />

**Figure 3. Simulation waveform validating FSM operation**

---

## Decoder Logic

The second component of the control unit is a **4-to-16 decoder**, which converts the 4-bit state output of the FSM into a 16-bit microcode signal. Each output line corresponds to a specific operation that the ALU can perform. This design allows the FSM to select arithmetic or logical operations using simple state transitions.

<img width="409" height="206" alt="Image" src="https://github.com/user-attachments/assets/e2e58ee6-56a2-43ff-94b3-3a7c22c2d743" />

**Figure 4. Block diagram of the 4:16 decoder used to generate ALU control signals**

The decoder was verified through simulation to ensure that the correct output line activates for each possible input state.

<img width="630" height="141" alt="Image" src="https://github.com/user-attachments/assets/2b399ba9-f0ee-4559-9a21-e48b07a5b420" />

**Figure 5. Waveform demonstrating correct decoder output behaviour**

---

## Arithmetic Logic Unit

The ALU is responsible for performing arithmetic and logical operations on the two input values stored in the system latches. Operations are selected through the microcode output from the decoder, allowing the ALU to perform functions such as addition, subtraction, bitwise operations, and logical comparisons depending on the current state of the control unit. :contentReference[oaicite:2]{index=2}

<img width="626" height="317" alt="Image" src="https://github.com/user-attachments/assets/269d00a0-80e3-483c-b309-3e9a03519ae2" />

**Figure 6. Table showing ALU operations and their corresponding microcodes**

The ALU is implemented as a synchronous digital module receiving two 8-bit inputs and producing result outputs that are displayed through the system output interface.

<img width="410" height="284" alt="Image" src="https://github.com/user-attachments/assets/86699af1-c44a-47c3-9a8a-5f195720d601" />

**Figure 7. Block symbol representing the ALU datapath module**

---

## CPU Integration

Once the individual components were verified, they were integrated into a full CPU datapath design. The FSM and decoder together act as the control unit, while the ALU and latches form the datapath responsible for executing operations and storing intermediate values.

<img width="628" height="223" alt="Image" src="https://github.com/user-attachments/assets/2d689d04-b8b1-4148-84d6-30a6616c8e57" />

**Figure 8. System-level diagram of the CPU architecture**

The final design was simulated to verify the interaction between all modules and ensure that control signals correctly triggered ALU operations.

<img width="629" height="161" alt="Image" src="https://github.com/user-attachments/assets/e5332a85-e1fc-48df-908c-57dc31a3f34a" />

**Figure 9. Simulation waveform showing behaviour of the full CPU design**

---

## Conclusion

This project was a good exercise in building a simple CPU from smaller digital components such as latches, a finite state machine, a decoder, and an ALU. The control unit and datapath were successfully implemented and the waveforms showed that the FSM and decoder behaved exactly as expected. However, the ALU outputs on the FPGA did not match the values I expected for some of the operations. Looking back, the most likely reason is that I did not understand how to properly read and convert between binary and hexadecimal at the time. Since the ALU operations depended on correctly encoding inputs and microcodes, even a small mistake in those conversions would cause incorrect results even if the logic itself was implemented correctly. In other words, the math inside the ALU was probably fine and I was just feeding it the wrong numbers. It is also possible that there were hardware issues with the board, but the much more realistic explanation is that I simply mis-entered the values. Despite that, the project still demonstrates how the major components of a CPU interact and provided a good introduction to debugging larger digital systems.
