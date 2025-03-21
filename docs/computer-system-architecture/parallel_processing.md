# Parallel Processing

**Course:** Computer System Architecture  
**Instructor:** Prof. Dr. Computer Architecture

## Navigation

[Table of Contents](../README.md) | 
[Computer Architecture Fundamentals](computer_architecture_fundamentals.md) | 
[Processor Architecture](processor_architecture.md) | 
[Memory Systems](memory_systems.md) | 
[Input/Output Systems](io_systems.md) | 
**Parallel Processing** | 
[Advanced Architectures](advanced_architectures.md)

---

## Parallel Computer Models

Parallel computing involves the simultaneous execution of multiple processes or threads to solve computational problems faster. Various models exist to classify parallel computers based on their architecture.

### Flynn's Taxonomy

Flynn's taxonomy classifies computer architectures based on instruction and data streams:

1. **SISD (Single Instruction, Single Data)**
   - Traditional sequential computer
   - One instruction stream, one data stream
   - Example: Classic von Neumann architecture

2. **SIMD (Single Instruction, Multiple Data)**
   - One instruction is executed on multiple data elements simultaneously
   - Vector processors, GPU architectures
   - Example: AVX instructions, CUDA cores

3. **MISD (Multiple Instruction, Single Data)**
   - Multiple instructions operate on the same data
   - Rare in practice
   - Example: Some specialized fault-tolerant systems

4. **MIMD (Multiple Instruction, Multiple Data)**
   - Multiple processors execute different instructions on different data
   - Most common parallel architecture today
   - Examples: Multicore CPUs, clusters, distributed systems

### Parallel Architecture Classifications

1. **Shared Memory Systems**
   - All processors access the same memory space
   - Communication through shared variables
   - Requires synchronization mechanisms

2. **Distributed Memory Systems**
   - Each processor has its own private memory
   - Communication through message passing
   - No need for complex synchronization mechanisms

3. **Hybrid Systems**
   - Combine shared and distributed memory approaches
   - Example: Cluster of multicore machines

## Multiprocessor Systems

Multiprocessor systems contain multiple processing elements within a single computer system.

### Symmetric Multiprocessing (SMP)

In SMP systems, multiple identical processors share a single memory system.

1. **Characteristics**
   - Uniform memory access (UMA)
   - Centralized shared memory
   - Identical processors
   - Single OS instance

2. **Performance Scaling**

The theoretical speedup of an SMP system can be calculated using Amdahl's Law:

$$\text{Speedup} = \frac{1}{(1-p) + \frac{p}{n}}$$

**Formula Explanation:**
- **Speedup**: The factor by which execution time is reduced
- **p**: Proportion of the program that can be parallelized (0 ≤ p ≤ 1)
- **n**: Number of processors
- **(1-p)**: Proportion that remains sequential
- As n approaches infinity, the maximum speedup approaches 1/(1-p)
- This formula shows that even a small sequential portion limits the maximum possible speedup

3. **Memory Contention**

Memory contention occurs when multiple processors attempt to access the same memory simultaneously:

$$\text{Memory Access Time} = \text{Base Access Time} \times (1 + \text{Contention Factor})$$

**Formula Explanation:**
- **Memory Access Time**: Actual time to access memory
- **Base Access Time**: Time to access memory without contention
- **Contention Factor**: Additional delay due to multiple processors competing for memory access
- The contention factor typically increases with the number of processors

### Distributed Memory Systems

In distributed memory systems, each processor has its own private memory.

1. **Characteristics**
   - Non-uniform memory access (NUMA)
   - Scalable architecture
   - Message passing for communication
   - May run multiple OS instances

2. **Communication Overhead**

The performance impact of communication in distributed systems can be modeled as:

$$T_{communication} = T_{latency} + \frac{M}{B}$$

**Formula Explanation:**
- **T_communication**: Total time for communication
- **T_latency**: Network latency (time to establish connection)
- **M**: Message size in bytes
- **B**: Bandwidth in bytes per second
- This formula shows that communication has both fixed (latency) and variable (bandwidth-dependent) components

3. **Effective Parallel Efficiency**

The efficiency of a parallel system with communication overhead:

$$\text{Efficiency} = \frac{\text{Speedup}}{n} = \frac{1}{n \times ((1-p) + \frac{p}{n} + \frac{T_{comm}}{T_{comp}})}$$

**Formula Explanation:**
- **Efficiency**: Fraction of ideal speedup achieved
- **Speedup**: Actual speedup achieved
- **n**: Number of processors
- **p**: Parallelizable fraction of the program
- **T_comm**: Time spent on communication
- **T_comp**: Time spent on computation
- Efficiency decreases as communication overhead increases

## Interconnection Networks

Interconnection networks provide communication paths between processors, memory modules, and I/O devices in parallel systems.

### Network Topologies

1. **Bus**
   - All devices share a common communication path
   - Simple but limited scalability
   - Bandwidth shared among all connected devices

2. **Mesh**
   - Processors arranged in a grid
   - Each processor connected to its neighbors
   - Good for locality, scales well

3. **Hypercube**
   - Each processor connected to processors that differ in exactly one bit position
   - Good balance of connectivity and scalability
   - For n dimensions, each node has n connections

4. **Fat Tree**
   - Tree structure with increasing bandwidth toward the root
   - Good for hierarchical communication patterns
   - Used in many high-performance computing systems

### Network Performance Metrics

1. **Diameter**
   - Maximum shortest path between any two nodes
   - Affects worst-case communication latency

   For common topologies:
   - Bus: 1
   - Mesh (n×n): 2(n-1)
   - Hypercube (dimension d): d
   - Ring (n nodes): ⌊n/2⌋

2. **Bisection Bandwidth**
   - Minimum bandwidth between two equal halves of the network
   - Measure of network's ability to handle communication between different parts

3. **Node Degree**
   - Number of connections per node
   - Affects hardware complexity and cost

### Network Routing Algorithms

1. **Deterministic Routing**
   - Fixed path between source and destination
   - Simple but may not adapt to congestion
   - Example: Dimension-ordered routing in meshes

2. **Adaptive Routing**
   - Path can change based on network conditions
   - Better performance under congestion
   - More complex to implement

3. **Routing Performance**

The average communication latency can be modeled as:

$$T_{avg} = H \times (T_{router} + \frac{L}{B}) + T_{contention}$$

**Formula Explanation:**
- **T_avg**: Average communication latency
- **H**: Average number of hops (router traversals)
- **T_router**: Per-hop router latency
- **L**: Message length
- **B**: Channel bandwidth
- **T_contention**: Additional delay due to network congestion
- This formula shows that both network topology (affecting H) and router design (affecting T_router) impact communication performance

## Parallel Programming Models

Parallel programming models provide abstractions for developing parallel applications.

### Shared Memory Programming

1. **Threads**
   - Lightweight units of execution that share memory
   - Examples: POSIX threads (pthreads), Java threads

2. **OpenMP**
   - Directive-based API for shared memory parallelism
   - Supports fork-join parallelism
   - Relatively easy to add to existing sequential code

3. **Synchronization Overhead**

The impact of synchronization on parallel performance:

$$T_{parallel} = T_{sequential} / n + T_{sync}$$

**Formula Explanation:**
- **T_parallel**: Execution time with parallelism
- **T_sequential**: Original sequential execution time
- **n**: Number of threads/processors
- **T_sync**: Time spent on synchronization
- As n increases, T_sync often becomes the limiting factor

### Message Passing Programming

1. **MPI (Message Passing Interface)**
   - Standard for message passing in distributed memory systems
   - Explicit communication through send/receive operations
   - Highly scalable but more complex programming model

2. **Communication Patterns**
   - Point-to-point: Direct communication between two processes
   - Collective: Involving multiple or all processes (broadcast, reduce, etc.)

3. **Communication Overhead**

The overhead of collective operations often scales with system size:

$$T_{collective} = \alpha + \beta \times \text{size} \times f(P)$$

**Formula Explanation:**
- **T_collective**: Time for collective operation
- **α**: Latency component
- **β**: Transfer time per byte
- **size**: Data size
- **f(P)**: Function of processor count P (depends on operation)
- For example, for broadcast: f(P) = log₂(P)
- This formula shows how communication costs increase with system size

### Data Parallel Programming

1. **CUDA/OpenCL**
   - Programming models for GPU computing
   - Massive parallelism with thousands of threads
   - SIMD-like execution model

2. **Performance Considerations**

The effective performance of GPU computation:

$$\text{Effective GFLOPS} = \frac{\text{Operations}}{\text{Kernel Time} + \text{Data Transfer Time}}$$

**Formula Explanation:**
- **Effective GFLOPS**: Billion floating-point operations per second actually achieved
- **Operations**: Number of floating-point operations in the computation
- **Kernel Time**: Time spent executing on the GPU
- **Data Transfer Time**: Time spent transferring data between CPU and GPU
- Data transfer overhead can significantly reduce effective performance

## Performance Considerations

Various factors affect the performance of parallel systems.

### Scalability

Scalability measures how well performance improves as more resources are added.

1. **Strong Scaling**
   - Fixed problem size, increasing number of processors
   - Ideal: execution time decreases linearly with processor count
   - Limited by sequential portions and communication overhead

2. **Weak Scaling**
   - Problem size increases proportionally with processor count
   - Ideal: execution time remains constant
   - Often more achievable than strong scaling

3. **Isoefficiency Function**

The isoefficiency function relates problem size to processor count for constant efficiency:

$$W = KE \times f(p)$$

**Formula Explanation:**
- **W**: Problem size (work)
- **KE**: Constant depending on desired efficiency
- **f(p)**: Function of processor count
- **p**: Number of processors
- A smaller f(p) indicates better scalability
- For example, f(p) = p log p for many divide-and-conquer algorithms

### Load Balancing

Load balancing ensures that work is evenly distributed among processors.

1. **Static Load Balancing**
   - Work distribution determined before execution
   - Simple but may not adapt to runtime variations

2. **Dynamic Load Balancing**
   - Work distribution adjusted during execution
   - Better performance for irregular workloads
   - Introduces overhead for work distribution

3. **Load Imbalance Impact**

The performance impact of load imbalance:

$$\text{Efficiency} = \frac{1}{1 + \sigma}$$

**Formula Explanation:**
- **Efficiency**: Fraction of ideal performance achieved
- **σ**: Coefficient of variation of processor loads (standard deviation / mean)
- Higher load imbalance (larger σ) reduces efficiency
- Perfect load balance (σ = 0) gives 100% efficiency

### Memory Access Patterns

Memory access patterns significantly affect parallel performance.

1. **Spatial Locality**
   - Accessing memory locations close to each other
   - Improves cache utilization

2. **Temporal Locality**
   - Reusing the same memory locations
   - Reduces cache misses

3. **False Sharing**
   - Multiple processors accessing different variables in the same cache line
   - Causes unnecessary cache coherence traffic

4. **Cache Miss Impact**

The performance impact of cache misses in parallel systems:

$$\text{Memory Access Time} = \text{Hit Time} + \text{Miss Rate} \times \text{Miss Penalty} \times (1 + \text{Coherence Factor})$$

**Formula Explanation:**
- **Memory Access Time**: Average time for memory access
- **Hit Time**: Time to access data in cache
- **Miss Rate**: Fraction of accesses not found in cache
- **Miss Penalty**: Time to fetch data from main memory
- **Coherence Factor**: Additional delay due to cache coherence protocol
- Parallel execution often increases the coherence factor

## Case Study: Parallel Computing Architectures

Modern parallel computing systems combine multiple approaches to achieve high performance.

### Supercomputers

1. **Characteristics**
   - Thousands to millions of cores
   - Specialized high-speed interconnects
   - Optimized for scientific and engineering applications

2. **Performance Metrics**
   - FLOPS (Floating-Point Operations Per Second)
   - TOP500 list ranks supercomputers by LINPACK benchmark

3. **Architecture Trends**
   - Hybrid designs (CPU + accelerators)
   - Hierarchical memory systems
   - Energy efficiency as a primary constraint

### Cluster Computing

1. **Characteristics**
   - Collection of commodity computers
   - Connected by standard network technology
   - Cost-effective approach to parallel computing

2. **Performance Considerations**
   - Network becomes a critical factor
   - Software overhead for coordination
   - Heterogeneity management

### Cloud Computing

1. **Characteristics**
   - Virtualized resources
   - Elastic scaling
   - Pay-as-you-go model

2. **Performance Challenges**
   - Virtualization overhead
   - Resource contention
   - Network variability

## Practical Applications

Parallel processing has applications in various domains:

1. **Scientific Computing**
   - Climate modeling
   - Molecular dynamics
   - Computational fluid dynamics

2. **Data Analytics**
   - Big data processing
   - Machine learning
   - Real-time analytics

3. **Graphics and Visualization**
   - Rendering
   - Physics simulation
   - Virtual reality

4. **Optimization Strategies**
   - Algorithm redesign for parallelism
   - Data layout optimization
   - Communication minimization 