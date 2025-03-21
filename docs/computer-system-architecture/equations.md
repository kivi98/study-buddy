# Computer System Architecture Equations

**Course:** Computer System Architecture  
**Instructor:** Prof. Dr. Computer Architecture

## Navigation

[Table of Contents](../README.md) | 
[Computer Architecture Home](README.md) | 
[Computer Architecture Fundamentals](computer_architecture_fundamentals.md) | 
[Processor Architecture](processor_architecture.md) | 
[Memory Systems](memory_systems.md) | 
[Input/Output Systems](io_systems.md) | 
[Parallel Processing](parallel_processing.md) | 
[Advanced Architectures](advanced_architectures.md)

---

## Overview

This document contains a collection of all the important equations used in Computer System Architecture, organized by topic. Each equation includes an explanation of its variables and significance.

## Performance Metrics

### Execution Time

$$\text{Execution Time} = \text{Instruction Count} \times \text{Cycles Per Instruction (CPI)} \times \text{Clock Cycle Time}$$

**Formula Explanation:**
- **Execution Time**: Total time required to complete a task or program execution
- **Instruction Count**: Total number of instructions executed by the CPU
- **CPI (Cycles Per Instruction)**: Average number of clock cycles needed to execute one instruction
- **Clock Cycle Time**: Duration of one clock cycle in seconds (inverse of clock frequency)

### Throughput

$$\text{Throughput} = \frac{\text{Number of Tasks Completed}}{\text{Total Time}}$$

**Formula Explanation:**
- **Throughput**: Rate at which tasks are completed by the system
- **Number of Tasks Completed**: Total count of tasks processed
- **Total Time**: Time period over which the measurement is taken

### MIPS (Million Instructions Per Second)

$$\text{MIPS} = \frac{\text{Instruction Count}}{\text{Execution Time} \times 10^6}$$

**Formula Explanation:**
- **MIPS**: Measure of instruction execution rate in millions of instructions per second
- **Instruction Count**: Number of instructions executed
- **Execution Time**: Time in seconds
- **10^6**: Conversion factor to express the result in millions

### FLOPS (Floating-Point Operations Per Second)

$$\text{FLOPS} = \text{Number of Floating-Point Operations per Cycle} \times \text{Clock Frequency}$$

**Formula Explanation:**
- **FLOPS**: Measure of floating-point computation speed
- **Number of Floating-Point Operations per Cycle**: How many floating-point operations a processor can complete in one clock cycle
- **Clock Frequency**: Number of cycles per second (Hz)

### Amdahl's Law

$$\text{Speedup} = \frac{1}{(1-p) + \frac{p}{n}}$$

**Formula Explanation:**
- **Speedup**: The factor by which execution time is reduced
- **p**: Proportion of execution time that can be parallelized (0 ≤ p ≤ 1)
- **n**: Number of processors
- **(1-p)**: Proportion of execution time that remains sequential
- **p/n**: The parallelizable portion divided by the number of processors

## Processor Architecture

### Instruction Cycle Time

$$T_{execution} = C \times T_{clock}$$

**Formula Explanation:**
- **T_execution**: Total execution time for the instruction
- **C**: Number of clock cycles required for the instruction
- **T_clock**: Duration of one clock cycle (inverse of clock frequency)

### Pipeline Speedup

$$\text{Speedup} = \frac{\text{Time without pipelining}}{\text{Time with pipelining}}$$

For an ideal pipeline with n stages and m instructions:

$$\text{Speedup} = \frac{n \times m}{n + m - 1}$$

**Formula Explanation:**
- **n**: Number of pipeline stages
- **m**: Number of instructions
- **n × m**: Total time without pipelining (each instruction takes n cycles)
- **n + m - 1**: Total time with pipelining (n cycles for the first instruction, then 1 cycle for each additional instruction)

### Pipeline Efficiency

$$\text{Efficiency} = \frac{\text{Speedup}}{\text{Number of stages}} \times 100\%$$

**Formula Explanation:**
- **Speedup**: The actual speedup achieved by pipelining
- **Number of stages**: The number of pipeline stages

## Memory Systems

### Average Memory Access Time (AMAT)

$$\text{AMAT} = \text{Hit Time} + \text{Miss Rate} \times \text{Miss Penalty}$$

**Formula Explanation:**
- **AMAT**: Average time to access memory across all memory requests
- **Hit Time**: Time to access data if found in the current level of memory
- **Miss Rate**: Fraction of accesses not found in the current level (1 - Hit Rate)
- **Miss Penalty**: Additional time required to retrieve data from the next level

For a multi-level memory hierarchy:

$$\text{AMAT} = \text{Hit Time}_{L1} + \text{Miss Rate}_{L1} \times (\text{Hit Time}_{L2} + \text{Miss Rate}_{L2} \times \text{Miss Penalty}_{L2})$$

### Cache Mapping

#### Direct-Mapped Cache

$$\text{Cache Line} = \text{Memory Address} \bmod \text{Number of Cache Lines}$$

**Formula Explanation:**
- **Cache Line**: The location in cache where the data will be stored
- **Memory Address**: The address in main memory
- **Number of Cache Lines**: Total number of lines in the cache

#### Set-Associative Cache

$$\text{Set Number} = \text{Memory Address} \bmod \text{Number of Sets}$$

**Formula Explanation:**
- **Set Number**: The set in cache where the data can be stored
- **Memory Address**: The address in main memory
- **Number of Sets**: Total number of sets in the cache (cache size / (block size × associativity))

### Cache Performance Metrics

#### Hit Rate

$$\text{Hit Rate} = \frac{\text{Number of Cache Hits}}{\text{Total Number of Memory Accesses}}$$

**Formula Explanation:**
- **Hit Rate**: Fraction of memory accesses found in the cache
- **Number of Cache Hits**: Memory accesses that found data in cache
- **Total Number of Memory Accesses**: All memory access attempts

#### Miss Rate

$$\text{Miss Rate} = 1 - \text{Hit Rate} = \frac{\text{Number of Cache Misses}}{\text{Total Number of Memory Accesses}}$$

**Formula Explanation:**
- **Miss Rate**: Fraction of memory accesses not found in the cache
- **Number of Cache Misses**: Memory accesses that did not find data in cache
- **Total Number of Memory Accesses**: All memory access attempts

### Virtual Memory

#### Virtual to Physical Address Translation

$$\text{Physical Address} = \text{Frame Number} \times \text{Page Size} + \text{Offset}$$

Where:

$$\text{Frame Number} = \text{Page Table}[\text{Virtual Page Number}]$$
$$\text{Virtual Page Number} = \lfloor \text{Virtual Address} / \text{Page Size} \rfloor$$
$$\text{Offset} = \text{Virtual Address} \bmod \text{Page Size}$$

**Formula Explanation:**
- **Physical Address**: The actual memory location
- **Frame Number**: The physical memory frame number from the page table
- **Page Size**: Size of each page/frame (typically 4KB to 2MB)
- **Offset**: Position within the page/frame
- **Virtual Page Number**: Index into the page table
- **Virtual Address**: The address used by the program

#### Segment Address Translation

$$\text{Physical Address} = \text{Base Address} + \text{Offset}$$

**Formula Explanation:**
- **Physical Address**: The actual memory location
- **Base Address**: Starting address of the segment in physical memory
- **Offset**: Position within the segment

#### TLB Performance Impact

$$\text{Effective Access Time} = \text{TLB Hit Time} + \text{TLB Miss Rate} \times \text{TLB Miss Penalty}$$

**Formula Explanation:**
- **Effective Access Time**: Average time for address translation
- **TLB Hit Time**: Time to access the TLB and find the mapping
- **TLB Miss Rate**: Fraction of translations not found in TLB
- **TLB Miss Penalty**: Time to access the page table in memory

## I/O Systems

### DMA Performance Impact

$$\text{Effective Bandwidth} = \frac{B}{T_{setup} + \frac{B}{BW} + T_{completion}}$$

**Formula Explanation:**
- **Effective Bandwidth**: Actual data transfer rate achieved
- **B**: Amount of data transferred
- **T_setup**: Time to set up the DMA transfer
- **BW**: Raw bandwidth of the I/O path
- **T_completion**: Time to complete the operation after transfer

### DMA Transfer Efficiency

$$\text{DMA Efficiency} = \frac{T_{data\_transfer}}{T_{data\_transfer} + T_{overhead}}$$

**Formula Explanation:**
- **DMA Efficiency**: Fraction of time spent transferring data
- **T_data_transfer**: Time spent actually transferring data
- **T_overhead**: Time spent on DMA setup and completion

### Bus Bandwidth

$$\text{Bus Bandwidth} = \text{Width} \times \text{Clock Speed} \times \text{Efficiency}$$

**Formula Explanation:**
- **Bus Bandwidth**: Maximum data transfer rate
- **Width**: Number of data bits transferred in parallel (bits)
- **Clock Speed**: Bus clock frequency (Hz)
- **Efficiency**: Fraction of clock cycles used for data transfer

### PCIe Bandwidth Calculation

$$\text{PCIe Bandwidth} = \text{Lanes} \times \text{Lane Speed} \times \text{Encoding Efficiency}$$

**Formula Explanation:**
- **PCIe Bandwidth**: Maximum data transfer rate
- **Lanes**: Number of PCIe lanes
- **Lane Speed**: Data rate per lane (e.g., 8 GT/s for PCIe 3.0)
- **Encoding Efficiency**: Overhead of encoding scheme (e.g., 128b/130b for PCIe 3.0)

### Bus Utilization

$$\text{Bus Utilization} = \frac{\text{Time Bus is Transferring Data}}{\text{Total Time}}$$

**Formula Explanation:**
- **Bus Utilization**: Fraction of time the bus is actively transferring data
- **Time Bus is Transferring Data**: Time spent on actual data transfer
- **Total Time**: Total elapsed time

## Advanced Architectures

### GPU Performance Metrics

#### Theoretical FLOPS

$$\text{Theoretical FLOPS} = \text{Cores} \times \text{Clock Speed} \times \text{FLOPs per Cycle per Core}$$

**Formula Explanation:**
- **Theoretical FLOPS**: Maximum floating-point operations per second
- **Cores**: Number of processing elements
- **Clock Speed**: GPU clock frequency
- **FLOPs per Cycle per Core**: Operations each core can perform per cycle

#### GPU Memory Bandwidth

$$\text{Memory Bandwidth} = \text{Memory Clock} \times \text{Bus Width} \times \text{Data Rate} / 8$$

**Formula Explanation:**
- **Memory Bandwidth**: Maximum data transfer rate (bytes/second)
- **Memory Clock**: Memory clock frequency (Hz)
- **Bus Width**: Width of the memory interface (bits)
- **Data Rate**: Transfers per clock cycle (e.g., 2 for GDDR5)
- **Division by 8**: Conversion from bits to bytes

#### GPU Occupancy

$$\text{Occupancy} = \frac{\text{Active Warps}}{\text{Maximum Warps}}$$

**Formula Explanation:**
- **Occupancy**: Ratio of active warps to maximum possible warps
- **Active Warps**: Number of warps that can be scheduled
- **Maximum Warps**: Hardware limit on warps per compute unit

### Quantum Computing

#### Quantum Volume

$$\text{Quantum Volume} = 2^{\min(d, m)}$$

**Formula Explanation:**
- **Quantum Volume**: Metric for quantum computer capability
- **d**: Circuit depth (number of operations before errors dominate)
- **m**: Number of qubits

### Neuromorphic Computing

#### Energy Efficiency

$$\text{Energy per Synaptic Operation} = \frac{\text{Total Energy Consumption}}{\text{Number of Synaptic Operations}}$$

**Formula Explanation:**
- **Energy per Synaptic Operation**: Energy efficiency metric (Joules/op)
- **Total Energy Consumption**: Power consumed during computation
- **Number of Synaptic Operations**: Computational work performed

#### Synaptic Operations Per Second (SOPS)

$$\text{SOPS} = \text{Neurons} \times \text{Average Synapses per Neuron} \times \text{Average Firing Rate}$$

**Formula Explanation:**
- **SOPS**: Computational throughput
- **Neurons**: Number of neurons in the system
- **Average Synapses per Neuron**: Connectivity density
- **Average Firing Rate**: How frequently neurons activate (Hz) 