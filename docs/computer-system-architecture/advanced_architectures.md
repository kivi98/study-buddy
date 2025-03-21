# Advanced Architectures

**Course:** Computer System Architecture  
**Instructor:** Prof. Dr. Computer Architecture

## Navigation

[Table of Contents](../README.md) | 
[Computer Architecture Fundamentals](computer_architecture_fundamentals.md) | 
[Processor Architecture](processor_architecture.md) | 
[Memory Systems](memory_systems.md) | 
[Input/Output Systems](io_systems.md) | 
[Parallel Processing](parallel_processing.md) | 
**Advanced Architectures**

---

## GPU Architecture

Graphics Processing Units (GPUs) were originally designed for rendering graphics but have evolved into powerful general-purpose computing devices.

### GPU Computing Model

1. **SIMT (Single Instruction, Multiple Threads)**
   - Extension of SIMD that allows threads to execute independently
   - Groups of threads (warps/wavefronts) execute the same instruction
   - Divergent execution paths are serialized

2. **Massive Parallelism**
   - Thousands of simple cores
   - Optimized for throughput rather than latency
   - Designed for data-parallel workloads

### GPU Memory Hierarchy

1. **Global Memory**
   - Accessible by all threads
   - High capacity but higher latency
   - Coalesced access patterns improve efficiency

2. **Shared Memory/L1 Cache**
   - Shared among threads in a block/workgroup
   - Low latency, limited capacity
   - Manually managed in many programming models

3. **Registers**
   - Per-thread private storage
   - Fastest access
   - Limited quantity

### GPU Performance Metrics

1. **Compute Throughput**

$$\text{Theoretical FLOPS} = \text{Cores} \times \text{Clock Speed} \times \text{FLOPs per Cycle per Core}$$

**Formula Explanation:**
- **Theoretical FLOPS**: Maximum floating-point operations per second
- **Cores**: Number of processing elements
- **Clock Speed**: GPU clock frequency
- **FLOPs per Cycle per Core**: Operations each core can perform per cycle
- Modern GPUs can achieve tens of teraFLOPS of theoretical performance

2. **Memory Bandwidth**

$$\text{Memory Bandwidth} = \text{Memory Clock} \times \text{Bus Width} \times \text{Data Rate} / 8$$

**Formula Explanation:**
- **Memory Bandwidth**: Maximum data transfer rate (bytes/second)
- **Memory Clock**: Memory clock frequency (Hz)
- **Bus Width**: Width of the memory interface (bits)
- **Data Rate**: Transfers per clock cycle (e.g., 2 for GDDR5)
- **Division by 8**: Conversion from bits to bytes
- Memory bandwidth is often the limiting factor in GPU performance

3. **Occupancy**

$$\text{Occupancy} = \frac{\text{Active Warps}}{\text{Maximum Warps}}$$

**Formula Explanation:**
- **Occupancy**: Ratio of active warps to maximum possible warps
- **Active Warps**: Number of warps that can be scheduled
- **Maximum Warps**: Hardware limit on warps per compute unit
- Higher occupancy generally leads to better performance by hiding latency

### GPU Programming Models

1. **CUDA (NVIDIA)**
   - C/C++ extension for GPU programming
   - Explicit management of thread hierarchy and memory

2. **OpenCL**
   - Open standard for heterogeneous computing
   - Portable across different hardware platforms

3. **DirectCompute/Compute Shaders**
   - GPU computing through graphics APIs
   - Integrated with rendering pipelines

## Quantum Computing

Quantum computing leverages quantum mechanical phenomena to perform computations that would be impractical on classical computers.

### Quantum Bits (Qubits)

1. **Quantum States**
   - Classical bits: 0 or 1
   - Qubits: Superposition of 0 and 1
   - Represented as: |ψ⟩ = α|0⟩ + β|1⟩

2. **Measurement**
   - Collapses superposition to classical state
   - Probability of measuring |0⟩ is |α|²
   - Probability of measuring |1⟩ is |β|²

3. **Entanglement**
   - Quantum correlation between qubits
   - Measuring one qubit instantly affects entangled qubits
   - Enables quantum parallelism

### Quantum Gates

1. **Single-Qubit Gates**
   - Hadamard (H): Creates superposition
   - Pauli-X: Quantum equivalent of NOT gate
   - Phase shifts: Modify relative phases

2. **Multi-Qubit Gates**
   - CNOT (Controlled-NOT): Flips target qubit if control qubit is |1⟩
   - Toffoli: Controlled-controlled-NOT gate
   - SWAP: Exchanges states of two qubits

### Quantum Algorithms

1. **Shor's Algorithm**
   - Efficiently factors large integers
   - Exponential speedup over classical algorithms
   - Threatens current cryptographic systems

2. **Grover's Algorithm**
   - Searches unsorted databases
   - Quadratic speedup over classical search
   - Finds element in O(√N) instead of O(N)

3. **Quantum Fourier Transform**
   - Quantum version of discrete Fourier transform
   - Exponentially faster than classical FFT
   - Building block for many quantum algorithms

### Quantum Computing Challenges

1. **Decoherence**
   - Loss of quantum information due to environment interaction
   - Limits computation time
   - Requires error correction

2. **Error Correction**
   - Quantum error correction codes
   - Logical qubits encoded across multiple physical qubits
   - Significant overhead required

3. **Quantum Volume**

$$\text{Quantum Volume} = 2^{\min(d, m)}$$

**Formula Explanation:**
- **Quantum Volume**: Metric for quantum computer capability
- **d**: Circuit depth (number of operations before errors dominate)
- **m**: Number of qubits
- Higher quantum volume indicates more powerful quantum computation
- Accounts for both qubit count and quality

## Neuromorphic Computing

Neuromorphic computing aims to mimic the structure and function of the human brain using specialized hardware.

### Neuromorphic Architecture Principles

1. **Spiking Neural Networks (SNNs)**
   - Neurons communicate through discrete spikes
   - Information encoded in spike timing
   - Event-driven computation

2. **Massive Parallelism**
   - Many simple processing elements
   - Distributed memory and computation
   - High connectivity between elements

3. **Local Learning**
   - Synaptic plasticity mechanisms
   - Hebbian learning: "Neurons that fire together, wire together"
   - Spike-timing-dependent plasticity (STDP)

### Neuromorphic Hardware

1. **IBM TrueNorth**
   - 1 million neurons, 256 million synapses
   - Event-driven architecture
   - Low power consumption

2. **Intel Loihi**
   - Learning capabilities on-chip
   - Asynchronous operation
   - Scalable architecture

3. **SpiNNaker**
   - Based on ARM processors
   - Designed for large-scale neural simulations
   - Flexible programming model

### Performance Metrics

1. **Energy Efficiency**

$$\text{Energy per Synaptic Operation} = \frac{\text{Total Energy Consumption}}{\text{Number of Synaptic Operations}}$$

**Formula Explanation:**
- **Energy per Synaptic Operation**: Energy efficiency metric (Joules/op)
- **Total Energy Consumption**: Power consumed during computation
- **Number of Synaptic Operations**: Computational work performed
- Neuromorphic systems aim for efficiency similar to the human brain (~10 fJ/op)

2. **Synaptic Operations Per Second (SOPS)**

$$\text{SOPS} = \text{Neurons} \times \text{Average Synapses per Neuron} \times \text{Average Firing Rate}$$

**Formula Explanation:**
- **SOPS**: Computational throughput
- **Neurons**: Number of neurons in the system
- **Average Synapses per Neuron**: Connectivity density
- **Average Firing Rate**: How frequently neurons activate (Hz)
- SOPS is analogous to FLOPS in conventional computing

## Edge Computing Architecture

Edge computing moves computation closer to data sources, reducing latency and bandwidth requirements.

### Edge Computing Principles

1. **Distributed Processing**
   - Computation spread across network edge
   - Local data processing
   - Reduced dependency on cloud

2. **Heterogeneous Computing**
   - Mix of CPUs, GPUs, FPGAs, ASICs
   - Specialized accelerators for specific tasks
   - Power-performance optimization

3. **Resource Constraints**
   - Limited power budget
   - Restricted memory and storage
   - Variable connectivity

### Edge-Cloud Continuum

1. **Workload Partitioning**
   - Deciding what runs where
   - Balancing local processing vs. cloud offloading

2. **Latency-Driven Design**

$$\text{End-to-End Latency} = T_{processing} + T_{network} + T_{cloud}$$

**Formula Explanation:**
- **End-to-End Latency**: Total time from data acquisition to result
- **T_processing**: Local processing time
- **T_network**: Network transmission time
- **T_cloud**: Cloud processing time
- Edge computing aims to minimize T_network and T_cloud

3. **Energy-Aware Computing**

$$\text{Total Energy} = E_{local} + E_{transmission} + E_{cloud}$$

**Formula Explanation:**
- **Total Energy**: Overall energy consumption
- **E_local**: Energy for local computation
- **E_transmission**: Energy for data transmission
- **E_cloud**: Energy for cloud processing (allocated to the edge device)
- Optimal partitioning minimizes total energy consumption

### Edge AI Architectures

1. **Inference Optimization**
   - Model compression techniques
   - Quantization (reducing precision)
   - Pruning (removing unnecessary connections)

2. **Federated Learning**
   - Distributed model training across edge devices
   - Privacy-preserving (data stays local)
   - Only model updates shared with central server

3. **Tiny ML**
   - Machine learning on microcontrollers
   - Highly optimized for size and power
   - Specialized hardware accelerators

## Domain-Specific Architectures

Domain-Specific Architectures (DSAs) are specialized hardware designs optimized for particular application domains.

### Principles of Domain-Specific Design

1. **Specialization**
   - Hardware tailored to specific algorithms
   - Elimination of unnecessary generality
   - Custom data paths and memory hierarchies

2. **Efficiency Gains**
   - Orders of magnitude improvement in performance/watt
   - Reduced overhead from general-purpose features
   - Optimized for domain-specific data types and operations

3. **Roofline Model**

$$\text{Attainable Performance} = \min(\text{Peak Compute}, \text{Peak Memory BW} \times \text{Arithmetic Intensity})$$

**Formula Explanation:**
- **Attainable Performance**: Maximum achievable performance (FLOPS)
- **Peak Compute**: Maximum computational throughput
- **Peak Memory BW**: Maximum memory bandwidth
- **Arithmetic Intensity**: Computation per byte of memory access
- DSAs aim to shift the roofline upward for specific domains

### AI Accelerators

1. **Tensor Processing Units (TPUs)**
   - Google's custom ASIC for machine learning
   - Systolic array architecture
   - Optimized for matrix multiplications

2. **Neural Processing Units (NPUs)**
   - Specialized for neural network inference
   - Low-precision arithmetic
   - Dataflow architectures

3. **Performance Metrics**

$$\text{Throughput} = \frac{\text{Batch Size} \times \text{Model Size}}{\text{Inference Time}}$$

**Formula Explanation:**
- **Throughput**: Processing capacity (inferences/second)
- **Batch Size**: Number of inputs processed together
- **Model Size**: Complexity of the neural network
- **Inference Time**: Time to complete one forward pass
- AI accelerators optimize for high throughput and low latency

### FPGA-Based Acceleration

1. **Reconfigurable Computing**
   - Hardware adaptable to different algorithms
   - Reprogrammable logic blocks
   - Custom data paths and memory access patterns

2. **High-Level Synthesis (HLS)**
   - Automated translation from high-level code to hardware
   - Reduces design time
   - Enables hardware/software co-design

3. **Performance Efficiency**

$$\text{Performance per Watt} = \frac{\text{Throughput}}{\text{Power Consumption}}$$

**Formula Explanation:**
- **Performance per Watt**: Energy efficiency metric
- **Throughput**: Computational work per unit time
- **Power Consumption**: Energy used per unit time
- FPGAs often achieve better performance/watt than general-purpose processors

## Future Trends

### Post-Moore Computing

1. **3D Integration**
   - Stacking chips vertically
   - Reduced interconnect length
   - Improved memory bandwidth

2. **New Materials and Devices**
   - Carbon nanotubes
   - Spintronics
   - Memristors

3. **Approximate Computing**
   - Trading accuracy for efficiency
   - Exploiting application resilience to errors
   - Probabilistic computing

### Emerging Paradigms

1. **In-Memory Computing**
   - Processing data where it's stored
   - Eliminates memory-processor bottleneck
   - Particularly effective for data-intensive applications

2. **Photonic Computing**
   - Using light instead of electricity
   - Potential for higher bandwidth and lower energy
   - Challenges in integration with electronic systems

3. **Biological Computing**
   - DNA-based storage and computation
   - Molecular computing
   - Self-organizing systems

## Practical Applications

Understanding advanced architectures has practical applications in various fields:

1. **System Design**
   - Selecting appropriate architectures for specific workloads
   - Heterogeneous system integration
   - Performance and power optimization

2. **Software Development**
   - Programming models for specialized hardware
   - Algorithm adaptation for different architectures
   - Performance portability across diverse systems

3. **Research and Innovation**
   - Exploring new computing paradigms
   - Cross-disciplinary approaches
   - Addressing fundamental limitations of current technologies 