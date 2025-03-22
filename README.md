# Direct-Mapped-Cache-Design
This project implements a direct-mapped cache architecture using VHDL, targeting functional correctness, simulation, and physical implementation. The cache supports all essential operations such as Read Hit, Write Hit, Read Miss, and Write Miss. The design is tested with behavioral simulation and verified using schematic/layout-level implementation in Cadence Virtuoso.

## Features
- Direct-Mapped Cache Design: Implements a 4-block, 4-byte/block cache (16 bytes total).
- Hierarchical VHDL Modules: Includes decoders, comparators, latches, flip-flops, and state machine and basic logic components.
- Read/Write FSM: Controls all cache operations via a custom finite state machine.
- Simulation-Driven Verification: Simulated using Cadence NCLaunch/SimVision with waveform output.
- Custom Component Development: All modules designed from scratch, from gates to top-level integration.
- DRC & LVS Verified Layouts: Layouts created and verified in Cadence Virtuoso for physical correctness.

## Tools Used
- Cadence Virtuoso – Schematic and layout design (with DRC & LVS checks)
- Cadence NCLaunch / SimVision – Behavioral simulation and waveform analysis
- VHDL - Code development

## Summary of Folders
- codes – Contains all VHDL modules such as chip.vhd, chip_test.vhd, statemachine.vhd and individual components.
- layouts – Includes layout netlists used for LVS, DRC-verified cells, and GDS outputs.
- output – Stores simulation logs, waveform screenshots, and final chip layouts.

## Analysis
Cache FSM handles all four operations with distinct cycle counts:
- Read Miss: 19 cycles
- Write Hit: 3 cycles
- Read Hit: 2 cycles
- Write Miss: 3 cycles
Read Hit and Write Hit are extremely fast; misses initiate memory access logic. Layout and schematic blocks are 100% LVS and DRC clean.

The final integrated chip layout occupies 0.242 mm² (492.025μm × 492.175μm).
