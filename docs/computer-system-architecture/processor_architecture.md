# Processor Architecture

**Course:** Computer System Architecture  
**Instructor:** Prof. Dr. Computer Architecture

## Navigation

[Table of Contents](../README.md) | 
[Computer Architecture Fundamentals](computer_architecture_fundamentals.md) | 
**Processor Architecture** | 
[Memory Systems](memory_systems.md) | 
[Input/Output Systems](io_systems.md) | 
[Parallel Processing](parallel_processing.md) | 
[Advanced Architectures](advanced_architectures.md)

---

## CPU Components and Organization

The Central Processing Unit (CPU) is the primary component of a computer system that executes instructions of a program. It performs the basic arithmetic, logical, control and input/output operations specified by the instructions.

### Core Components

1. **Control Unit (CU)**
   - Directs the operation of the processor
   - Fetches, decodes, and executes instructions
   - Coordinates the activities of all processor components

2. **Arithmetic Logic Unit (ALU)**
   - Performs arithmetic operations (addition, subtraction, etc.)
   - Performs logical operations (AND, OR, NOT, etc.)
   - Contains circuits for performing these operations

3. **Registers**
   - Small, high-speed memory locations within the CPU
   - Store data, instructions, addresses, and intermediate results
   - Types include:
     - General-purpose registers
     - Special-purpose registers (Program Counter, Instruction Register, etc.)
     - Status registers (flags)

4. **System Bus**
   - Internal pathways that connect CPU components
   - Includes data bus, address bus, and control bus

## Instruction Cycle

The instruction cycle (also called the fetch-decode-execute cycle) is the basic operational process of a computer. It is the process by which a computer retrieves a program instruction from its memory, determines what actions the instruction requires, and carries out those actions.

### Phases of the Instruction Cycle

1. **Fetch**
   - The control unit fetches the next instruction from memory
   - The Program Counter (PC) contains the address of the instruction
   - The instruction is loaded into the Instruction Register (IR)
   - The PC is incremented to point to the next instruction

2. **Decode**
   - The control unit decodes the instruction in the IR
   - Determines what operation to perform and what operands to use
   - Generates the necessary control signals

3. **Execute**
   - The CPU executes the instruction
   - May involve the ALU, registers, memory, or I/O devices
   - Results are stored in registers or memory

4. **Store/Writeback**
   - The results of the execution are stored in the destination specified by the instruction
   - May update registers, memory, or I/O devices

### Instruction Cycle Time Formula

The time required to execute an instruction can be calculated using:

$$T_{execution} = C \times T_{clock}$$

**Formula Explanation:**
- **T_execution**: Total execution time for the instruction
- **C**: Number of clock cycles required for the instruction
- **T_clock**: Duration of one clock cycle (inverse of clock frequency)

Different instructions may require different numbers of clock cycles, and the average number of clock cycles per instruction (CPI) is a key performance metric.

## Pipelining Concepts

Pipelining is a technique used to increase instruction throughput by overlapping the execution of multiple instructions. It divides the instruction cycle into stages, with each stage handling a different part of different instructions simultaneously.

### Basic Pipeline Stages

1. **Instruction Fetch (IF)**
   - Fetch instruction from memory
   - Update Program Counter

2. **Instruction Decode (ID)**
   - Decode instruction
   - Read registers

3. **Execute (EX)**
   - Perform ALU operations
   - Calculate memory addresses

4. **Memory Access (MEM)**
   - Read from or write to memory

5. **Write Back (WB)**
   - Write results back to registers

### Pipeline Performance

The theoretical speedup from pipelining can be calculated using:

$$\text{Speedup} = \frac{\text{Time without pipelining}}{\text{Time with pipelining}}$$

For an ideal pipeline with n stages and m instructions:

$$\text{Speedup} = \frac{n \times m}{n + m - 1}$$

**Formula Explanation:**
- **n**: Number of pipeline stages
- **m**: Number of instructions
- **n × m**: Total time without pipelining (each instruction takes n cycles)
- **n + m - 1**: Total time with pipelining (n cycles for the first instruction, then 1 cycle for each additional instruction)

As the number of instructions (m) approaches infinity, the speedup approaches n (the number of pipeline stages).

### Pipeline Efficiency

Pipeline efficiency measures how well the pipeline is utilized:

$$\text{Efficiency} = \frac{\text{Speedup}}{\text{Number of stages}} \times 100\%$$

**Formula Explanation:**
- **Speedup**: The actual speedup achieved by pipelining
- **Number of stages**: The number of pipeline stages
- A 100% efficient pipeline would achieve a speedup equal to the number of stages

## Hazards and Solutions

Hazards are situations that prevent the next instruction in the instruction stream from executing during its designated clock cycle. They reduce the performance benefits of pipelining.

### Types of Hazards

1. **Structural Hazards**
   - Occur when hardware cannot support all possible combinations of instructions in simultaneous overlapped execution
   - Example: Single memory unit for both instruction fetch and data access

2. **Data Hazards**
   - Occur when an instruction depends on the results of a previous instruction still in the pipeline
   - Types:
     - **RAW (Read After Write)**: An instruction tries to read a source before a previous instruction writes to it
     - **WAR (Write After Read)**: An instruction tries to write to a destination before a previous instruction reads from it
     - **WAW (Write After Write)**: An instruction tries to write to a destination before a previous instruction writes to it

3. **Control Hazards**
   - Occur when the pipeline makes wrong decisions about branch instructions
   - The pipeline may fetch and partially execute instructions that should not be executed

### Solutions to Hazards

1. **Structural Hazard Solutions**
   - Duplicate hardware resources
   - Pipeline stalling (inserting bubbles)

2. **Data Hazard Solutions**
   - **Forwarding (Bypassing)**: Directly routing the result of an operation to where it is needed in a later instruction
   - **Pipeline Stalling**: Inserting no-operation instructions (NOPs) or bubbles
   - **Instruction Scheduling**: Compiler reordering instructions to avoid hazards

3. **Control Hazard Solutions**
   - **Branch Prediction**: Predicting whether a branch will be taken
     - Static prediction: Always predict taken/not taken
     - Dynamic prediction: Use history to make predictions
   - **Delayed Branching**: Executing useful instructions in the branch delay slot
   - **Speculative Execution**: Execute instructions beyond the branch before knowing the branch outcome

### Branch Prediction Accuracy

The effectiveness of branch prediction can be measured by:

$$\text{Prediction Accuracy} = \frac{\text{Number of Correct Predictions}}{\text{Total Number of Branches}} \times 100\%$$

**Formula Explanation:**
- **Number of Correct Predictions**: Branches correctly predicted
- **Total Number of Branches**: All branch instructions encountered
- Higher accuracy reduces pipeline stalls due to control hazards

## Superscalar Architectures

Superscalar architectures can execute multiple instructions in parallel within a single clock cycle. They extend the concept of pipelining by allowing multiple pipelines to operate simultaneously.

### Key Features

1. **Multiple Execution Units**
   - Multiple ALUs, load/store units, branch units, etc.
   - Can execute different types of instructions simultaneously

2. **Instruction-Level Parallelism (ILP)**
   - Executing multiple instructions in parallel
   - Limited by dependencies between instructions

3. **Out-of-Order Execution**
   - Instructions can execute in an order different from the program order
   - Helps to utilize execution units efficiently

4. **Register Renaming**
   - Eliminates WAR and WAW hazards
   - Allows more instructions to execute in parallel

### Superscalar Performance

The performance of a superscalar processor depends on:

$$\text{IPC} = \text{Issue Width} \times \text{Pipeline Utilization}$$

**Formula Explanation:**
- **IPC (Instructions Per Cycle)**: Average number of instructions executed per cycle
- **Issue Width**: Maximum number of instructions that can be issued per cycle
- **Pipeline Utilization**: Fraction of issue slots that are actually used (0 to 1)
- Pipeline utilization is affected by hazards, branch mispredictions, and other factors

## RISC vs CISC Architectures

RISC (Reduced Instruction Set Computer) and CISC (Complex Instruction Set Computer) represent two different philosophies in processor design.

### CISC Characteristics

1. **Complex Instructions**
   - Single instructions can perform multiple operations
   - Variable instruction length
   - Complex addressing modes

2. **Emphasis on Hardware**
   - Complex decoder logic
   - Microcode implementation of complex instructions

3. **Memory-to-Memory Operations**
   - Instructions can operate directly on memory

4. **Examples**
   - x86, x86-64
   - VAX

### RISC Characteristics

1. **Simple Instructions**
   - Each instruction performs one operation
   - Fixed instruction length
   - Simple addressing modes

2. **Emphasis on Software**
   - Compiler optimization
   - More efficient use of registers

3. **Load-Store Architecture**
   - Only load and store instructions access memory
   - All other instructions operate on registers

4. **Examples**
   - ARM
   - MIPS
   - RISC-V
   - SPARC

### Performance Comparison

The performance comparison between RISC and CISC can be expressed using:

$$\text{Execution Time} = \text{Instruction Count} \times \text{CPI} \times \text{Clock Cycle Time}$$

**Formula Explanation:**
- **Execution Time**: Total time to execute a program
- **Instruction Count**: Number of instructions executed
- **CPI (Cycles Per Instruction)**: Average number of clock cycles per instruction
- **Clock Cycle Time**: Duration of one clock cycle

RISC typically has:
- Higher instruction count (more simple instructions needed)
- Lower CPI (simpler instructions execute faster)
- Shorter clock cycle time (simpler hardware allows higher clock frequencies)

CISC typically has:
- Lower instruction count (complex instructions do more work)
- Higher CPI (complex instructions take more cycles)
- Longer clock cycle time (complex hardware may limit clock frequency)

## Advanced Processor Features

Modern processors incorporate various advanced features to improve performance, efficiency, and functionality.

### 1. Branch Prediction

Branch prediction attempts to guess the outcome of a conditional branch before it is executed.

**Branch Prediction Accuracy Impact:**

$$\text{Average CPI} = \text{Base CPI} + \text{Branch Frequency} \times \text{Branch Penalty} \times \text{Misprediction Rate}$$

**Formula Explanation:**
- **Average CPI**: Resulting cycles per instruction with branch prediction
- **Base CPI**: CPI without considering branch mispredictions
- **Branch Frequency**: Fraction of instructions that are branches
- **Branch Penalty**: Number of cycles lost on a misprediction
- **Misprediction Rate**: Fraction of branches that are incorrectly predicted

### 2. Speculative Execution

Speculative execution involves executing instructions before knowing whether they should be executed.

### 3. Dynamic Scheduling

Dynamic scheduling (out-of-order execution) allows the processor to execute instructions as soon as their operands are available, regardless of program order.

**Tomasulo's Algorithm** is a key technique for dynamic scheduling that uses:
- Reservation stations to hold operations waiting for operands
- Register renaming to eliminate WAR and WAW hazards
- Common data bus for forwarding results

### 4. Simultaneous Multithreading (SMT)

SMT allows multiple threads to execute instructions simultaneously on a single core.

**Thread-Level Parallelism (TLP) vs. Instruction-Level Parallelism (ILP):**
- TLP: Parallelism between different threads
- ILP: Parallelism between instructions within a single thread

### 5. Vector Processing

Vector processing performs the same operation on multiple data elements simultaneously.

**Vector Operation Speedup:**

$$\text{Speedup} = \frac{\text{Scalar Execution Time}}{\text{Vector Execution Time}} \approx \frac{n}{\text{Vector Startup Time} + n/\text{Vector Throughput}}$$

**Formula Explanation:**
- **n**: Number of elements in the vector
- **Vector Startup Time**: Time to initiate the vector operation
- **Vector Throughput**: Number of vector elements processed per unit time
- As n increases, the speedup approaches the vector throughput

## Case Study: Modern Processor Architecture

Modern processors like Intel's Core and AMD's Ryzen combine elements of both RISC and CISC designs, along with advanced features to maximize performance.

### Intel Core Architecture

1. **Front-End**
   - Instruction fetch and decode
   - Branch prediction
   - Micro-op cache

2. **Execution Engine**
   - Out-of-order execution
   - Multiple execution units
   - Speculative execution

3. **Memory Subsystem**
   - Multi-level cache hierarchy
   - Memory ordering
   - Prefetching

### Performance Considerations

1. **Power and Thermal Management**
   - Dynamic voltage and frequency scaling
   - Power gating unused components
   - Thermal throttling

2. **Security Features**
   - Memory protection
   - Secure boot
   - Hardware-based encryption

3. **Specialized Instructions**
   - SIMD (Single Instruction, Multiple Data) extensions
   - Cryptography acceleration
   - Neural network operations

## Practical Applications

Understanding processor architecture has practical applications in various fields:

1. **Software Optimization**
   - Writing code that efficiently utilizes processor features
   - Avoiding pipeline stalls and branch mispredictions
   - Leveraging SIMD instructions for data parallelism

2. **System Design**
   - Selecting appropriate processors for specific workloads
   - Balancing performance, power, and cost requirements
   - Designing systems with appropriate memory and I/O capabilities

3. **Performance Analysis**
   - Identifying bottlenecks in software execution
   - Using hardware performance counters
   - Profiling and optimizing critical code paths 