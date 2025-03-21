# Computer System Architecture - 2023 Model Paper Answers

## Question 01 [25 marks]

### (a) Explain the difference between static RAM (SRAM) and dynamic RAM (DRAM) with respect to computer memories. Describe where these types of memories are used in a computer system. [10 Marks]

#### Differences between SRAM and DRAM:

| Characteristic | Static RAM (SRAM) | Dynamic RAM (DRAM) |
|----------------|-------------------|-------------------|
| **Storage Element** | Uses flip-flops (typically 6 transistors per bit) | Uses capacitors with access transistors (typically 1 transistor and 1 capacitor per bit) |
| **Data Persistence** | Retains data as long as power is supplied | Requires periodic refreshing (typically every few milliseconds) as capacitors leak charge |
| **Speed** | Faster (access times of 0.5 to 5ns) | Slower (access times of 50 to 70ns) |
| **Density** | Lower density (larger cell size) | Higher density (smaller cell size) |
| **Power Consumption** | Higher static power consumption | Lower static power consumption but requires refresh cycles |
| **Cost** | More expensive per bit | Less expensive per bit |
| **Complexity** | More complex cell structure | Simpler cell structure |

#### Usage in Computer Systems:

**SRAM Usage:**
1. **CPU Cache Memory (L1, L2, L3)**: SRAM is used for cache memory due to its high speed, which matches the processor's performance requirements. 
   - L1 cache requires the fastest access times and is almost always SRAM
   - L2 and L3 caches also use SRAM to bridge the speed gap between the processor and main memory

2. **CPU Registers**: Registers within the CPU are implemented using SRAM technology

3. **Buffer Memory**: Used in routers, switches, and other networking equipment where speed is critical

4. **Small Embedded Systems**: SRAM may be used as main memory in small embedded systems where the memory requirements are modest

**DRAM Usage:**
1. **Main Memory (RAM)**: DRAM is used for the main memory of most computer systems due to its high density and lower cost per bit
   - Most modern computers use variations like DDR4 or DDR5 SDRAM for main memory

2. **Graphics Memory**: Video RAM in graphics cards is typically implemented using specialized DRAM (GDDR)

3. **Storage Device Buffers**: Some storage devices use DRAM as a buffer or cache

4. **Shared Memory in SoCs**: System-on-Chip designs often incorporate DRAM for larger memory requirements

The memory hierarchy in modern computers is designed to balance cost and performance, with faster but more expensive SRAM close to the processor and slower but cheaper DRAM used for main memory. This hierarchy reflects the principles of spatial and temporal locality, allowing frequently accessed data to reside in faster memory.

### (b) What is the purpose of internal data bus in a processor? Consider a processor core with 64-bit wide data I/O bus running at the speed of 2133MHz. How much information can be transferred into the processor per second? [8 Marks]

#### Purpose of Internal Data Bus in a Processor:

An internal data bus in a processor serves several critical purposes:

1. **Data Transfer**: The primary purpose is to transfer data between different components within the processor, such as:
   - Between registers and ALU (Arithmetic Logic Unit)
   - Between the cache and execution units
   - Between different functional units in superscalar processors

2. **Bandwidth Provision**: Provides sufficient bandwidth for data movement to prevent bottlenecks in instruction execution

3. **Parallel Data Access**: Enables simultaneous access to multiple data items, enhancing performance in parallel processing architectures

4. **Instruction and Data Flow**: Facilitates the flow of both instructions and data through the processor pipeline

5. **Coordination**: Helps coordinate the activities of various processor components by providing a standardized interface

#### Calculation of Data Transfer Rate:

For a processor with a 64-bit wide data I/O bus running at 2133MHz:

- Bus width = 64 bits = 8 bytes
- Clock frequency = 2133 MHz = 2.133 × 10^9 Hz (cycles per second)

The maximum theoretical data transfer rate is:

Data transfer rate = Bus width × Clock frequency
Data transfer rate = 8 bytes × 2.133 × 10^9 cycles/second
Data transfer rate = 17.064 × 10^9 bytes/second
Data transfer rate = 17.064 GB/s (gigabytes per second)

Therefore, the processor can theoretically transfer up to 17.064 gigabytes of information per second through its data I/O bus. This represents the peak theoretical bandwidth, assuming ideal conditions with no overhead or wait states. In practice, actual throughput may be lower due to various factors such as bus arbitration, memory latency, and protocol overhead.

### (c) Consider the byte 01110100. In order to calculate the Hamming error correcting code, insert the four parity bit positions to this byte, and obtain their parity values. [9 Marks]

#### Hamming Code Calculation:

Hamming code uses additional parity bits to provide error detection and correction capabilities. For a byte (8 data bits), we need to add parity bits at positions that are powers of 2 (positions 1, 2, 4, 8).

Given data byte: 01110100

Step 1: Determine positions for data and parity bits in the Hamming code:
- Position 1: Parity bit p1 (to be calculated)
- Position 2: Parity bit p2 (to be calculated)
- Position 3: Data bit 0
- Position 4: Parity bit p4 (to be calculated)
- Position 5: Data bit 1
- Position 6: Data bit 1
- Position 7: Data bit 1
- Position 8: Parity bit p8 (to be calculated)
- Position 9: Data bit 0
- Position 10: Data bit 1
- Position 11: Data bit 0
- Position 12: Data bit 0

The arrangement becomes: p1 p2 0 p4 1 1 1 p8 0 1 0 0

Step 2: Calculate each parity bit value (using even parity - an even number of 1s including the parity bit):

For p1 (position 1), check bits at positions 1, 3, 5, 7, 9, 11:
- Bit values: p1, 0, 1, 1, 0, 0
- Count of 1s (excluding p1): 0 + 1 + 1 + 0 + 0 = 2 (even)
- For even parity, p1 = 0

For p2 (position 2), check bits at positions 2, 3, 6, 7, 10, 11:
- Bit values: p2, 0, 1, 1, 1, 0
- Count of 1s (excluding p2): 0 + 1 + 1 + 1 + 0 = 3 (odd)
- For even parity, p2 = 1

For p4 (position 4), check bits at positions 4, 5, 6, 7, 12:
- Bit values: p4, 1, 1, 1, 0
- Count of 1s (excluding p4): 1 + 1 + 1 + 0 = 3 (odd)
- For even parity, p4 = 1

For p8 (position 8), check bits at positions 8, 9, 10, 11, 12:
- Bit values: p8, 0, 1, 0, 0
- Count of 1s (excluding p8): 0 + 1 + 0 + 0 = 1 (odd)
- For even parity, p8 = 1

Step 3: Insert the calculated parity bits into the Hamming code:

Final Hamming code: 0 1 0 1 1 1 1 1 0 1 0 0

Therefore, the original byte 01110100 with Hamming error correcting code becomes: 010111110100.

## Question 02 [20 marks]

Consider a dual-pipelined processor that can issue two instructions per clock cycle. Let A, B, and C be threads and Ai, Bj, and Ck are the instructions issued by these three threads, respectively. Assume that there is a miss penalty of two clock cycles for level 1 cache, three clock cycles for level 2 cache, and 10 clock cycles for last level cache if an instruction misses in the cache. The diagram shows the instructions issued by these threads. Blank squares mean CPU stalls due to cache misses.

Show the instructions issued in the first 15 clock cycles when coarse-grained multithreading technique on a dual-pipelined processor is employed, assuming level 2 and last level cache misses as expensive stalls. [20 Marks]

### Solution:

In coarse-grained multithreading, the processor executes instructions from one thread until it experiences a significant delay (such as a last-level cache miss), then switches to another thread. The processor will continue executing the new thread until it also encounters a significant delay.

Given information:
- Dual-pipelined processor: Can issue 2 instructions per cycle
- Miss penalties: L1 cache (2 cycles), L2 cache (3 cycles), Last level cache (10 cycles)
- Expensive stalls: L2 and last level cache misses

Thread execution patterns (from the figure):
- Thread A: A1, A2, [stall], A3, A4, A5, A6, A7, A8
- Thread B: B1, B2, B3, B4, [stall], B5, B6, [stall], B7, B8
- Thread C: C1, C2, C3, C4, C5, C6, C7, [stall], C8, C9

Determining the stall types:
- Thread A has a stall after A2: Let's assume this is an L2 cache miss (3 cycles)
- Thread B has a stall after B4: Let's assume this is an LL cache miss (10 cycles)
- Thread B has another stall after B6: Let's assume this is an L2 cache miss (3 cycles)
- Thread C has a stall after C7: Let's assume this is an L2 cache miss (3 cycles)

Execution schedule with coarse-grained multithreading:

| Clock Cycle | Pipeline 1 | Pipeline 2 | Notes |
|-------------|------------|------------|-------|
| 1 | A1 | A2 | Start with thread A |
| 2 | - | - | A stalls due to L2 cache miss |
| 3 | - | - | A still stalled |
| 4 | - | - | A stalled, switch to thread B after this cycle |
| 5 | B1 | B2 | Thread B starts |
| 6 | B3 | B4 | Continue thread B |
| 7 | - | - | B stalls due to LL cache miss |
| 8 | - | - | B still stalled |
| 9 | - | - | B still stalled |
| 10 | - | - | B still stalled (switch to C after this) |
| 11 | C1 | C2 | Thread C starts |
| 12 | C3 | C4 | Continue thread C |
| 13 | C5 | C6 | Continue thread C |
| 14 | C7 | - | Thread C (partial issue) |
| 15 | - | - | C stalls due to L2 cache miss |

This represents the instruction issue schedule for the first 15 clock cycles using coarse-grained multithreading on a dual-pipelined processor. Thread switches occur after thread A's L2 cache miss (cycle 4) and thread B's LL cache miss (cycle 10). The processor stalls when a thread encounters a significant memory delay, and switches to another thread after several stall cycles.

Note: In coarse-grained multithreading, thread switches typically happen only after longer latency operations, which is why we switch to other threads after L2 and LL cache misses but not after L1 cache misses (which would be considered short-latency operations).

## Question 03 [25 marks]

### (a) Consider a processor with a split cache. Miss rates are 3% and 5% respectively for instruction and data caches. Miss penalty is 100 cycles for all misses. 40% of instructions are data accesses. The processor has a CPI (cycles per instructions) of 2.0 without considering memory stalls cycles. Compare the performance of this processor with a hypothetical processor that always hits in the cache. [15 Marks]

#### Solution:

To compare the performance of the processor with cache misses to a processor that always hits in the cache, we need to calculate the impact of memory stalls on the effective CPI.

Given information:
- Base CPI (without memory stalls): 2.0 cycles per instruction
- Instruction cache miss rate: 3%
- Data cache miss rate: 5%
- Miss penalty: 100 cycles (for both instruction and data cache misses)
- Percentage of instructions that access data: 40%

Step 1: Calculate memory stall cycles per instruction.

For instruction cache:
Instruction cache stall cycles per instruction = Instruction miss rate × Miss penalty
Instruction cache stall cycles per instruction = 0.03 × 100 = 3 cycles

For data cache:
Data accesses per instruction = 0.4 (40% of instructions access data)
Data cache stall cycles per instruction = Data accesses per instruction × Data miss rate × Miss penalty
Data cache stall cycles per instruction = 0.4 × 0.05 × 100 = 2 cycles

Total memory stall cycles per instruction = Instruction cache stall cycles + Data cache stall cycles
Total memory stall cycles per instruction = 3 + 2 = 5 cycles

Step 2: Calculate the effective CPI (including memory stalls).

Effective CPI = Base CPI + Memory stall cycles per instruction
Effective CPI = 2.0 + 5 = 7.0 cycles

Step 3: Compare the performance with the hypothetical processor (always cache hits).

The hypothetical processor would have a CPI of 2.0 (the base CPI without memory stalls).

Performance ratio = CPI (hypothetical) / CPI (actual)
Performance ratio = 2.0 / 7.0 = 0.2857 ≈ 0.29

Alternatively, we can express this as a speedup:
Speedup = CPI (actual) / CPI (hypothetical)
Speedup = 7.0 / 2.0 = 3.5

This means that the hypothetical processor with perfect cache (always hits) would be approximately 3.5 times faster than the actual processor with cache misses. Alternatively, we can say that the processor with cache misses performs at about 29% of the speed of the hypothetical processor.

### (b) The advertised average seek time of a hard disk is 5ms, and the disk rotates at 7200 revolutions per minute. The disk can transfer data at the rate of 150MB/s. The controller overhead is 0.1ms. Assuming there is no queueing delay, calculate the average time to read a 4KB-sized block. [10 Marks]

#### Solution:

To calculate the average time to read a 4KB block from a hard disk, we need to break down the process into its components and sum the times:

Given information:
- Average seek time = 5 ms
- Disk rotation speed = 7200 RPM
- Data transfer rate = 150 MB/s
- Controller overhead = 0.1 ms
- Block size = 4 KB

Step 1: Calculate the average rotational delay (the time needed to reach the desired sector once the head is positioned).

Average rotational delay = Half the time for a full rotation
Time for a full rotation = 60 seconds / (7200 RPM) = 60 / 7200 = 0.00833 seconds = 8.33 ms
Average rotational delay = 8.33 ms / 2 = 4.17 ms

Step 2: Calculate the transfer time (the time to read the data once the head is at the right position).

Transfer time = Data size / Transfer rate
Transfer time = 4 KB / 150 MB/s = 4 × 10^3 bytes / (150 × 10^6 bytes/s) = 0.0267 ms

Step 3: Sum all components to find the total average access time.

Average access time = Seek time + Rotational delay + Transfer time + Controller overhead
Average access time = 5 ms + 4.17 ms + 0.0267 ms + 0.1 ms = 9.30 ms

Therefore, the average time to read a 4KB-sized block from the hard disk is approximately 9.30 milliseconds.

This breakdown shows that the mechanical components (seek time and rotational delay) dominate the access time, while the actual data transfer and controller overhead are much smaller contributors. This is characteristic of traditional hard disk drives and explains why solid-state drives (which eliminate these mechanical delays) provide such a significant performance improvement for random access patterns.

## Question 04 [30 marks]

### (a) Consider a single-cycle RISC-V processor with the following attributes:
- The processor runs at 1GHz clock
- All memory accesses take 1 cycle
- 25% of instructions are memory accesses
- The CPI of the processor is 1.0

To improve the processor's performance, we're analyzing the impact of pipelining. Calculate the speedup gained by converting the processor to a 5-stage pipeline with the following specifications:
- The stages are IF (Instruction Fetch), ID (Instruction Decode), EX (Execute), MEM (Memory access), and WB (Write Back)
- Each stage takes 0.2ns
- There is a 0.05ns overhead between stages (pipeline registers)
- The pipeline introduces 15% of stall cycles due to data and control hazards

[20 marks]

#### Solution:

To determine the speedup from pipelining, we need to compare the performance of the single-cycle and pipelined processors.

Step 1: Calculate the execution time of the single-cycle processor.

Given information for single-cycle processor:
- Clock frequency = 1 GHz
- Clock cycle time = 1 / (1 × 10^9) = 1 ns
- CPI = 1.0 (as specified)

For a program with N instructions:
Execution time (single-cycle) = N instructions × CPI × Clock cycle time
Execution time (single-cycle) = N × 1.0 × 1 ns = N ns

Step 2: Calculate the execution time of the pipelined processor.

For the pipelined processor:
- Each stage takes 0.2 ns
- Overhead between stages is 0.05 ns
- Total time per stage = 0.2 ns + 0.05 ns = 0.25 ns
- Clock cycle time = 0.25 ns
- Frequency = 1 / 0.25 ns = 4 GHz
- Stall percentage due to hazards = 15%

Ideally, the pipelined processor would execute N instructions in (N + 4) cycles (N cycles for N instructions, plus 4 additional cycles to fill and drain the pipeline).

However, due to stalls:
Actual cycles = Ideal cycles × (1 + Stall percentage)
Actual cycles = (N + 4) × 1.15

Execution time (pipelined) = Actual cycles × Clock cycle time
Execution time (pipelined) = (N + 4) × 1.15 × 0.25 ns
Execution time (pipelined) = 0.2875N + 1.15 ns

Step 3: Calculate the speedup.

Speedup = Execution time (single-cycle) / Execution time (pipelined)
Speedup = N ns / (0.2875N + 1.15 ns)

For large values of N (which is realistic for real programs), the "+1.15" term becomes negligible:
Speedup ≈ N / 0.2875N ≈ 1 / 0.2875 ≈ 3.48

Therefore, the speedup gained by converting the single-cycle processor to a 5-stage pipeline is approximately 3.48×. This means the pipelined processor would execute programs about 3.48 times faster than the single-cycle processor, despite the overhead from pipeline registers and stalls due to hazards.

### (b) Assume an average network latency of 20ms. What is the maximum achievable throughput (in bytes per second) for a network link with a maximum transfer unit (MTU) of 1500 bytes, using a stop-and-wait protocol? [10 marks]

#### Solution:

In a stop-and-wait protocol, the sender transmits a packet and then waits for an acknowledgment before sending the next packet. The maximum achievable throughput is limited by this waiting time.

Given information:
- Network latency = 20 ms (round-trip time)
- Maximum Transfer Unit (MTU) = 1500 bytes

Step 1: Calculate the time required for one complete transaction.

In a stop-and-wait protocol, a complete transaction includes:
- Sending the data packet
- Waiting for the acknowledgment to return

Given the network latency of 20 ms (round-trip time), the total time for one complete transaction is approximately 20 ms. This assumes that the transmission time of the packet and acknowledgment is negligible compared to the network latency, which is reasonable for most networks where propagation delay dominates.

Step 2: Calculate the throughput.

Throughput = Data transferred / Time taken
Throughput = MTU / Transaction time
Throughput = 1500 bytes / 0.02 seconds
Throughput = 75,000 bytes per second
Throughput = 75 KB/s

Therefore, the maximum achievable throughput using a stop-and-wait protocol with the given parameters is 75 KB/s (kilobytes per second).

Note that this is significantly lower than the capacity of most modern networks because the stop-and-wait protocol is inefficient due to the idle waiting time. More sophisticated protocols like sliding window protocols allow multiple packets to be "in flight" simultaneously, leading to much higher throughput, especially over high-latency connections. 