# CPU Scheduling

[Back to Course Content](README.md) | [Previous: Threads and Concurrency](threads-concurrency.md) | [Next: Synchronization Tools →](synchronization.md)

## What is CPU Scheduling?

CPU scheduling is the process of selecting which process should be executed next and allocating the CPU to it. The scheduler is the component of the operating system that makes this decision.

```mermaid
graph TD
    A[Ready Queue] -->|Select| B[CPU Scheduler]
    B -->|Dispatch| C[CPU]
    C -->|Time Slice| A
    C -->|I/O Request| D[I/O Queue]
    D -->|I/O Complete| A
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
```

## Scheduling Concepts

### CPU-I/O Burst Cycle

```mermaid
graph LR
    A[CPU Burst] -->|I/O Request| B[I/O Burst]
    B -->|I/O Complete| A
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
```

### Preemptive vs Non-preemptive Scheduling

```mermaid
graph TD
    A[Scheduling Types] --> B[Preemptive]
    A --> C[Non-preemptive]
    
    B --> D[Process can be interrupted]
    B --> E[Better response time]
    
    C --> F[Process runs until completion]
    C --> G[Less overhead]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
```

## Scheduling Algorithms

### First-Come, First-Served (FCFS)

```mermaid
gantt
    title FCFS Scheduling
    dateFormat  X
    axisFormat %s
    section Process
    P1    :a1, 0, 24
    P2    :a2, 24, 27
    P3    :a3, 27, 30
```

**Characteristics:**
- Non-preemptive
- Simple implementation
- Convoy effect
- Poor response time

### Shortest-Job-First (SJF)

```mermaid
gantt
    title SJF Scheduling
    dateFormat  X
    axisFormat %s
    section Process
    P2    :a1, 0, 3
    P3    :a2, 3, 6
    P1    :a3, 6, 30
```

**Characteristics:**
- Optimal average waiting time
- Difficult to predict burst time
- Starvation of long processes

### Priority Scheduling

```mermaid
gantt
    title Priority Scheduling
    dateFormat  X
    axisFormat %s
    section Process
    P1    :a1, 0, 10
    P2    :a2, 10, 15
    P3    :a3, 15, 20
```

**Characteristics:**
- Priority levels
- Starvation problem
- Aging solution

### Round Robin (RR)

```mermaid
gantt
    title Round Robin Scheduling
    dateFormat  X
    axisFormat %s
    section Process
    P1    :a1, 0, 4
    P2    :a2, 4, 8
    P3    :a3, 8, 12
    P1    :a4, 12, 16
    P2    :a5, 16, 20
    P3    :a6, 20, 24
```

**Characteristics:**
- Time quantum
- Fair scheduling
- Response time depends on quantum size

### Multilevel Queue Scheduling

```mermaid
graph TD
    A[Ready Queue] --> B[System Processes]
    A --> C[Interactive Processes]
    A --> D[Batch Processes]
    
    B --> E[CPU]
    C --> E
    D --> E
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
```

### Multilevel Feedback Queue

```mermaid
graph TD
    A[Ready Queue] --> B[Queue 1]
    A --> C[Queue 2]
    A --> D[Queue N]
    
    B -->|Higher Priority| E[CPU]
    C -->|Medium Priority| E
    D -->|Lower Priority| E
    
    E -->|Time Slice Expired| F[Next Queue]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
```

## Performance Metrics

### CPU Utilization

```mermaid
graph LR
    A[CPU Time] -->|Divide by| B[Total Time]
    B -->|Multiply by 100| C[CPU Utilization %]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

### Throughput

```mermaid
graph LR
    A[Number of Processes] -->|Divide by| B[Time Unit]
    B --> C[Throughput]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

### Turnaround Time

```mermaid
graph LR
    A[Completion Time] -->|Minus| B[Arrival Time]
    B --> C[Turnaround Time]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

### Waiting Time

```mermaid
graph LR
    A[Turnaround Time] -->|Minus| B[Burst Time]
    B --> C[Waiting Time]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

### Response Time

```mermaid
graph LR
    A[First Response] -->|Minus| B[Arrival Time]
    B --> C[Response Time]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

## Real-World Applications

### Linux Scheduler

```mermaid
graph TD
    A[Linux Scheduler] --> B[CFS]
    A --> C[Real-time Scheduler]
    
    B --> D[Fair Scheduling]
    B --> E[Load Balancing]
    
    C --> F[Priority-based]
    C --> G[Deadline-based]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
```

### Windows Scheduler

```mermaid
graph TD
    A[Windows Scheduler] --> B[Priority-based]
    A --> C[Multilevel Feedback]
    
    B --> D[Real-time Priority]
    B --> E[High Priority]
    B --> F[Normal Priority]
    
    C --> G[Foreground Boost]
    C --> H[Background Tasks]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
    style H fill:#fdd,stroke:#333
```

## Performance Considerations

### Scheduling Overhead

```mermaid
graph LR
    A[Context Switch] -->|Time| B[Algorithm Overhead]
    B -->|Time| C[Queue Management]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

### Optimization Techniques

1. **Efficient Data Structures**
   - Priority queues
   - Red-black trees
   - Hash tables

2. **Load Balancing**
   - Process migration
   - Queue balancing
   - Processor affinity

3. **Cache Optimization**
   - Cache-aware scheduling
   - NUMA-aware scheduling
   - Power-aware scheduling

## Summary

CPU scheduling is a crucial component of operating systems that determines which process gets to use the CPU and for how long. Different scheduling algorithms offer various trade-offs between fairness, response time, and throughput.

The choice of scheduling algorithm depends on the system's goals and requirements. Modern operating systems often use complex scheduling algorithms that combine multiple approaches to achieve optimal performance.

Understanding CPU scheduling is essential for both system programmers and application developers, as it affects application performance and system responsiveness.

## References and Further Reading

- Silberschatz, A., Galvin, P. B., & Gagne, G. (2018). *Operating System Concepts* (10th Edition). Wiley.
- Tanenbaum, A. S., & Bos, H. (2014). *Modern Operating Systems* (4th Edition). Pearson.
- Stevens, W. R., & Rago, S. A. (2013). *Advanced Programming in the UNIX Environment* (3rd Edition). Addison-Wesley.
- Bryant, R. E., & O'Hallaron, D. R. (2015). *Computer Systems: A Programmer's Perspective* (3rd Edition). Pearson.
- Love, R. (2013). *Linux System Programming* (2nd Edition). O'Reilly Media. 