# Memory Systems

**Course:** Computer System Architecture  
**Instructor:** Prof. Dr. Computer Architecture

## Navigation

[Table of Contents](../README.md) | 
[Computer Architecture Fundamentals](computer_architecture_fundamentals.md) | 
[Processor Architecture](processor_architecture.md) | 
**Memory Systems** | 
[Input/Output Systems](io_systems.md) | 
[Parallel Processing](parallel_processing.md) | 
[Advanced Architectures](advanced_architectures.md)

---

## Memory Hierarchy

The memory hierarchy is a structured organization of different memory types in a computer system, arranged based on access speed, capacity, and cost.

### Principles of Memory Hierarchy

1. **Locality of Reference**
   - **Temporal Locality**: Recently accessed items are likely to be accessed again
   - **Spatial Locality**: Items near recently accessed items are likely to be accessed

2. **Memory Hierarchy Levels**
   - Registers (fastest, smallest, most expensive)
   - Cache (L1, L2, L3)
   - Main Memory (RAM)
   - Secondary Storage (SSD, HDD)
   - Tertiary Storage (tape, optical media)

3. **Performance Metrics**
   - Access Time: Time between request and completion
   - Cycle Time: Minimum time between successive requests
   - Transfer Rate: Rate at which data can be transferred
   - Hit Ratio: Percentage of memory accesses found in a given level

### Memory Hierarchy Performance

The average memory access time (AMAT) can be calculated as:

$$\text{AMAT} = \text{Hit Time} + \text{Miss Rate} \times \text{Miss Penalty}$$

**Formula Explanation:**
- **AMAT**: Average time to access memory across all memory requests
- **Hit Time**: Time to access data if found in the current level of memory
- **Miss Rate**: Fraction of accesses not found in the current level (1 - Hit Rate)
- **Miss Penalty**: Additional time required to retrieve data from the next level

For a multi-level memory hierarchy, the formula extends to:

$$\text{AMAT} = \text{Hit Time}_{L1} + \text{Miss Rate}_{L1} \times (\text{Hit Time}_{L2} + \text{Miss Rate}_{L2} \times \text{Miss Penalty}_{L2})$$

This formula shows that improving any of these factors (reducing hit time, miss rate, or miss penalty) will improve overall memory performance.

## Cache Memory

Cache memory is a small, fast memory that stores copies of data from frequently used main memory locations to reduce average memory access time.

### Cache Organization

1. **Direct-Mapped Cache**
   - Each memory location maps to exactly one cache location
   - Simple but can lead to conflicts
   - Memory Address is divided into:
     - Tag: Identifies the memory block
     - Index: Determines the cache line
     - Offset: Identifies the byte within the block

2. **Fully Associative Cache**
   - A memory block can be placed in any cache line
   - Requires searching all cache entries
   - Memory Address is divided into:
     - Tag: Identifies the memory block
     - Offset: Identifies the byte within the block

3. **Set-Associative Cache**
   - A compromise between direct-mapped and fully associative
   - Each memory location can be placed in a limited set of cache lines
   - Memory Address is divided into:
     - Tag: Identifies the memory block
     - Set Index: Determines the set of cache lines
     - Offset: Identifies the byte within the block

### Cache Mapping Techniques

#### Direct-Mapped Cache

In a direct-mapped cache, the cache line is determined by:

$$\text{Cache Line} = \text{Memory Address} \bmod \text{Number of Cache Lines}$$

**Formula Explanation:**
- **Cache Line**: The location in cache where the data will be stored
- **Memory Address**: The address in main memory
- **Number of Cache Lines**: Total number of lines in the cache
- This simple mapping means that memory addresses that differ by a multiple of the cache size will map to the same cache line, potentially causing conflicts

#### Set-Associative Cache

In an n-way set-associative cache, the set is determined by:

$$\text{Set Number} = \text{Memory Address} \bmod \text{Number of Sets}$$

**Formula Explanation:**
- **Set Number**: The set in cache where the data can be stored
- **Memory Address**: The address in main memory
- **Number of Sets**: Total number of sets in the cache (cache size / (block size × associativity))
- Within each set, the block can be placed in any of the n ways, reducing conflicts compared to direct-mapped cache

### Cache Performance Metrics

1. **Hit Rate**

$$\text{Hit Rate} = \frac{\text{Number of Cache Hits}}{\text{Total Number of Memory Accesses}}$$

**Formula Explanation:**
- **Hit Rate**: Fraction of memory accesses found in the cache
- **Number of Cache Hits**: Memory accesses that found data in cache
- **Total Number of Memory Accesses**: All memory access attempts
- Higher hit rates indicate better cache performance

2. **Miss Rate**

$$\text{Miss Rate} = 1 - \text{Hit Rate} = \frac{\text{Number of Cache Misses}}{\text{Total Number of Memory Accesses}}$$

**Formula Explanation:**
- **Miss Rate**: Fraction of memory accesses not found in the cache
- **Number of Cache Misses**: Memory accesses that did not find data in cache
- **Total Number of Memory Accesses**: All memory access attempts
- Lower miss rates indicate better cache performance

3. **Average Memory Access Time (AMAT)**

$$\text{AMAT} = \text{Hit Time} + \text{Miss Rate} \times \text{Miss Penalty}$$

**Formula Explanation:**
- **AMAT**: Average time to access memory
- **Hit Time**: Time to access data if found in cache
- **Miss Rate**: Fraction of accesses not found in cache
- **Miss Penalty**: Time to fetch data from main memory
- This formula quantifies the performance impact of cache misses

### Replacement Policies

When a cache is full and a new block needs to be loaded, a replacement policy determines which existing block to evict.

1. **Least Recently Used (LRU)**
   - Replaces the block that has not been accessed for the longest time
   - Requires tracking access history
   - Performs well due to temporal locality

2. **First-In-First-Out (FIFO)**
   - Replaces the block that has been in the cache the longest
   - Simpler to implement than LRU
   - May not perform as well as LRU

3. **Least Frequently Used (LFU)**
   - Replaces the block that has been accessed the least number of times
   - Requires counting accesses to each block
   - May retain old but frequently used blocks too long

4. **Random Replacement**
   - Randomly selects a block to replace
   - Simple to implement
   - Performance can be unpredictable

### Write Policies

Write policies determine how modifications to cache data are handled with respect to main memory.

1. **Write-Through**
   - Writes data to both cache and main memory simultaneously
   - Ensures memory consistency
   - Higher write traffic to main memory

2. **Write-Back**
   - Writes data only to cache
   - Updates main memory only when the cache line is evicted
   - Reduces write traffic to main memory
   - Requires a "dirty bit" to track modified blocks

3. **Write Allocate**
   - On a write miss, allocate a cache line and then perform the write
   - Often used with write-back policy

4. **No-Write Allocate**
   - On a write miss, write directly to main memory without allocating in cache
   - Often used with write-through policy

## Virtual Memory

Virtual memory is a memory management technique that provides an idealized abstraction of the storage resources actually available on a given machine, creating the illusion of a very large main memory.

### Virtual Memory Concepts

1. **Address Spaces**
   - **Virtual Address Space**: The addresses a program can use
   - **Physical Address Space**: The actual addresses in physical memory

2. **Page and Frame**
   - **Page**: Fixed-size block of virtual memory
   - **Frame**: Fixed-size block of physical memory
   - Pages map to frames

3. **Page Table**
   - Data structure that maps virtual pages to physical frames
   - Contains mapping information and status bits (valid, dirty, etc.)

### Paging and Segmentation

#### Paging

Paging divides virtual and physical memory into fixed-size blocks.

**Virtual to Physical Address Translation:**

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

#### Segmentation

Segmentation divides memory into variable-sized segments based on logical divisions of a program.

**Segment Address Translation:**

$$\text{Physical Address} = \text{Base Address} + \text{Offset}$$

**Formula Explanation:**
- **Physical Address**: The actual memory location
- **Base Address**: Starting address of the segment in physical memory
- **Offset**: Position within the segment
- The offset must be less than the segment limit to prevent illegal memory access

### Address Translation

The translation from virtual to physical addresses typically involves:

1. **Translation Lookaside Buffer (TLB)**
   - Cache of recently used page table entries
   - Speeds up address translation

2. **Multi-level Page Tables**
   - Reduces memory overhead for sparse address spaces
   - Uses multiple levels of indirection

**TLB Performance Impact:**

$$\text{Effective Access Time} = \text{TLB Hit Time} + \text{TLB Miss Rate} \times \text{TLB Miss Penalty}$$

**Formula Explanation:**
- **Effective Access Time**: Average time for address translation
- **TLB Hit Time**: Time to access the TLB and find the mapping
- **TLB Miss Rate**: Fraction of translations not found in TLB
- **TLB Miss Penalty**: Time to access the page table in memory
- A high TLB hit rate is crucial for good performance

### Page Replacement Algorithms

When physical memory is full and a new page needs to be loaded, a page replacement algorithm determines which existing page to evict.

1. **Optimal**
   - Replaces the page that will not be used for the longest time in the future
   - Theoretical benchmark, not implementable in practice

2. **Least Recently Used (LRU)**
   - Replaces the page that has not been accessed for the longest time
   - Good approximation of optimal but difficult to implement exactly

3. **First-In-First-Out (FIFO)**
   - Replaces the page that has been in memory the longest
   - Simple but may remove frequently used pages

4. **Clock (Second Chance)**
   - Approximation of LRU using a reference bit
   - When a page is accessed, its reference bit is set
   - The algorithm scans in a circular fashion, giving pages with reference bit set a "second chance"

### Page Fault Rate

The page fault rate is a critical metric for virtual memory performance:

$$\text{Page Fault Rate} = \frac{\text{Number of Page Faults}}{\text{Number of Memory Accesses}}$$

**Formula Explanation:**
- **Page Fault Rate**: Fraction of memory accesses that cause page faults
- **Number of Page Faults**: Memory accesses that require loading a page from disk
- **Number of Memory Accesses**: Total memory access attempts
- Lower page fault rates indicate better virtual memory performance

### Working Set Model

The working set model captures the locality of reference principle:

$$\text{Working Set}_{\Delta}(t) = \{\text{pages referenced in time interval } [t-\Delta, t]\}$$

**Formula Explanation:**
- **Working Set**: Set of pages a process is actively using
- **Δ**: Working set window size (time interval)
- **t**: Current time
- The working set size varies over time and between programs
- Allocating enough physical memory to hold a process's working set reduces page faults

## Memory Management Units

The Memory Management Unit (MMU) is hardware that translates virtual addresses to physical addresses.

### MMU Functions

1. **Address Translation**
   - Converts virtual addresses to physical addresses
   - Uses page tables and TLBs

2. **Protection**
   - Enforces memory access permissions
   - Prevents unauthorized access

3. **Cache Management**
   - Interacts with cache to ensure coherence
   - Manages cache policies

### MMU Components

1. **Translation Lookaside Buffer (TLB)**
   - Cache of page table entries
   - Contains virtual-to-physical address mappings

2. **Page Table Base Register**
   - Points to the current page table
   - Updated during context switches

3. **Control Registers**
   - Configure MMU behavior
   - Set protection levels and modes

### MMU Performance Optimization

1. **Multi-level TLBs**
   - Separate TLBs for instructions and data
   - Hierarchical TLB structure (L1, L2)

2. **Large Pages**
   - Reduce TLB pressure by mapping larger memory regions
   - Improve TLB coverage

3. **Hardware Page Table Walkers**
   - Automatically traverse page tables on TLB misses
   - Reduce software overhead

## Case Study: Modern Memory Architectures

Modern memory systems combine multiple techniques to optimize performance, cost, and power consumption.

### Non-Uniform Memory Access (NUMA)

NUMA architectures have memory access times that depend on the memory location relative to the processor.

**NUMA Ratio:**

$$\text{NUMA Ratio} = \frac{\text{Remote Memory Access Time}}{\text{Local Memory Access Time}}$$

**Formula Explanation:**
- **NUMA Ratio**: Measure of the penalty for accessing remote memory
- **Remote Memory Access Time**: Time to access memory attached to another processor
- **Local Memory Access Time**: Time to access memory attached to the local processor
- Lower NUMA ratios indicate more uniform memory performance

### Memory-Level Parallelism

Modern systems exploit memory-level parallelism to hide latency:

1. **Multiple Outstanding Requests**
   - CPUs can issue multiple memory requests before waiting for results
   - Overlaps memory access latency with useful work

2. **Bank-Level Parallelism**
   - Memory is divided into banks that can be accessed independently
   - Increases effective memory bandwidth

3. **Channel-Level Parallelism**
   - Multiple memory channels provide parallel data paths
   - Increases aggregate memory bandwidth

### Cache Coherence

In multi-processor systems, cache coherence protocols ensure that all processors see a consistent view of memory:

1. **MESI Protocol**
   - **Modified**: The cache line is modified and differs from main memory
   - **Exclusive**: The cache line is unmodified and exists only in this cache
   - **Shared**: The cache line is unmodified and may exist in other caches
   - **Invalid**: The cache line does not contain valid data

2. **Directory-Based Coherence**
   - Maintains a directory of which processors have copies of each cache line
   - Scales better than snooping protocols for large systems

## Practical Applications

Understanding memory systems has practical applications in various fields:

1. **Software Optimization**
   - Writing cache-friendly code
   - Managing memory allocation to reduce fragmentation
   - Optimizing data structures and algorithms for memory hierarchy

2. **System Design**
   - Configuring appropriate cache sizes and organizations
   - Balancing memory capacity, bandwidth, and latency
   - Designing for specific workload characteristics

3. **Performance Tuning**
   - Profiling memory access patterns
   - Identifying and resolving memory bottlenecks
   - Tuning virtual memory parameters 