# Threads and Concurrency

[Back to Course Content](README.md) | [Previous: Processes](processes.md) | [Next: CPU Scheduling →](cpu-scheduling.md)

## What is a Thread?

A thread is a basic unit of CPU utilization within a process. It consists of a thread ID, program counter, register set, and stack. Multiple threads within the same process share code section, data section, and other OS resources.

```mermaid
graph TD
    A[Process] --> B[Code Section]
    A --> C[Data Section]
    A --> D[OS Resources]
    A --> E[Thread 1]
    A --> F[Thread 2]
    A --> G[Thread N]
    
    E --> H[Thread ID]
    E --> I[Program Counter]
    E --> J[Register Set]
    E --> K[Stack]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
    style H fill:#fdd,stroke:#333
    style I fill:#dfd,stroke:#333
    style J fill:#fdb,stroke:#333
    style K fill:#fdd,stroke:#333
```

## Thread Models

### User Threads

```mermaid
graph TD
    A[User Space] --> B[User Thread Library]
    B --> C[Thread 1]
    B --> D[Thread 2]
    B --> E[Thread N]
    
    C --> F[Kernel Space]
    D --> F
    E --> F
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
```

**Advantages:**
- Fast creation and switching
- No kernel intervention
- Custom scheduling algorithms

**Disadvantages:**
- Blocking system calls block all threads
- No parallel execution on multiprocessors
- Limited by kernel thread support

### Kernel Threads

```mermaid
graph TD
    A[User Space] --> B[Application]
    B --> C[Kernel Space]
    C --> D[Kernel Thread 1]
    C --> E[Kernel Thread 2]
    C --> F[Kernel Thread N]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
```

**Advantages:**
- True parallel execution
- Better for CPU-intensive tasks
- System calls don't block other threads

**Disadvantages:**
- Slower creation and switching
- More overhead
- Limited by kernel resources

### Hybrid Threading

```mermaid
graph TD
    A[User Space] --> B[User Thread Library]
    B --> C[User Thread 1]
    B --> D[User Thread 2]
    B --> E[User Thread N]
    
    C --> F[Kernel Space]
    D --> F
    E --> F
    
    F --> G[Kernel Thread 1]
    F --> H[Kernel Thread 2]
    F --> I[Kernel Thread M]
    
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

## Thread Libraries

### POSIX Threads (pthreads)

```c
// Thread creation
pthread_t thread;
pthread_create(&thread, NULL, thread_function, arg);

// Thread synchronization
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond = PTHREAD_COND_INITIALIZER;

// Thread joining
pthread_join(thread, &result);
```

### Windows Threads

```c
// Thread creation
HANDLE thread = CreateThread(NULL, 0, thread_function, arg, 0, &thread_id);

// Thread synchronization
CRITICAL_SECTION cs;
InitializeCriticalSection(&cs);

// Thread joining
WaitForSingleObject(thread, INFINITE);
```

## Thread States

```mermaid
stateDiagram-v2
    [*] --> New
    New --> Ready: Start
    Ready --> Running: Schedule
    Running --> Ready: Time slice
    Running --> Blocked: I/O
    Blocked --> Ready: I/O complete
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
    
    state Blocked {
        [*] --> WaitingForI/O
    }
```

## Thread Synchronization

### Critical Section Problem

```mermaid
graph TD
    A[Thread 1] -->|Enter| B[Critical Section]
    B -->|Exit| C[Thread 1]
    D[Thread 2] -->|Enter| B
    B -->|Exit| E[Thread 2]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
```

### Mutex Locks

```c
// Mutex operations
pthread_mutex_lock(&mutex);
// Critical section
pthread_mutex_unlock(&mutex);
```

### Semaphores

```c
// Binary semaphore
sem_t sem;
sem_init(&sem, 0, 1);
sem_wait(&sem);
// Critical section
sem_post(&sem);
```

### Monitors

```mermaid
classDiagram
    class Monitor {
        +mutex
        +condition_variables
        +shared_data
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

## Thread Pool

```mermaid
graph TD
    A[Task Queue] -->|Get Task| B[Thread Pool]
    B --> C[Worker Thread 1]
    B --> D[Worker Thread 2]
    B --> E[Worker Thread N]
    
    C -->|Execute| F[Task 1]
    D -->|Execute| G[Task 2]
    E -->|Execute| H[Task N]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
    style H fill:#fdd,stroke:#333
```

## Real-World Applications

### Web Server Thread Model

```mermaid
graph TD
    A[Main Thread] -->|Accept| B[Connection Thread Pool]
    B --> C[Request Handler 1]
    B --> D[Request Handler 2]
    B --> E[Request Handler N]
    
    C -->|Process| F[Client 1]
    D -->|Process| G[Client 2]
    E -->|Process| H[Client N]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
    style E fill:#fdd,stroke:#333
    style F fill:#dfd,stroke:#333
    style G fill:#fdb,stroke:#333
    style H fill:#fdd,stroke:#333
```

### Database System Thread Model

```mermaid
graph TD
    A[Main Thread] -->|Query| B[Query Thread Pool]
    A -->|Transaction| C[Transaction Thread Pool]
    A -->|I/O| D[I/O Thread Pool]
    
    B -->|Execute| E[Query 1]
    B -->|Execute| F[Query 2]
    C -->|Process| G[Transaction 1]
    D -->|Handle| H[I/O Request 1]
    
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

### Thread Overhead

```mermaid
graph LR
    A[Thread Creation] -->|Time| B[Context Switch]
    B -->|Time| C[Synchronization]
    C -->|Time| D[Resource Management]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#dfd,stroke:#333
    style D fill:#fdb,stroke:#333
```

**Factors Affecting Performance:**
1. Thread creation and destruction overhead
2. Context switching overhead
3. Synchronization overhead
4. Resource contention
5. Cache effects

### Optimization Techniques

1. **Thread Pooling**
   - Pre-create threads
   - Reuse existing threads
   - Reduce creation overhead

2. **Efficient Synchronization**
   - Use appropriate synchronization primitives
   - Minimize critical section size
   - Avoid unnecessary synchronization

3. **Resource Management**
   - Proper thread cleanup
   - Resource limits
   - Memory management

## Summary

Threads provide a way to achieve concurrency within a process. They share the process's resources but have their own execution context. Different thread models (user, kernel, and hybrid) offer various trade-offs between performance and functionality.

Thread synchronization is crucial for correct concurrent execution, and various mechanisms (mutexes, semaphores, monitors) are available to ensure thread safety. Thread pools provide an efficient way to manage multiple threads for handling multiple tasks.

Understanding threads and concurrency is essential for developing efficient and correct concurrent applications.

## References and Further Reading

- Silberschatz, A., Galvin, P. B., & Gagne, G. (2018). *Operating System Concepts* (10th Edition). Wiley.
- Tanenbaum, A. S., & Bos, H. (2014). *Modern Operating Systems* (4th Edition). Pearson.
- Stevens, W. R., & Rago, S. A. (2013). *Advanced Programming in the UNIX Environment* (3rd Edition). Addison-Wesley.
- Bryant, R. E., & O'Hallaron, D. R. (2015). *Computer Systems: A Programmer's Perspective* (3rd Edition). Pearson.
- Love, R. (2013). *Linux System Programming* (2nd Edition). O'Reilly Media. 