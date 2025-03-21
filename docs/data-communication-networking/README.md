# Data Communication and Networking - Course Notes

**Course:** Data Communication and Networking  
**Instructor:** Prof. Dr. Networking

## Table of Contents

### 1. [Introduction to Networks](introduction_to_networks.md)
- History of Computer Networks (ARPANET, NSFNET, TELENET)
- Applications and Benefits of Computer Networks
- Disadvantages of Computer Networking
- Telephone Networks and GSM
- Types of Networks (WAN, MAN, CAN, LAN, WLAN, PAN, BAN, SAN, POLAN, EPN, VPN)
- Network Communication Modes (Half Duplex vs Full Duplex)

### 2. [Network Architecture and Transmission Media](network_architecture.md)
- Packet-Switched Networks (Datagram, Virtual Circuit)
- Circuit Switching Networks
- Guided Transmission Media (Coax, Twisted Pair, Fiber Optics)
- Unguided Transmission Media (Radio, Microwave, Satellite)
- Electromagnetic Spectrum and Its Applications
- Media Comparison and Selection
- Connectors and Standards

### 3. [Digital Transmission Fundamentals](digital_transmission.md)
- Periodic and Aperiodic Signals
- Bandwidth-Limited Signals
- Baseband vs Broadband
- Transmission and Reception Flow
- Modems and Modulation Techniques
- Encoding Techniques (Manchester, NRZ)
- Baud Rate vs Bit Rate
- Channel Capacity and Data Rates
- Maximum Data Rate of a Channel

### 4. [Multiplexing and Multiple Access](multiplexing.md)
- Frequency Division Multiplexing (FDM)
- Time Division Multiplexing (TDM)
- FDMA, TDMA, CDMA
- Code Division Multiple Access Techniques
- Phase-Shift Keying (PSK)
- Wavelength Division Multiple Access
- Space Division Multiple Access
- Comparison of Multiplexing Techniques

### 5. [Media Access Control](media_access_control.md)
- Pure Aloha and Slotted Aloha
- Contention-Based Network Access
- Carrier Sense Multiple Access (CSMA)
- CSMA/CD (Collision Detection)
- Collision Detection in Wired vs Wireless Networks
- "Taking Turns" MAC Protocols
- Hidden Node Problem
- Exposed Terminal Problem
- RTS/CTS Mechanism
- Comparison of MAC Protocols

### 6. [Network Layer and Routing](network_layer.md)
- IP Addressing Fundamentals
- Dotted Decimal Notation
- Network Prefix and Host Number
- Classful IP Addressing
- Subnetting and Subnet Masks
- Variable-Length Subnetting
- CIDR - Classless Interdomain Routing
- Supernetting
- Routing Concepts and Protocols
- Routing Metrics and Design Goals

### 7. [Routing Algorithms](routing_algorithms.md)
- Global vs Decentralized Routing
- Static vs Dynamic Routing
- Adaptive vs Non-Adaptive Routing
- Distance Vector Routing (Bellman-Ford Algorithm)
- Count to Infinity Problem
- Link State Routing (Dijkstra's Algorithm)
- Hierarchical Routing
- Flooding
- Internet Control Protocols (RIP, OSPF, IGRP, EGP, BGP)

### 8. [Data Link Layer](data_link_layer.md)
- Layer 2 Addressing
- Packet and Frame Concepts
- Framing Methods
- Character-Oriented Protocols
- Byte Count Framing
- Byte Stuffing and Unstuffing
- Error and Flow Control
- Simplex Protocol Design
- Stop-and-Wait Protocol
- Automatic Repeat Request (ARQ)
- Sliding Window Protocols (One-bit, Go-Back-N, Selective Repeat)

### 9. [Error Detection and Correction](error_detection.md)
- Error Detection Codes
- Vertical Redundancy Check (VRC)
- Parity Bit
- Checksum
- Cyclic Redundancy Checks (CRCs)
- CRC Generator Polynomials
- Hamming Code
- Error Correction Techniques

### 10. [Transport Layer](transport_layer.md)
- Relationship of Layers and Addresses in TCP/IP
- Multiplexing and Demultiplexing
- Sockets
- Connection-Oriented vs Connectionless Services
- TCP and UDP Segment Format
- TCP Flow Control
- TCP Congestion Control
- TCP Three-Way Handshake
- TCP Connection Termination (Four-Way Handshake)
- TCP Retransmission
- RTT Estimation
- QUIC Protocol

### 11. [Application Layer](application_layer.md)
- Client-Server Architecture
- Peer-to-Peer Architecture
- HTTP Protocol
- HTTPS and Security
- HTTP Request and Response Messages
- HTTP Response Status Codes
- DNS Services and Architecture
- DNS Name Resolution
- URL Resolution Process
- ARP Protocol
- ICMP and PING
- DHCP and the DORA Process
- MAC Address Learning

## Getting Started

For an introduction to using these notes, see the [Getting Started Guide](../getting_started.md).

## How to Use These Notes

1. Start with the fundamentals in [Introduction to Networks](introduction_to_networks.md) if you're new to data communications and networking
2. Each topic builds on previous concepts, so it's recommended to follow the order of the table of contents
3. Use the links to navigate directly to specific topics of interest
4. Refer to the original lecture notes for more detailed explanations
5. For quick reference to all mathematical formulas, see the [Equations](equations.md) page

## Additional Resources

- "Computer Networks" by Andrew S. Tanenbaum and David J. Wetherall
- "Data Communications and Networking" by Behrouz A. Forouzan
- "Computer Networking: A Top-Down Approach" by James F. Kurose and Keith W. Ross
- RFC Documents: https://www.ietf.org/standards/rfcs/ 