# Processes

[Back to Course Content](README.md) | [Previous: OS Services](os-services.md) | [Next: Threads and Concurrency →](threads-concurrency.md)

## What is a Process?

A process is a program in execution. It includes the program code, current activity (program counter, stack, data section, heap), and associated resources.

```mermaid
graph TD
    A[Program] -->|Load into Memory| B[Process]
    B --> C[Text Section]
    B --> D[Data Section]
    B --> E[Heap]
    B --> F[Stack]
    B --> G[Program Counter]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
```

## Process Components

### Memory Layout

```mermaid
graph TD
    subgraph "Process Memory"
        direction TB
        Stack[Stack<br>↓ Growing]
        Free[Free Memory]
        Heap[Heap<br>↑ Growing]
        Data[Data Section]
        Text[Text Section]
    end
    
    style Stack fill:#f9f,stroke:#333
    style Free fill:#fff,stroke:#333
    style Heap fill:#bbf,stroke:#333
    style Data fill:#dfd,stroke:#333
    style Text fill:#fdb,stroke:#333
```

### Process Control Block (PCB)

```mermaid
classDiagram
    class PCB {
        +int process_id
        +int priority
        +ProcessState state
        +int program_counter
        +int[] registers
        +int[] memory_limits
        +List~FileDescriptor~ open_files
        +Process parent
        +List~Process~ children
    }
    
    class ProcessState {
        <<enumeration>>
        NEW
        READY
        RUNNING
        WAITING
        TERMINATED
    }
    
    class FileDescriptor {
        +int fd
        +File file
        +int mode
    }
    
    PCB --> ProcessState
    PCB --> FileDescriptor
```

## Process States

### State Diagram

```mermaid
stateDiagram-v2
    [*] --> New
    New --> Ready: Admit
    Ready --> Running: Dispatch
    Running --> Ready: Time slice expired
    Running --> Waiting: I/O request
    Waiting --> Ready: I/O completion
    Running --> Terminated: Exit
    Terminated --> [*]
    
    state New {
        [*] --> Created
    }
    
    state Ready {
        [*] --> WaitingForCPU
    }
    
    state Running {
        [*] --> Executing
    }
    
    state Waiting {
        [*] --> Blocked
    }
```

### State Transitions

| From State | To State | Trigger |
|------------|----------|---------|
| New | Ready | Process admitted |
| Ready | Running | CPU allocated |
| Running | Ready | Time slice expired |
| Running | Waiting | I/O request |
| Waiting | Ready | I/O completion |
| Running | Terminated | Process completion |

## Process Operations

### Process Creation

```mermaid
sequenceDiagram
    participant Parent as Parent Process
    participant OS as Operating System
    participant Child as Child Process
    
    Parent->>OS: fork() system call
    OS->>OS: Create new PCB
    OS->>OS: Copy parent's address space
    OS->>Child: Initialize new process
    OS-->>Parent: Return child PID
    OS-->>Child: Return 0
```

### Process Termination

```mermaid
sequenceDiagram
    participant Process as Process
    participant OS as Operating System
    participant Parent as Parent Process
    
    Process->>OS: exit() system call
    OS->>OS: Release resources
    OS->>Parent: Send SIGCHLD
    OS->>OS: Remove PCB
```

## Interprocess Communication (IPC)

### IPC Models

```mermaid
mindmap
  root((IPC Models))
    Shared Memory
      Memory segment
      Memory mapping
      Shared variables
    Message Passing
      Direct communication
      Indirect communication
      Synchronous/Asynchronous
    Pipe
      Named pipe
      Anonymous pipe
      Bidirectional pipe
    Socket
      Network socket
      Unix domain socket
      Raw socket
```

### Shared Memory

```mermaid
graph TD
    A[Process A] -->|Shared Memory Segment| B[Process B]
    A -->|Read/Write| C[Shared Memory]
    B -->|Read/Write| C
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

**Example:**
```c
// Process A
int *shared_mem = mmap(NULL, size, PROT_READ|PROT_WRITE, 
                      MAP_SHARED|MAP_ANONYMOUS, -1, 0);
*shared_mem = 42;

// Process B
int *shared_mem = mmap(NULL, size, PROT_READ|PROT_WRITE, 
                      MAP_SHARED|MAP_ANONYMOUS, -1, 0);
printf("Value: %d\n", *shared_mem);
```

### Message Passing

```mermaid
graph TD
    A[Process A] -->|Send Message| B[Message Queue]
    B -->|Receive Message| C[Process B]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
```

**Example:**
```c
// Process A
struct msgbuf msg;
msg.mtype = 1;
strcpy(msg.mtext, "Hello");
msgsnd(msgid, &msg, sizeof(msg), 0);

// Process B
struct msgbuf msg;
msgrcv(msgid, &msg, sizeof(msg), 1, 0);
printf("Received: %s\n", msg.mtext);
```

## Process Scheduling

### Scheduling Queues

```mermaid
graph TD
    A[Job Queue] -->|Admit| B[Ready Queue]
    B -->|Dispatch| C[CPU]
    C -->|Time Slice| B
    C -->|I/O Request| D[I/O Queue]
    D -->|I/O Completion| B
    C -->|Completion| E[Terminated]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
```

### Context Switching

```mermaid
sequenceDiagram
    participant P1 as Process 1
    participant OS as Operating System
    participant P2 as Process 2
    
    P1->>OS: System call or interrupt
    OS->>OS: Save P1's context
    OS->>OS: Load P2's context
    OS->>P2: Resume execution
```

## Real-World Applications

### Web Server Process Model

```mermaid
graph TD
    A[Main Server Process] -->|Fork| B[Worker Process 1]
    A -->|Fork| C[Worker Process 2]
    A -->|Fork| D[Worker Process N]
    
    B -->|Handle Request| E[Client 1]
    C -->|Handle Request| F[Client 2]
    D -->|Handle Request| G[Client N]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
```

### Database System Process Model

```mermaid
graph TD
    A[Main DB Process] -->|Fork| B[Query Processor]
    A -->|Fork| C[Buffer Manager]
    A -->|Fork| D[Log Manager]
    A -->|Fork| E[Lock Manager]
    
    B -->|Query| F[Client 1]
    B -->|Query| G[Client 2]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
```

## Performance Considerations

### Process Overhead

```mermaid
graph LR
    A[Process Creation] -->|Time| B[Context Switch]
    B -->|Time| C[Resource Management]
    C -->|Time| D[Communication]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
```

**Factors Affecting Performance:**
1. Process creation time
2. Context switching overhead
3. Memory usage
4. IPC overhead
5. Resource contention

### Optimization Techniques

1. **Process Pooling**
   - Pre-create processes
   - Reuse existing processes
   - Reduce creation overhead

2. **Efficient IPC**
   - Use appropriate IPC method
   - Minimize data copying
   - Batch operations

3. **Resource Management**
   - Proper cleanup
   - Resource limits
   - Memory mapping

## Summary

A process is a program in execution, consisting of program code, data, and resources. The operating system manages processes through the Process Control Block (PCB) and various scheduling queues.

Processes can be in different states (New, Ready, Running, Waiting, Terminated) and transition between these states based on various events. Interprocess communication can be achieved through shared memory, message passing, pipes, or sockets.

Understanding process management is crucial for system programming and application development, as it forms the foundation of concurrent program execution.

## References and Further Reading

- Silberschatz, A., Galvin, P. B., & Gagne, G. (2018). *Operating System Concepts* (10th Edition). Wiley.
- Tanenbaum, A. S., & Bos, H. (2014). *Modern Operating Systems* (4th Edition). Pearson.
- Stevens, W. R., & Rago, S. A. (2013). *Advanced Programming in the UNIX Environment* (3rd Edition). Addison-Wesley.
- Bryant, R. E., & O'Hallaron, D. R. (2015). *Computer Systems: A Programmer's Perspective* (3rd Edition). Pearson.
- Love, R. (2013). *Linux System Programming* (2nd Edition). O'Reilly Media. 