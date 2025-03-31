# Synchronization Tools

[Back to Course Content](README.md) | [Previous: CPU Scheduling](cpu-scheduling.md) | [Next: Deadlocks →](deadlocks.md)

## What is Synchronization?

Synchronization is the coordination of multiple processes or threads to ensure correct execution and prevent race conditions. It is essential for maintaining data consistency in concurrent systems.

```mermaid
graph TD
    A[Process 1] -->|Access| B[Shared Resource]
    C[Process 2] -->|Access| B
    D[Synchronization] -->|Control| B
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
```

## Critical Section Problem

### Critical Section

```mermaid
graph TD
    A[Entry Section] -->|Enter| B[Critical Section]
    B -->|Exit| C[Remainder Section]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

### Requirements

1. **Mutual Exclusion**
   - Only one process can be in critical section
   - No other process can enter while one is inside

2. **Progress**
   - If no process is in critical section
   - Some process must be able to enter

3. **Bounded Waiting**
   - Process must wait finite time to enter
   - No infinite waiting

## Synchronization Hardware

### Test and Set

```mermaid
graph TD
    A[Test and Set] -->|Atomic| B[Lock Variable]
    B -->|True| C[Already Locked]
    B -->|False| D[Not Locked]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
```

### Compare and Swap

```mermaid
graph TD
    A[Compare and Swap] -->|Atomic| B[Expected Value]
    B -->|Match| C[Update Value]
    B -->|No Match| D[Return Old Value]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
```

## Semaphores

### Binary Semaphore

```mermaid
graph TD
    A[Binary Semaphore] -->|Value 0| B[Locked]
    A -->|Value 1| C[Unlocked]
    
    B -->|Wait| D[Blocked]
    C -->|Signal| E[Unblocked]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
```

### Counting Semaphore

```mermaid
graph TD
    A[Counting Semaphore] -->|N Resources| B[Available]
    B -->|Wait| C[Decrement]
    B -->|Signal| D[Increment]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
```

### Implementation

```c
// Semaphore structure
struct semaphore {
    int value;
    struct process *queue;
};

// Wait operation
void wait(semaphore *S) {
    S->value--;
    if (S->value < 0) {
        // Add process to queue
        // Block process
    }
}

// Signal operation
void signal(semaphore *S) {
    S->value++;
    if (S->value <= 0) {
        // Remove process from queue
        // Wake up process
    }
}
```

## Monitors

### Monitor Structure

```mermaid
classDiagram
    class Monitor {
        +shared variables
        +procedures
        +initialization code
        +mutex
        +condition variables
        +enter()
        +exit()
        +wait()
        +signal()
    }
    
    class Condition {
        +queue
        +wait()
        +signal()
    }
    
    Monitor --> Condition
```

### Monitor Implementation

```c
// Monitor structure
struct monitor {
    mutex_t mutex;
    condition_t *conditions;
    // Shared variables
};

// Enter monitor
void enter(monitor *M) {
    mutex_lock(&M->mutex);
}

// Exit monitor
void exit(monitor *M) {
    mutex_unlock(&M->mutex);
}

// Wait on condition
void wait(monitor *M, condition_t *C) {
    // Add to condition queue
    exit(M);
    // Block process
    enter(M);
}

// Signal condition
void signal(monitor *M, condition_t *C) {
    if (!empty(C->queue)) {
        // Wake up process
    }
}
```

## Synchronization Examples

### Producer-Consumer Problem

```mermaid
graph TD
    A[Producer] -->|Produce| B[Buffer]
    B -->|Consume| C[Consumer]
    
    D[Empty Semaphore] -->|Control| B
    E[Full Semaphore] -->|Control| B
    F[Mutex] -->|Protect| B
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
```

### Readers-Writers Problem

```mermaid
graph TD
    A[Readers] -->|Read| B[Shared Resource]
    C[Writers] -->|Write| B
    
    D[Read Count] -->|Track| B
    E[Write Lock] -->|Protect| B
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
```

## Real-World Applications

### Database Transaction Management

```mermaid
graph TD
    A[Transaction 1] -->|Read/Write| B[Database]
    C[Transaction 2] -->|Read/Write| B
    
    D[Lock Manager] -->|Control| B
    E[Deadlock Detector] -->|Monitor| D
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
```

### Web Server Request Handling

```mermaid
graph TD
    A[Client 1] -->|Request| B[Web Server]
    C[Client 2] -->|Request| B
    
    D[Connection Pool] -->|Manage| B
    E[Request Queue] -->|Buffer| B
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
```

## Performance Considerations

### Synchronization Overhead

```mermaid
graph LR
    A[Lock Acquisition] -->|Time| B[Context Switch]
    B -->|Time| C[Lock Release]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

### Optimization Techniques

1. **Fine-grained Locking**
   - Lock smaller data structures
   - Reduce contention
   - Increase concurrency

2. **Lock-free Algorithms**
   - Atomic operations
   - No blocking
   - Better scalability

3. **Read-Write Locks**
   - Multiple readers
   - Single writer
   - Better for read-heavy workloads

## Summary

Synchronization is crucial for maintaining data consistency in concurrent systems. Various tools and mechanisms, such as semaphores and monitors, help coordinate access to shared resources.

The critical section problem illustrates the fundamental challenges of synchronization, and different solutions offer various trade-offs between complexity, performance, and correctness.

Understanding synchronization is essential for developing correct and efficient concurrent applications.

## References and Further Reading

- Silberschatz, A., Galvin, P. B., & Gagne, G. (2018). *Operating System Concepts* (10th Edition). Wiley.
- Tanenbaum, A. S., & Bos, H. (2014). *Modern Operating Systems* (4th Edition). Pearson.
- Stevens, W. R., & Rago, S. A. (2013). *Advanced Programming in the UNIX Environment* (3rd Edition). Addison-Wesley.
- Bryant, R. E., & O'Hallaron, D. R. (2015). *Computer Systems: A Programmer's Perspective* (3rd Edition). Pearson.
- Love, R. (2013). *Linux System Programming* (2nd Edition). O'Reilly Media. 