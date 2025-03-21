# Input/Output Systems

**Course:** Computer System Architecture  
**Instructor:** Prof. Dr. Computer Architecture

## Navigation

[Table of Contents](../README.md) | 
[Computer Architecture Fundamentals](computer_architecture_fundamentals.md) | 
[Processor Architecture](processor_architecture.md) | 
[Memory Systems](memory_systems.md) | 
**Input/Output Systems** | 
[Parallel Processing](parallel_processing.md) | 
[Advanced Architectures](advanced_architectures.md)

---

## I/O Architecture

Input/Output (I/O) systems enable communication between the computer and the external world. They handle the transfer of data between the CPU/memory and peripheral devices.

### I/O System Components

1. **I/O Devices**
   - Peripheral hardware that connects to the computer
   - Examples: keyboards, displays, disks, network interfaces

2. **I/O Controllers**
   - Interface between the CPU and I/O devices
   - Handle device-specific details
   - Buffer data between the device and system

3. **I/O Buses**
   - Communication pathways for data transfer
   - Connect I/O controllers to the system

4. **I/O Software**
   - Device drivers
   - I/O libraries and APIs
   - Operating system I/O subsystem

### I/O Performance Metrics

1. **Bandwidth**
   - Amount of data transferred per unit time
   - Measured in bytes per second (B/s) or bits per second (bps)

2. **Latency**
   - Time delay between initiating and completing an I/O operation
   - Includes request processing, data transfer, and response time

3. **Throughput**
   - Number of I/O operations completed per unit time
   - Affected by both bandwidth and latency

4. **Utilization**
   - Percentage of time the I/O system is busy
   - High utilization may indicate a bottleneck

### I/O Performance Calculation

The time to complete an I/O operation can be calculated as:

$$T_{I/O} = T_{setup} + \frac{B}{BW} + T_{termination}$$

**Formula Explanation:**
- **T_I/O**: Total time to complete the I/O operation
- **T_setup**: Time to set up the transfer (including latency)
- **B**: Amount of data to transfer (in bytes)
- **BW**: Bandwidth of the I/O path (in bytes per second)
- **T_termination**: Time to complete the operation after data transfer

This formula shows that I/O performance is affected by both fixed costs (setup and termination) and variable costs that depend on the amount of data transferred.

## I/O Techniques

Various techniques are used to perform I/O operations, each with different characteristics in terms of CPU involvement and efficiency.

### Programmed I/O

In programmed I/O, the CPU directly controls the I/O operation and continuously checks the device status.

1. **Characteristics**
   - CPU issues commands directly to I/O device
   - CPU polls device status until operation completes
   - Simple but inefficient use of CPU time

2. **Performance Impact**

$$\text{CPU Utilization} = \frac{T_{computation}}{T_{computation} + T_{I/O}}$$

**Formula Explanation:**
- **CPU Utilization**: Fraction of time the CPU is doing useful work
- **T_computation**: Time spent on computation
- **T_I/O**: Time spent waiting for I/O
- With programmed I/O, the CPU is idle during I/O operations, leading to low utilization

### Interrupt-Driven I/O

Interrupt-driven I/O allows the CPU to perform other tasks while waiting for I/O operations to complete.

1. **Characteristics**
   - CPU initiates I/O operation and continues with other work
   - Device signals completion via an interrupt
   - CPU handles the interrupt and processes the I/O result

2. **Performance Impact**

$$\text{CPU Utilization} = \frac{T_{computation} + T_{interrupt\_handling}}{T_{computation} + T_{interrupt\_handling} + T_{I/O\_wait}}$$

**Formula Explanation:**
- **CPU Utilization**: Fraction of time the CPU is doing useful work
- **T_computation**: Time spent on computation
- **T_interrupt_handling**: Time spent handling interrupts
- **T_I/O_wait**: Time waiting for I/O (CPU can do other work)
- Interrupt-driven I/O improves CPU utilization compared to programmed I/O

3. **Interrupt Overhead**

$$\text{Interrupt Overhead} = \frac{T_{interrupt\_handling}}{T_{total}}$$

**Formula Explanation:**
- **Interrupt Overhead**: Fraction of time spent handling interrupts
- **T_interrupt_handling**: Time spent handling interrupts
- **T_total**: Total execution time
- High interrupt rates can lead to significant overhead

### Direct Memory Access (DMA)

DMA allows peripheral devices to transfer data directly to/from memory without CPU intervention.

1. **Characteristics**
   - CPU initiates the transfer with parameters (source, destination, length)
   - DMA controller manages the data transfer
   - CPU is notified only when the entire operation is complete

2. **Performance Impact**

$$\text{Effective Bandwidth} = \frac{B}{T_{setup} + \frac{B}{BW} + T_{completion}}$$

**Formula Explanation:**
- **Effective Bandwidth**: Actual data transfer rate achieved
- **B**: Amount of data transferred
- **T_setup**: Time to set up the DMA transfer
- **BW**: Raw bandwidth of the I/O path
- **T_completion**: Time to complete the operation after transfer
- DMA reduces CPU overhead and improves effective bandwidth for large transfers

3. **DMA Transfer Efficiency**

$$\text{DMA Efficiency} = \frac{T_{data\_transfer}}{T_{data\_transfer} + T_{overhead}}$$

**Formula Explanation:**
- **DMA Efficiency**: Fraction of time spent transferring data
- **T_data_transfer**: Time spent actually transferring data
- **T_overhead**: Time spent on DMA setup and completion
- DMA is most efficient for large, contiguous data transfers

## I/O Interfaces and Buses

I/O interfaces and buses provide standardized ways to connect devices to computer systems.

### Bus Architecture

1. **Bus Characteristics**
   - **Width**: Number of data lines (bits transferred in parallel)
   - **Clock Speed**: Frequency of the bus clock
   - **Transfer Protocol**: Rules governing data transfer

2. **Bus Bandwidth**

$$\text{Bus Bandwidth} = \text{Width} \times \text{Clock Speed} \times \text{Efficiency}$$

**Formula Explanation:**
- **Bus Bandwidth**: Maximum data transfer rate
- **Width**: Number of data bits transferred in parallel (bits)
- **Clock Speed**: Bus clock frequency (Hz)
- **Efficiency**: Fraction of clock cycles used for data transfer
- This theoretical maximum is often reduced by protocol overhead

### Common I/O Interfaces

1. **PCI Express (PCIe)**
   - Serial, point-to-point interface
   - Multiple lanes per connection (x1, x4, x8, x16)
   - Each generation doubles the bandwidth per lane

   **PCIe Bandwidth Calculation:**

   $$\text{PCIe Bandwidth} = \text{Lanes} \times \text{Lane Speed} \times \text{Encoding Efficiency}$$

   **Formula Explanation:**
   - **PCIe Bandwidth**: Maximum data transfer rate
   - **Lanes**: Number of PCIe lanes
   - **Lane Speed**: Data rate per lane (e.g., 8 GT/s for PCIe 3.0)
   - **Encoding Efficiency**: Overhead of encoding scheme (e.g., 128b/130b for PCIe 3.0)
   - For example, PCIe 3.0 x16 provides approximately 16 GB/s of bandwidth

2. **USB (Universal Serial Bus)**
   - Serial bus for connecting peripherals
   - Multiple versions with increasing speeds
   - Hot-pluggable and widely supported

3. **SATA (Serial ATA)**
   - Interface primarily for storage devices
   - Point-to-point serial connection
   - Multiple generations with increasing speeds

### I/O Bus Arbitration

When multiple devices share a bus, arbitration determines which device gets access.

1. **Arbitration Methods**
   - **Centralized**: A single arbiter controls bus access
   - **Distributed**: Devices cooperate to determine access
   - **Daisy Chain**: Priority-based sequential access

2. **Bus Utilization**

$$\text{Bus Utilization} = \frac{\text{Time Bus is Transferring Data}}{\text{Total Time}}$$

**Formula Explanation:**
- **Bus Utilization**: Fraction of time the bus is actively transferring data
- **Time Bus is Transferring Data**: Time spent on actual data transfer
- **Total Time**: Total elapsed time
- High bus utilization indicates efficient use of the bus bandwidth

## Storage Systems

Storage systems provide persistent data storage with various performance characteristics.

### Storage Hierarchy

1. **Primary Storage (RAM)**
   - Volatile, high-speed, directly accessible by CPU
   - Limited capacity, high cost per byte

2. **Secondary Storage (SSD, HDD)**
   - Non-volatile, moderate speed, block-accessible
   - Larger capacity, moderate cost per byte

3. **Tertiary Storage (Tape, Optical)**
   - Non-volatile, slow speed, sequential access
   - Very large capacity, low cost per byte

### Storage Performance Metrics

1. **Access Time**
   - Time to locate and retrieve data
   - For HDDs: Seek Time + Rotational Latency + Transfer Time

2. **Throughput**
   - Rate at which data can be read or written
   - Affected by interface speed and device capabilities

3. **IOPS (I/O Operations Per Second)**
   - Number of read/write operations per second
   - Critical for random access workloads

### HDD Performance Calculation

For a hard disk drive, the average access time can be calculated as:

$$T_{access} = T_{seek} + T_{rotation} + T_{transfer}$$

Where:

$$T_{rotation} = \frac{1}{2} \times \frac{60}{RPM} \text{ seconds}$$

$$T_{transfer} = \frac{\text{Block Size}}{\text{Transfer Rate}}$$

**Formula Explanation:**
- **T_access**: Total time to access data
- **T_seek**: Time to position the read/write head over the correct track
- **T_rotation**: Average time for the disk to rotate to the correct sector (half a rotation on average)
- **RPM**: Rotations per minute of the disk
- **T_transfer**: Time to transfer the data once positioned
- **Block Size**: Size of the data block to transfer
- **Transfer Rate**: Rate at which data can be read from the disk surface

### SSD Performance Characteristics

SSDs have different performance characteristics than HDDs:

1. **Random vs. Sequential Access**
   - SSDs have similar performance for both random and sequential access
   - HDDs perform much better for sequential access

2. **Read vs. Write Performance**
   - SSDs typically have faster reads than writes
   - Write amplification can reduce write performance

$$\text{Write Amplification} = \frac{\text{Data Written to Flash}}{\text{Data Written by Host}}$$

**Formula Explanation:**
- **Write Amplification**: Ratio of physical writes to logical writes
- **Data Written to Flash**: Actual amount of data written to flash memory
- **Data Written by Host**: Amount of data the host requested to write
- Higher write amplification reduces SSD endurance and performance

### RAID Configurations

RAID (Redundant Array of Independent Disks) combines multiple disk drives into a logical unit for improved performance or redundancy.

1. **RAID 0 (Striping)**
   - Data is split across multiple drives
   - Improved performance but no redundancy
   - Capacity = Sum of all drives

2. **RAID 1 (Mirroring)**
   - Data is duplicated on multiple drives
   - Provides redundancy but reduces usable capacity
   - Capacity = Size of smallest drive

3. **RAID 5 (Striping with Parity)**
   - Data and parity information distributed across all drives
   - Can survive one drive failure
   - Capacity = (N-1) × Size of smallest drive (for N drives)

4. **RAID 6 (Striping with Double Parity)**
   - Similar to RAID 5 but with two parity blocks
   - Can survive two drive failures
   - Capacity = (N-2) × Size of smallest drive (for N drives)

5. **RAID 10 (1+0, Mirroring and Striping)**
   - Combines RAID 1 and RAID 0
   - Provides both performance and redundancy
   - Capacity = Total size / 2

### RAID Performance

The performance of different RAID levels can be calculated as follows:

1. **RAID 0 (Striping)**

$$\text{Read Throughput} = N \times \text{Single Drive Throughput}$$
$$\text{Write Throughput} = N \times \text{Single Drive Throughput}$$

**Formula Explanation:**
- **N**: Number of drives in the array
- **Single Drive Throughput**: Throughput of a single drive
- RAID 0 provides the best performance but no redundancy

2. **RAID 1 (Mirroring)**

$$\text{Read Throughput} = N \times \text{Single Drive Throughput}$$
$$\text{Write Throughput} = \text{Single Drive Throughput}$$

**Formula Explanation:**
- **N**: Number of drives in the array
- **Single Drive Throughput**: Throughput of a single drive
- RAID 1 improves read performance but not write performance

3. **RAID 5 (Striping with Parity)**

$$\text{Read Throughput} \approx (N-1) \times \text{Single Drive Throughput}$$
$$\text{Write Throughput} \approx \frac{\text{Single Drive Throughput}}{4}$$

**Formula Explanation:**
- **N**: Number of drives in the array
- **Single Drive Throughput**: Throughput of a single drive
- RAID 5 has good read performance but poor write performance due to parity calculations

### Storage Technologies

1. **Hard Disk Drives (HDD)**
   - Mechanical storage using magnetic platters
   - High capacity, low cost, but slower access

2. **Solid State Drives (SSD)**
   - Flash-based storage with no moving parts
   - Faster access, more expensive per GB than HDDs

3. **NVMe (Non-Volatile Memory Express)**
   - Protocol designed specifically for SSDs
   - Connects directly to PCIe for higher performance
   - Reduces protocol overhead compared to SATA

4. **Storage Class Memory (SCM)**
   - Technologies like 3D XPoint that bridge the gap between DRAM and flash
   - Lower latency than flash but higher capacity than DRAM

## I/O Scheduling

I/O scheduling algorithms determine the order in which I/O requests are serviced to optimize performance.

### Disk Scheduling Algorithms

1. **First-Come, First-Served (FCFS)**
   - Requests are serviced in the order they arrive
   - Simple but may cause excessive seek time

2. **Shortest Seek Time First (SSTF)**
   - Services the request closest to the current head position
   - Reduces seek time but may cause starvation

3. **SCAN (Elevator)**
   - Head moves in one direction servicing requests until it reaches the end, then reverses
   - Provides fair service and good throughput

4. **C-SCAN (Circular SCAN)**
   - Similar to SCAN but only services requests in one direction
   - After reaching the end, the head returns to the beginning
   - More uniform wait times than SCAN

### I/O Scheduler Performance

The effectiveness of an I/O scheduler can be measured by:

$$\text{Average Response Time} = \frac{\sum_{i=1}^{n} (T_{completion,i} - T_{arrival,i})}{n}$$

**Formula Explanation:**
- **Average Response Time**: Average time from request arrival to completion
- **T_completion,i**: Time when request i completes
- **T_arrival,i**: Time when request i arrives
- **n**: Number of requests
- Lower average response time indicates better scheduler performance

## Case Study: Modern I/O Systems

Modern I/O systems combine multiple technologies to achieve high performance and flexibility.

### NVMe over Fabrics (NVMe-oF)

NVMe over Fabrics extends NVMe to operate over network fabrics, enabling remote storage access with performance similar to local storage.

1. **Performance Characteristics**
   - Lower latency than traditional networked storage
   - Scales to many devices and high bandwidth
   - Preserves many benefits of local NVMe

2. **Protocol Efficiency**

$$\text{Protocol Efficiency} = \frac{\text{User Data Size}}{\text{Total Packet Size}}$$

**Formula Explanation:**
- **Protocol Efficiency**: Fraction of network bandwidth used for actual data
- **User Data Size**: Size of the actual data being transferred
- **Total Packet Size**: Size of the complete packet including headers and metadata
- NVMe-oF has higher efficiency than older protocols like iSCSI

### Software-Defined Storage (SDS)

Software-defined storage separates storage management from the underlying hardware.

1. **Benefits**
   - Hardware abstraction
   - Centralized management
   - Dynamic resource allocation

2. **Performance Considerations**
   - Software overhead
   - Network latency
   - Resource contention

## Practical Applications

Understanding I/O systems has practical applications in various fields:

1. **System Design**
   - Balancing I/O bandwidth with CPU and memory performance
   - Selecting appropriate storage technologies for workloads
   - Designing for scalability and reliability

2. **Performance Optimization**
   - Tuning I/O schedulers for specific workloads
   - Optimizing data layout for access patterns
   - Implementing caching strategies

3. **Application Development**
   - Designing I/O-efficient algorithms
   - Implementing asynchronous I/O for better responsiveness
   - Optimizing data structures for storage access patterns 