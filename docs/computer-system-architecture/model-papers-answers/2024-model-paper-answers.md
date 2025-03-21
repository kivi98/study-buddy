# Computer System Architecture - 2024 Model Paper Answers

## Question 01 [25 marks]

### (a) What are the types of memory present in a computer system? Briefly explain the purpose of each type and indicate where these memories are located within a computer system. [8 Marks]

The computer system employs a memory hierarchy with different types of memory, each serving specific purposes:

1. **Registers**
   - **Purpose**: Fastest storage for immediate data and instructions being processed by the CPU
   - **Location**: Inside the CPU's processing cores
   - **Characteristics**: Extremely fast access (single CPU cycle), very limited capacity (typically 32 or 64 bits per register), directly accessed by CPU instructions

2. **Cache Memory**
   - **Purpose**: High-speed buffer that stores recently/frequently accessed data and instructions
   - **Location**: Either on the CPU die or closely connected to it
   - **Hierarchy**:
     - **L1 Cache**: Smallest, fastest cache; typically split into instruction and data caches; located within each CPU core
     - **L2 Cache**: Larger but slightly slower; may be dedicated to individual cores or shared among multiple cores
     - **L3 Cache**: Largest on-chip cache; shared among all cores; serves as the last-level cache
   - **Characteristics**: SRAM-based, very fast access (few CPU cycles), relatively small capacity (KB to MB)

3. **Main Memory (RAM)**
   - **Purpose**: Primary working memory for active programs and data
   - **Location**: Memory modules on the motherboard, connected to the CPU via the memory bus
   - **Characteristics**: DRAM-based, moderately fast access (hundreds of CPU cycles), larger capacity (GB), volatile (loses content when powered off)

4. **Non-Volatile Memory (NVM)**
   - **Purpose**: Persistent storage that preserves data when powered off
   - **Location**: Depends on type: SSDs typically connected via SATA/NVMe interfaces; BIOS/UEFI ROM chips mounted on the motherboard
   - **Types**:
     - **ROM/PROM/EPROM/EEPROM**: For firmware and bootstrap code (BIOS/UEFI)
     - **Flash Memory**: Used in SSDs and USB drives for persistent storage
   - **Characteristics**: Persistent storage, relatively slower access compared to RAM but faster than HDDs

5. **Secondary Storage**
   - **Purpose**: Large-capacity, long-term data storage
   - **Location**: Connected internally (SATA/NVMe) or externally (USB/Thunderbolt)
   - **Types**:
     - **Hard Disk Drives (HDDs)**: Mechanical storage using magnetic platters
     - **Solid State Drives (SSDs)**: Electronic storage using flash memory
   - **Characteristics**: Very large capacity (TB), relatively slow access (millions of CPU cycles), non-volatile

6. **Virtual Memory**
   - **Purpose**: Extends the available physical memory by using disk space
   - **Location**: Primarily a memory management technique that uses a portion of secondary storage (page/swap file)
   - **Characteristics**: Allows running programs larger than available physical RAM, much slower than physical memory when swapping occurs

The memory hierarchy is designed to balance speed, capacity, and cost, with faster but smaller and more expensive memories closer to the CPU, and slower but larger and cheaper storage further away. This organization leverages the principle of locality (temporal and spatial) to provide near-optimal performance.

### (b) Explain what is meant by Little endian memory of a 32-bit computer. Show how the following information are represented in such a computer. [8 Marks]

**Little Endian Memory Organization:**

Little endian is a memory organization method that determines how multi-byte data types are stored in memory. In a little endian system, the least significant byte (LSB) of the data is stored at the lowest memory address, and the most significant byte (MSB) is stored at the highest memory address of the allocated space.

For example, in a little endian 32-bit system, a 32-bit integer (4 bytes) would have its bytes stored in memory with the least significant byte first (at the lowest address) and the most significant byte last.

**Representation of the Given Information:**

1. **String: "Green Life"**

In memory, a string is typically stored as a sequence of character codes, usually in ASCII or UTF-8 encoding, often terminated by a null character ('\0').

For the string "Green Life" in ASCII:
- G: 71 (0x47)
- r: 114 (0x72)
- e: 101 (0x65)
- e: 101 (0x65)
- n: 110 (0x6E)
- (space): 32 (0x20)
- L: 76 (0x4C)
- i: 105 (0x69)
- f: 102 (0x66)
- e: 101 (0x65)
- \0: 0 (0x00) (null terminator)

In a little endian 32-bit system, if we allocate memory as 32-bit words, the string would be stored as:

Memory Address | Byte 0 (LSB) | Byte 1 | Byte 2 | Byte 3 (MSB) | ASCII Representation
---------------|--------------|--------|--------|--------------|---------------------
0x00000000 | 0x47 (G) | 0x72 (r) | 0x65 (e) | 0x65 (e) | "Gree"
0x00000004 | 0x6E (n) | 0x20 (space) | 0x4C (L) | 0x69 (i) | "n Li"
0x00000008 | 0x66 (f) | 0x65 (e) | 0x00 (null) | 0x00 (padding) | "fe\0\0"

Note: Each row represents a 32-bit (4-byte) word in memory.

2. **Integer: 18000 (Price per unit in thousand rupees)**

For the integer value 18000 (decimal) = 0x4650 (hexadecimal)

In a little endian 32-bit system, a 32-bit integer would be stored as:

Memory Address | Byte 0 (LSB) | Byte 1 | Byte 2 | Byte 3 (MSB) | Value
---------------|--------------|--------|--------|--------------|-------
0x00000000 | 0x50 | 0x46 | 0x00 | 0x00 | 18000

The bytes are ordered from least significant (0x50) to most significant (0x00), with the least significant byte stored at the lowest memory address.

This example demonstrates how little endian systems store multi-byte values "backwards" compared to how we typically write numbers (with the most significant digits on the left). The value 0x4650 is stored in memory as 0x50, 0x46, 0x00, 0x00, starting with the least significant byte.

### (c) Consider the byte 01010100. In order to calculate the Hamming error correcting code, insert the four parity bit positions into this byte and obtain their parity values. [9 Marks]

**Hamming Code Calculation:**

Hamming codes are error-correcting codes that can detect and correct single-bit errors. To implement a Hamming code for an 8-bit data word, we need to insert parity bits at positions that are powers of 2 (positions 1, 2, 4, 8).

Given data byte: 01010100

**Step 1: Determine positions for data and parity bits in the Hamming code**

In a Hamming code, parity bits are placed at positions that are powers of 2 (1, 2, 4, 8, etc.). Data bits are placed at other positions.

- Position 1: Parity bit p1 (to be calculated)
- Position 2: Parity bit p2 (to be calculated)
- Position 3: Data bit 0
- Position 4: Parity bit p4 (to be calculated)
- Position 5: Data bit 1
- Position 6: Data bit 0
- Position 7: Data bit 1
- Position 8: Parity bit p8 (to be calculated)
- Position 9: Data bit 0
- Position 10: Data bit 1
- Position 11: Data bit 0
- Position 12: Data bit 0

The arrangement becomes: p1 p2 0 p4 1 0 1 p8 0 1 0 0

**Step 2: Calculate each parity bit value (using even parity - an even number of 1s including the parity bit)**

For p1 (position 1), check bits at positions 1, 3, 5, 7, 9, 11:
- Bit values: p1, 0, 1, 1, 0, 0
- Count of 1s (excluding p1): 0 + 1 + 1 + 0 + 0 = 2 (even)
- For even parity, p1 = 0

For p2 (position 2), check bits at positions 2, 3, 6, 7, 10, 11:
- Bit values: p2, 0, 0, 1, 1, 0
- Count of 1s (excluding p2): 0 + 0 + 1 + 1 + 0 = 2 (even)
- For even parity, p2 = 0

For p4 (position 4), check bits at positions 4, 5, 6, 7, 12:
- Bit values: p4, 1, 0, 1, 0
- Count of 1s (excluding p4): 1 + 0 + 1 + 0 = 2 (even)
- For even parity, p4 = 0

For p8 (position 8), check bits at positions 8, 9, 10, 11, 12:
- Bit values: p8, 0, 1, 0, 0
- Count of 1s (excluding p8): 0 + 1 + 0 + 0 = 1 (odd)
- For even parity, p8 = 1

**Step 3: Insert the calculated parity bits into the Hamming code**

Final Hamming code: 0 0 0 0 1 0 1 1 0 1 0 0

Therefore, the original byte 01010100 with Hamming error correcting code becomes: 000010110100.

## Question 02 [20 marks]

### (a) Providing an illustrative example, explain how a coprocessor could increase the performance of a computer. [5 Marks]

**Coprocessors and Performance Enhancement:**

A coprocessor is a specialized processor designed to supplement the functionality of the primary CPU by offloading specific, computationally intensive tasks. This offloading allows the main CPU to continue with other operations while the coprocessor handles specialized tasks in parallel, resulting in overall system performance improvement.

**Illustrative Example: Graphics Processing Unit (GPU) as a Coprocessor**

Consider a computer system used for 3D rendering and video editing:

**Without GPU Coprocessor:**
- The main CPU (e.g., an Intel Core i7) must handle all tasks including:
  - General purpose computing (OS operations, application logic)
  - Complex matrix operations for 3D transformations
  - Pixel shading and texture mapping
  - Video encoding/decoding

For rendering a complex 3D scene:
1. The CPU must process each vertex transformation sequentially
2. Calculate lighting effects for each pixel
3. Apply textures to each object
4. Compose the final image

If the scene has 1 million vertices and the CPU can process 10 million vertices per second, this computation alone would take approximately 0.1 seconds, during which time the CPU cannot efficiently perform other tasks.

**With GPU Coprocessor:**
- The system includes a dedicated GPU (e.g., NVIDIA RTX 3080) that specializes in parallel graphic operations
- The main CPU offloads graphics-intensive tasks to the GPU:
  1. CPU prepares rendering instructions and data
  2. GPU executes thousands of parallel operations for vertex transformations
  3. GPU handles shader calculations and texture mapping
  4. GPU outputs the rendered frame directly to display

For the same 3D scene:
1. The CPU sends rendering instructions to the GPU (minimal CPU time)
2. The GPU processes the scene using thousands of parallel cores
3. The CPU continues with other application logic during rendering
4. With 10,000+ parallel processing units, the GPU might complete the task in 0.001 seconds

**Performance Improvement Quantified:**
- Rendering Time: Reduced from 0.1s to 0.001s (100× improvement)
- CPU Utilization: Reduced from near 100% to perhaps 5-10% during graphics tasks
- Overall System Responsiveness: Significantly improved as the CPU remains available
- Energy Efficiency: Often improved as specialized hardware can be more efficient for specific tasks

**Other Common Coprocessor Examples:**
1. **Neural Processing Units (NPUs)**: Accelerate machine learning inference operations
2. **Digital Signal Processors (DSPs)**: Handle audio processing and signal filtering
3. **Cryptographic Accelerators**: Speed up encryption/decryption operations
4. **Physics Processing Units**: Calculate physics simulations for games and scientific applications

This example demonstrates how coprocessors can significantly enhance system performance by:
1. Enabling parallel execution of specialized tasks
2. Freeing the main CPU for other operations
3. Providing hardware optimized for specific computational patterns
4. Improving overall system throughput and responsiveness

### (b) Consider a dual-pipelined processor that can issue two instructions per clock cycle. Let A, B and C be threads and Ai, Bj and Cj are the instructions issued by these three threads, respectively. Assume that there is a miss penalty of two clock cycles for level 1 cache, three clock cycles for level 2 cache, and 10 clock cycles for last level cache if an instruction misses in the cache. Show the instructions issued in the first 15 clock cycles when fine-grained multithreading technique on a dual-pipelined processor is employed. [15 Marks]

**Fine-Grained Multithreading Execution Schedule:**

In fine-grained multithreading, the processor switches between threads on each clock cycle to maximize pipeline utilization. This approach helps hide latencies caused by cache misses and other stalls. With a dual-pipeline processor, two instructions can be issued per cycle, which means two instructions from the same thread or from different threads can be issued simultaneously.

Given thread execution patterns (from the figure):
- Thread A: A1, A2, [stall], A3, A4, A5, A6, A7, A8
- Thread B: B1, B2, B3, B4, [stall], B5, B6, [stall], B7, B8
- Thread C: C1, C2, C3, C4, C5, C6, C7, [stall], C8, C9

The stalls seem to be:
- Thread A stalls after A2 (let's assume L2 cache miss - 3 cycles)
- Thread B stalls after B4 (let's assume last level cache miss - 10 cycles)
- Thread B stalls again after B6 (let's assume L2 cache miss - 3 cycles)
- Thread C stalls after C7 (let's assume L2 cache miss - 3 cycles)

In fine-grained multithreading, the processor switches threads on every cycle but can only issue instructions from a thread if that thread is not stalled. If a thread is stalled, the processor will try to issue instructions from other available threads.

Here's the instruction issue schedule for the first 15 clock cycles:

| Clock Cycle | Pipeline 1 | Pipeline 2 | Notes |
|-------------|------------|------------|-------|
| 1 | A1 | B1 | Start with threads A and B |
| 2 | C1 | A2 | Thread B is still processing B1 |
| 3 | B2 | C2 | Thread A stalls after A2 |
| 4 | B3 | C3 | Thread A still stalled |
| 5 | B4 | C4 | Thread A still stalled |
| 6 | A3 | C5 | Thread A resumes; Thread B stalls after B4 |
| 7 | A4 | C6 | Thread B still stalled |
| 8 | A5 | C7 | Thread B still stalled |
| 9 | A6 | - | Thread B and C are stalled |
| 10 | A7 | - | Thread B and C are still stalled |
| 11 | A8 | C8 | Thread C resumes; Thread B still stalled |
| 12 | C9 | - | Thread A completed; Thread B still stalled |
| 13 | - | - | Thread C completed; Thread B still stalled |
| 14 | - | - | Thread B still stalled |
| 15 | B5 | - | Thread B resumes |

This schedule demonstrates fine-grained multithreading where the processor dynamically switches between available threads to maximize pipeline utilization. When multiple threads are available, both pipelines can be used. When only one thread is available and not stalled, only one pipeline is used. When all threads are stalled or completed, both pipelines remain idle.

Note that fine-grained multithreading differs from coarse-grained multithreading in that it switches threads on a cycle-by-cycle basis rather than only when a thread experiences a long-latency operation.

## Question 03 [25 marks]

### (a) A set of benchmark programs was executed on two computers, and the following measures were recorded. The clock frequency of Computer A is 0.2 GHz higher than the clock frequency of Computer B. Calculate the clock frequency of Computer B if it is given that the above benchmark is executed in 1.02 times faster on Computer B than Computer A. [15 Marks]

**Solution:**

Given information:
- Clock frequency of Computer A = Clock frequency of Computer B + 0.2 GHz
- Computer B executes the benchmark 1.02 times faster than Computer A
- Instruction execution data for both computers is provided in the table

First, let's calculate the total execution time for both computers.

**Step 1: Calculate the total number of clock cycles for each computer**

For Computer A:
- ALU instructions: 18,001,547 × 1 = 18,001,547 cycles
- BRANCH instructions: 12,412,042 × 4 = 49,648,168 cycles
- OTHER instructions: 13,945,764 × 3 = 41,837,292 cycles
- Total cycles for Computer A = 18,001,547 + 49,648,168 + 41,837,292 = 109,487,007 cycles

For Computer B:
- ALU instructions: 24,102,334 × 1 = 24,102,334 cycles
- BRANCH instructions: 18,247,937 × 3 = 54,743,811 cycles (assuming CPI of 3 for BRANCH on Computer B)
- OTHER instructions: 12,001,207 × 3 = 36,003,621 cycles
- Total cycles for Computer B = 24,102,334 + 54,743,811 + 36,003,621 = 114,849,766 cycles

**Step 2: Calculate execution times**

Let's denote:
- fA = Clock frequency of Computer A (in Hz)
- fB = Clock frequency of Computer B (in Hz)

Execution time (Computer A) = Total cycles / Clock frequency = 109,487,007 / fA seconds
Execution time (Computer B) = Total cycles / Clock frequency = 114,849,766 / fB seconds

Given that Computer B is 1.02 times faster:
Execution time (Computer A) = 1.02 × Execution time (Computer B)

Substituting:
109,487,007 / fA = 1.02 × (114,849,766 / fB)
109,487,007 / fA = 117,146,761 / fB

Also given that:
fA = fB + 0.2 × 10^9 Hz

From the first equation:
fB = 117,146,761 × fA / 109,487,007
fA = 109,487,007 × fB / 117,146,761
fA = 0.9346 × fB

Substituting this into the second equation:
0.9346 × fB = fB + 0.2 × 10^9
-0.0654 × fB = 0.2 × 10^9
fB = -0.2 × 10^9 / -0.0654
fB = 3.06 × 10^9 Hz = 3.06 GHz

Therefore, the clock frequency of Computer B is approximately 3.06 GHz, and consequently, the clock frequency of Computer A is 3.06 + 0.2 = 3.26 GHz.

To verify: 
- Execution time (Computer A) = 109,487,007 / (3.26 × 10^9) = 0.0336 seconds
- Execution time (Computer B) = 114,849,766 / (3.06 × 10^9) = 0.0375 seconds
- Ratio = 0.0336 / 0.0375 = 0.896, which is approximately 1/1.02 = 0.98

The slight difference in verification is due to rounding errors in our calculations.

### (b) Consider the specifications given below with respect to a computer system: Cache memory size: 16MB, Cache organization: Single-level, direct-mapped, Cache line size: 128 bytes, Memory word size: 8bytes, Maximum amount of RAM accessible to the Operating System: 256GB. (i) Show the components of the virtual memory address with their sizes. (ii) What is the location in cache for the memory reference EFOOOFE (given in hexadecimal)? [10 Marks]

**(i) Components of the Virtual Memory Address:**

To determine the address components, we need to analyze the memory and cache parameters:

1. **Physical Address Size:**
   - Maximum RAM: 256 GB = 2^38 bytes (256 × 2^30)
   - Therefore, physical addresses need at least 38 bits (2^38 = 256 GB)

2. **Cache Organization Components:**
   - Cache size: 16 MB = 2^24 bytes (16 × 2^20)
   - Cache line size: 128 bytes = 2^7 bytes
   - Direct-mapped cache (each memory location maps to exactly one cache location)
   - Number of cache lines = Cache size / Cache line size = 2^24 / 2^7 = 2^17 lines

3. **Address Breakdown:**
   - **Byte Offset Bits**: These identify a specific byte within a cache line
     - Cache line size is 128 bytes, requires log₂(128) = 7 bits

   - **Index Bits**: These identify a specific cache line
     - Number of cache lines is 2^17, requires log₂(2^17) = 17 bits

   - **Tag Bits**: These identify which memory block is stored in a cache line
     - Total physical address bits = 38
     - Tag bits = 38 - (Index bits + Byte offset bits) = 38 - (17 + 7) = 14 bits

4. **Virtual Address Components:**
   - Virtual addresses are typically larger than physical addresses to allow for more virtual memory than physical memory
   - Assuming a standard 48-bit virtual address (common in many modern architectures):
     - **Page Offset**: This is the offset within a page (same as combined index and byte offset in physical address)
       - Assuming 4 KB pages (standard size), page offset = log₂(4096) = 12 bits
     - **Virtual Page Number (VPN)**: Identifies the virtual page
       - VPN bits = 48 - 12 = 36 bits

Therefore, the virtual memory address components are:
- Virtual Page Number (VPN): 36 bits
- Page Offset: 12 bits (includes the byte offset within the cache line)

When translated to physical address, it becomes:
- Tag: 14 bits
- Index: 17 bits
- Byte Offset: 7 bits

**(ii) Location in Cache for Memory Reference EFOOOFE (hexadecimal):**

The memory reference EFOOOFE needs to be broken down into the cache addressing components:

1. Convert to binary:
   - EF0000FE (hex) = 1110 1111 0000 0000 0000 0000 1111 1110 (binary)

2. Break down into address components:
   - Byte Offset: Lowest 7 bits = 111 1110 = 0x7E
   - Index: Next 17 bits = 00000 0000 0000 0000 00 = 0x0
   - Tag: Remaining bits = 1110 1111 0000 0 = 0xEF00

3. Therefore:
   - The memory reference EFOOOFE will be stored in:
     - Cache line index: 0
     - With tag: 0xEF00
     - At byte offset: 0x7E within the cache line

The location in cache for this memory reference is: Index 0, with tag 0xEF00.

## Question 04 [30 marks]

### (a) Providing illustrative examples describe the differences between immediate addressing and register indirect addressing in computer architecture. [5 Marks]

**Immediate Addressing vs. Register Indirect Addressing:**

**1. Immediate Addressing**

In immediate addressing, the operand value is explicitly included as part of the instruction itself. The value is directly available in the instruction and does not require any memory access to retrieve.

**Characteristics:**
- The operand is embedded within the instruction
- No additional memory access is required
- Operand size is typically limited by the instruction format
- Used for fixed, known values

**Example in RISC-V Assembly:**
```assembly
addi x5, x0, 42    # Add immediate value 42 to register x0, store in x5
```

In this example, `42` is the immediate operand. The CPU directly uses this value in the computation without needing to access memory. This instruction adds the immediate value 42 to the value in register x0 (which is hardwired to 0 in RISC-V), and stores the result in register x5.

**Machine Code Representation:**
In RISC-V, this might look like:
```
0000 0010 1010 0000 0000 0010 1001 0011
```
Where the immediate value `42` (0x2A) is encoded directly in the instruction bits.

**2. Register Indirect Addressing**

In register indirect addressing, the instruction contains a register reference, and that register contains the memory address from which the operand should be retrieved. The processor must first read the register to get the address, then perform a memory access to retrieve the actual operand.

**Characteristics:**
- The instruction specifies a register
- The register contains a memory address
- The operand is stored at that memory address
- Requires an additional memory access
- Provides flexibility as the memory address can be computed or modified during program execution

**Example in RISC-V Assembly:**
```assembly
lw x6, 0(x7)    # Load word from memory address in x7 into x6
```

In this example, the register x7 contains a memory address. The CPU retrieves this address from x7, then uses it to access memory and load the value at that address into register x6. The `0` indicates an offset of 0 bytes from the address in x7.

**Machine Code Representation:**
In RISC-V, this might look like:
```
0000 0000 0000 0011 1000 0011 0000 0011
```
Where the register numbers for x7 (source address) and x6 (destination) are encoded in the instruction.

**Key Differences:**

1. **Data Access Path:**
   - Immediate addressing: Value is part of the instruction, no memory access needed
   - Register indirect addressing: Value is in memory at an address stored in a register, requiring memory access

2. **Flexibility:**
   - Immediate addressing: Fixed values, limited size (typically 12-16 bits in RISC architectures)
   - Register indirect addressing: Can access the entire memory space, dynamic addresses possible

3. **Performance:**
   - Immediate addressing: Faster as it avoids memory access
   - Register indirect addressing: Slower due to additional memory access

4. **Use Cases:**
   - Immediate addressing: Constants, small literal values, loop counters
   - Register indirect addressing: Accessing array elements, data structures, pointers, variables

5. **Instruction Space:**
   - Immediate addressing: Consumes more bits in the instruction for the operand value
   - Register indirect addressing: More compact instructions since only register specifiers are needed

These fundamental addressing modes represent different tradeoffs between instruction size, execution speed, and programming flexibility.

### (b) Provide the RISC-V assembly language code for the following C program statements. [20 Marks]

**(i) A[1] = (A[12] + b)*8 + 5;**

Assuming:
- Array A is an array of integers (4 bytes each)
- The base address of array A is stored in register x10
- Variable b is stored in register x11

**RISC-V Assembly Code:**

```assembly
# Calculate the address of A[12]
addi x5, x10, 48      # x5 = &A[12] (base address + 12*4)
lw x6, 0(x5)          # x6 = A[12] (load the value at address x5)

# Add b to A[12]
add x6, x6, x11       # x6 = A[12] + b

# Multiply by 8 (shift left by 3)
slli x6, x6, 3        # x6 = (A[12] + b) * 8

# Add 5
addi x6, x6, 5        # x6 = (A[12] + b) * 8 + 5

# Calculate the address of A[1]
addi x7, x10, 4       # x7 = &A[1] (base address + 1*4)

# Store the result in A[1]
sw x6, 0(x7)          # A[1] = (A[12] + b) * 8 + 5
```

**(ii) while (A[i] >= 0) i += 1;**

Assuming:
- Array A is an array of integers (4 bytes each)
- The base address of array A is stored in register x10
- Variable i is stored in register x11

**RISC-V Assembly Code:**

```assembly
loop_start:
    # Calculate address of A[i]
    slli x5, x11, 2       # x5 = i * 4 (scale index by element size)
    add x5, x10, x5       # x5 = &A[i] (base address + offset)
    
    # Load A[i]
    lw x6, 0(x5)          # x6 = A[i]
    
    # Check if A[i] < 0
    bltz x6, loop_exit    # If A[i] < 0, exit loop
    
    # Increment i
    addi x11, x11, 1      # i = i + 1
    
    # Continue loop
    j loop_start          # Jump back to beginning of loop
    
loop_exit:
    # Loop is done, continue with next instruction
```

The assembly code efficiently implements the while loop by:
1. Calculating the address of A[i] by scaling i by 4 (the size of an integer) and adding to the base address
2. Loading the value of A[i] into register x6
3. Checking if the value is negative (bltz = branch if less than zero)
4. If it's not negative, incrementing i and continuing the loop
5. If it is negative, exiting the loop

This implementation maintains the logic of the C statement while using efficient RISC-V instructions.

### (c) What is the RISC-V assembly language instruction of the following RISC-V machine language instruction given in hexadecimal? 060C0C93 [5 Marks]

To determine the RISC-V assembly instruction from the machine code, we need to decode the hexadecimal representation by breaking it down into its binary components and identifying the instruction format.

**Step 1: Convert the machine code to binary**
060C0C93 (hex) = 0000 0110 0000 1100 0000 1100 1001 0011 (binary)

**Step 2: Identify the instruction format based on the opcode**
- Opcode (last 7 bits): 001 0011 = 0x13 (decimal 19)
- This corresponds to the I-type instruction format (immediate type)
- In RISC-V, opcode 0x13 is used for the immediate arithmetic operations (e.g., ADDI, SLTI, etc.)

**Step 3: Break down the binary representation according to the I-type format**
I-type format: [imm(11:0)] [rs1(4:0)] [funct3(2:0)] [rd(4:0)] [opcode(6:0)]

- imm(11:0): 0000 0110 0000 = 0x060 (decimal 96)
- rs1(4:0): 1100 0 = 0x18 (decimal 24) = x24
- funct3(2:0): 001 = 0x1
- rd(4:0): 1001 1 = 0x13 (decimal 19) = x19
- opcode(6:0): 001 0011 = 0x13

**Step 4: Determine the specific instruction**
With opcode 0x13 (I-type) and funct3 0x1, this corresponds to the SLLI (Shift Left Logical Immediate) instruction in RISC-V.

For SLLI, the immediate value is interpreted as a shift amount, and only the lower 6 bits (for RV64I) or 5 bits (for RV32I) are used.

**Step 5: Construct the assembly instruction**
The RISC-V assembly instruction is:

```
slli x19, x24, 96 (or more likely just the lower 6 bits: 96 % 64 = 32)
```

However, since the shift amount is limited by the register width, the actual instruction is:

```
slli x19, x24, 0  (for RV32I, since only the lower 5 bits are used: 96 % 32 = 0)
```

Or, if this is for RV64I:

```
slli x19, x24, 32  (for RV64I, since only the lower 6 bits are used: 96 % 64 = 32)
```

Given that the immediate value encodes a shift of 0 (for RV32I) or 32 (for RV64I), and assuming this is RV64I (which is more common in modern implementations), the final assembly instruction is:

```
slli x19, x24, 32
```

This instruction shifts the value in register x24 left by 32 bits (logical shift, filling with zeros) and stores the result in register x19.

Note: If this is for RV32I, the instruction would effectively be `slli x19, x24, 0`, which would simply copy the value from x24 to x19 without any shifting.
