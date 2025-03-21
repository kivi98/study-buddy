# Data Communication and Networking Equations

**Course:** Data Communication and Networking  
**Instructor:** Prof. Dr. Networking

## Navigation

[Table of Contents](../README.md) | 
[Data Communication and Networking Home](README.md) | 
[Introduction to Networks](introduction_to_networks.md) | 
[Network Architecture](network_architecture.md) | 
[Digital Transmission](digital_transmission.md) | 
[Multiplexing](multiplexing.md) | 
[Media Access Control](media_access_control.md) | 
[Network Layer](network_layer.md) | 
[Routing Algorithms](routing_algorithms.md) | 
[Data Link Layer](data_link_layer.md) | 
[Error Detection](error_detection.md) | 
[Transport Layer](transport_layer.md) | 
[Application Layer](application_layer.md)

---

## Overview

This document contains a collection of all the important equations used in Data Communication and Networking, organized by topic. Each equation includes an explanation of its variables and significance.

## Digital Transmission

### Nyquist Theorem

For a noiseless channel, the maximum data rate is given by:

$$\text{Maximum Data Rate} = 2B \log_2 L \text{ bits per second}$$

**Formula Explanation:**
- **Maximum Data Rate**: The theoretical upper limit for data transmission rate
- **B**: Bandwidth of the channel in Hertz (Hz)
- **L**: Number of signal levels used to represent data
- This formula shows that we can increase data rate by either increasing bandwidth or using more signal levels

### Shannon Capacity

For a noisy channel, the maximum data rate is given by:

$$C = B \log_2(1 + \text{SNR}) \text{ bits per second}$$

**Formula Explanation:**
- **C**: Channel capacity in bits per second
- **B**: Bandwidth of the channel in Hertz (Hz)
- **SNR**: Signal-to-Noise Ratio (expressed as a power ratio, not in dB)
- This formula defines the theoretical maximum rate at which error-free data can be transmitted over a channel with a specified bandwidth and noise level

### Relationship Between Bit Rate and Baud Rate

$$\text{Bit Rate} = \text{Baud Rate} \times \log_2 L$$

**Formula Explanation:**
- **Bit Rate**: The number of bits transmitted per second
- **Baud Rate**: The number of signal units (symbols) transmitted per second
- **L**: The number of different signal elements or states
- For binary signals where L = 2, the bit rate equals the baud rate

## Multiplexing and Multiple Access

### CDMA Code Generation

In CDMA, each bit is represented by a code sequence of chips. The code sequences must be orthogonal:

$$\sum_{i=1}^{n} c_i \times c_j = 0 \text{ for } i \neq j$$

**Formula Explanation:**
- **c_i, c_j**: Code sequences for users i and j
- **n**: Length of the code sequence
- Orthogonal codes ensure that multiple signals can be transmitted simultaneously without interference

### CDMA Encoding/Decoding

To decode a received CDMA signal:

$$\text{Original data} = \frac{\sum_{i=1}^{n} r_i \times c_k}{n}$$

**Formula Explanation:**
- **r_i**: Received signal at position i
- **c_k**: Code sequence for user k
- **n**: Length of the code sequence
- The result is positive for '1' and negative for '0'

## Media Access Control

### Pure Aloha Efficiency

The maximum channel utilization (throughput) for Pure Aloha is:

$$S = G \times e^{-2G}$$

**Formula Explanation:**
- **S**: Throughput (successful transmissions per frame time)
- **G**: Offered load (attempted transmissions per frame time)
- The maximum throughput is 18.4% when G = 0.5

### Slotted Aloha Efficiency

The maximum channel utilization for Slotted Aloha is:

$$S = G \times e^{-G}$$

**Formula Explanation:**
- **S**: Throughput (successful transmissions per slot time)
- **G**: Offered load (attempted transmissions per slot time)
- The maximum throughput is 36.8% when G = 1

### CSMA/CD Efficiency

The efficiency of CSMA/CD depends on the propagation delay and transmission time:

$$\text{Efficiency} = \frac{1}{1 + 5a}$$

**Formula Explanation:**
- **Efficiency**: The fraction of time used for successful transmission
- **a**: The ratio of propagation time to transmission time
- This shows that CSMA/CD efficiency decreases with increasing network size or decreasing packet size

## Network Layer

### IPv4 Address Space

The number of possible host addresses in a subnet with a given subnet mask is:

$$\text{Number of Host Addresses} = 2^{(32-n)} - 2$$

**Formula Explanation:**
- **n**: The number of bits in the subnet mask (CIDR notation)
- **32-n**: The number of host bits
- **-2**: Subtracting the network address and broadcast address
- For example, a /24 subnet has 2^(32-24) - 2 = 254 usable host addresses

### VLSM (Variable Length Subnet Masking)

The number of subnets created by borrowing bits from the host portion:

$$\text{Number of Subnets} = 2^b$$

**Formula Explanation:**
- **b**: Number of bits borrowed from the host portion
- Each bit borrowed doubles the number of available subnets

## Routing Algorithms

### Bellman-Ford Equation (Distance Vector)

The shortest path cost from node i to j:

$$D_i(j) = \min_k [c(i,k) + D_k(j)]$$

**Formula Explanation:**
- **D_i(j)**: Cost of the least-cost path from node i to node j
- **c(i,k)**: Cost from node i to its neighbor k
- **D_k(j)**: Cost of the least-cost path from node k to node j
- This recursive equation forms the basis of distance vector routing

### Dijkstra's Algorithm (Link State)

For each node v in the graph:

$$d[v] = \min_{u \in Q} (d[u] + c(u,v))$$

**Formula Explanation:**
- **d[v]**: Tentative distance to node v
- **Q**: Set of unvisited nodes
- **c(u,v)**: Cost of edge from u to v
- This equation is applied iteratively to find the shortest path from a source node to all other nodes

## Data Link Layer

### Efficiency of Stop-and-Wait Protocol

For a noiseless channel:

$$\text{Efficiency} = \frac{T_{transmission}}{T_{transmission} + 2 \times T_{propagation}}$$

**Formula Explanation:**
- **Efficiency**: The ratio of useful transmission time to total time
- **T_transmission**: Time to transmit the packet
- **T_propagation**: Propagation delay
- Shows that efficiency decreases with increasing propagation delay relative to transmission time

### Window Size for Maximum Efficiency

For a sliding window protocol:

$$\text{Optimal Window Size} = 2 \times a + 1$$

**Formula Explanation:**
- **Optimal Window Size**: Number of frames that should be sent without waiting for acknowledgment
- **a**: The ratio of propagation time to transmission time
- This ensures that the sender never has to wait for acknowledgments

## Error Detection and Correction

### Hamming Distance

The Hamming distance between two bit strings:

$$d(x,y) = \sum_{i=1}^{n} |x_i - y_i|$$

**Formula Explanation:**
- **d(x,y)**: Hamming distance between bit strings x and y
- **x_i, y_i**: The i-th bits of x and y
- **n**: Length of the bit strings
- Counts the number of positions at which the bits differ

### Error Detection Capability

For a code with Hamming distance d:

$$\text{Number of Detectable Errors} = d - 1$$

**Formula Explanation:**
- **d**: Hamming distance of the code
- A code with Hamming distance d can detect up to d-1 bit errors

### Error Correction Capability

For a code with Hamming distance d:

$$\text{Number of Correctable Errors} = \lfloor \frac{d-1}{2} \rfloor$$

**Formula Explanation:**
- **d**: Hamming distance of the code
- **⌊ ⌋**: Floor function (rounds down to the nearest integer)
- A code with Hamming distance d can correct up to ⌊(d-1)/2⌋ bit errors

### CRC Remainder Calculation

The remainder when dividing the message polynomial by the generator polynomial:

$$R(x) = M(x) \cdot x^r \bmod G(x)$$

**Formula Explanation:**
- **R(x)**: Remainder polynomial (CRC value)
- **M(x)**: Message polynomial
- **G(x)**: Generator polynomial
- **r**: Degree of the generator polynomial
- This remainder is appended to the message to create the transmitted codeword

## Transport Layer

### TCP Throughput

The throughput of a TCP connection is limited by:

$$\text{TCP Throughput} \leq \frac{\text{Window Size}}{\text{RTT}}$$

**Formula Explanation:**
- **TCP Throughput**: Data rate in bytes per second
- **Window Size**: TCP window size in bytes
- **RTT**: Round Trip Time in seconds
- Shows that throughput decreases with increasing RTT

### TCP Congestion Window (CWND) - Slow Start

During slow start, CWND grows exponentially:

$$\text{CWND} = \text{CWND} + \text{MSS}$$

**Formula Explanation:**
- **CWND**: Congestion Window in bytes
- **MSS**: Maximum Segment Size in bytes
- This is applied for each ACK received, effectively doubling CWND every RTT

### TCP Congestion Window - Congestion Avoidance

During congestion avoidance, CWND grows linearly:

$$\text{CWND} = \text{CWND} + \text{MSS} \times \frac{\text{MSS}}{\text{CWND}}$$

**Formula Explanation:**
- **CWND**: Congestion Window in bytes
- **MSS**: Maximum Segment Size in bytes
- This results in CWND increasing by approximately one MSS per RTT

### Exponential Weighted Moving Average for RTT

TCP's RTT estimation uses:

$$\text{SRTT}_{\text{new}} = (1 - \alpha) \times \text{SRTT}_{\text{old}} + \alpha \times \text{RTT}_{\text{sample}}$$

**Formula Explanation:**
- **SRTT_new**: New smoothed round trip time estimate
- **SRTT_old**: Previous smoothed round trip time estimate
- **RTT_sample**: Measured round trip time for a segment
- **α**: Weighting factor (typically 0.125)
- This formula gives more weight to the established estimate than to new measurements 