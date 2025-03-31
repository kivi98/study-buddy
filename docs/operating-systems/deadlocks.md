# Deadlocks

[Back to Course Content](README.md) | [Previous: Synchronization Tools](synchronization.md) | [Next: Memory Management →](memory-management.md)

## What is a Deadlock?

A deadlock is a situation where a set of processes are blocked because each process is holding a resource and waiting for another resource acquired by some other process.

```mermaid
graph TD
    A[Process 1] -->|Holds| B[Resource A]
    A -->|Waits for| C[Resource B]
    
    D[Process 2] -->|Holds| C
    D -->|Waits for| B
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
```

## Deadlock Characterization

### Necessary Conditions

```mermaid
graph TD
    A[Deadlock] --> B[Mutual Exclusion]
    A --> C[Hold and Wait]
    A --> D[No Preemption]
    A --> E[Circular Wait]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
```

### Resource Allocation Graph

```mermaid
graph LR
    P1[Process 1] -->|Request| R1[Resource 1]
    P2[Process 2] -->|Request| R2[Resource 2]
    R1 -->|Allocated to| P2
    R2 -->|Allocated to| P1
    
    style P1 fill:#f9f,stroke:#333
    style P2 fill:#bbf,stroke:#333
    style R1 fill:#dfd,stroke:#333
    style R2 fill:#fdb,stroke:#333
```

## Deadlock Prevention

### Prevention Methods

```mermaid
graph TD
    A[Deadlock Prevention] --> B[Mutual Exclusion]
    A --> C[Hold and Wait]
    A --> D[No Preemption]
    A --> E[Circular Wait]
    
    B --> F[Allow sharing]
    C --> G[Request all at once]
    D --> H[Allow preemption]
    E --> I[Impose ordering]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
    style H fill:#fdd,stroke:#333
    style I fill:#dfd,stroke:#333
```

### Resource Ordering

```mermaid
graph TD
    A[Resources] -->|Order| B[Resource 1]
    A -->|Order| C[Resource 2]
    A -->|Order| D[Resource N]
    
    B -->|Must request| C
    C -->|Must request| D
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
```

## Deadlock Avoidance

### Safe State

```mermaid
graph TD
    A[System State] -->|Check| B[Safe State?]
    B -->|Yes| C[Allow Request]
    B -->|No| D[Deny Request]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
```

### Banker's Algorithm

```mermaid
graph TD
    A[Banker's Algorithm] --> B[Available Resources]
    A --> C[Maximum Resources]
    A --> D[Allocated Resources]
    A --> E[Need Matrix]
    
    B --> F[Safety Check]
    C --> F
    D --> F
    E --> F
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
```

## Deadlock Detection

### Detection Algorithm

```mermaid
graph TD
    A[Resource Allocation Graph] -->|Convert to| B[Wait-for Graph]
    B -->|Check for| C[Cycle Detection]
    C -->|Found| D[Deadlock Exists]
    C -->|Not Found| E[No Deadlock]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
```

### Wait-for Graph

```mermaid
graph LR
    P1[Process 1] -->|Waits for| P2[Process 2]
    P2 -->|Waits for| P3[Process 3]
    P3 -->|Waits for| P1
    
    style P1 fill:#f9f,stroke:#333
    style P2 fill:#bbf,stroke:#333
    style P3 fill:#dfd,stroke:#333
```

## Deadlock Recovery

### Recovery Methods

```mermaid
graph TD
    A[Deadlock Recovery] --> B[Process Termination]
    A --> C[Resource Preemption]
    
    B --> D[Abort all processes]
    B --> E[Abort one by one]
    
    C --> F[Select victim]
    C --> G[Rollback]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
```

### Victim Selection

```mermaid
graph TD
    A[Victim Selection] --> B[Priority]
    A --> C[Resources Held]
    A --> D[Time Running]
    
    B --> E[Select Victim]
    C --> E
    D --> E
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
```

## Real-World Applications

### Database Systems

```mermaid
graph TD
    A[Transaction 1] -->|Lock| B[Table A]
    C[Transaction 2] -->|Lock| D[Table B]
    
    A -->|Wait for| D
    C -->|Wait for| B
    
    E[Deadlock Detector] -->|Detect| F[Rollback]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
```

### Operating Systems

```mermaid
graph TD
    A[Process 1] -->|Lock| B[Printer]
    C[Process 2] -->|Lock| D[Scanner]
    
    A -->|Wait for| D
    C -->|Wait for| B
    
    E[OS Scheduler] -->|Detect| F[Terminate]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
```

## Performance Considerations

### Detection Overhead

```mermaid
graph LR
    A[Resource Graph] -->|Time| B[Cycle Detection]
    B -->|Time| C[Recovery Action]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

### Optimization Techniques

1. **Efficient Detection**
   - Periodic checking
   - Incremental updates
   - Parallel detection

2. **Smart Recovery**
   - Minimal impact
   - Cost-based selection
   - State preservation

3. **Prevention Strategies**
   - Resource ordering
   - Timeout mechanisms
   - Resource limits

## Summary

Deadlocks are a serious problem in concurrent systems that can lead to system-wide failures. Understanding the necessary conditions for deadlocks and various prevention, avoidance, detection, and recovery methods is crucial for system design.

Different approaches offer various trade-offs between system performance and deadlock handling. The choice of method depends on the system's requirements and constraints.

Proper deadlock handling is essential for maintaining system reliability and performance.

## References and Further Reading

- Silberschatz, A., Galvin, P. B., & Gagne, G. (2018). *Operating System Concepts* (10th Edition). Wiley.
- Tanenbaum, A. S., & Bos, H. (2014). *Modern Operating Systems* (4th Edition). Pearson.
- Stevens, W. R., & Rago, S. A. (2013). *Advanced Programming in the UNIX Environment* (3rd Edition). Addison-Wesley.
- Bryant, R. E., & O'Hallaron, D. R. (2015). *Computer Systems: A Programmer's Perspective* (3rd Edition). Pearson.
- Love, R. (2013). *Linux System Programming* (2nd Edition). O'Reilly Media. 