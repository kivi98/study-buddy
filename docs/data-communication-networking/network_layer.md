# Network Layer

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
**Network Layer** | 
[Routing Algorithms](routing_algorithms.md) | 
[Data Link Layer](data_link_layer.md) | 
[Error Detection](error_detection.md) | 
[Transport Layer](transport_layer.md) | 
[Application Layer](application_layer.md) | 
[Equations](equations.md)

---

## Introduction to the Network Layer

### What is the Network Layer?

**What it is:** The third layer in the OSI model and the Internet Protocol (IP) layer in TCP/IP, responsible for packet forwarding, routing, and addressing.

**Key responsibilities:**
1. Logical addressing
2. Routing (path determination)
3. Packet forwarding
4. Fragmentation and reassembly
5. Error handling and diagnostics
6. Traffic control

**Position in network stack:**
```
┌─────────────────┐
│ Application     │  Layer 7 - HTTP, FTP, SMTP, DNS
├─────────────────┤
│ Presentation    │  Layer 6 - TLS/SSL, JPEG, MPEG
├─────────────────┤
│ Session         │  Layer 5 - NetBIOS, RPC
├─────────────────┤
│ Transport       │  Layer 4 - TCP, UDP, SCTP
├─────────────────┤
│ Network         │  Layer 3 - IP, ICMP, OSPF  ← Network Layer
├─────────────────┤
│ Data Link       │  Layer 2 - Ethernet, Wi-Fi, PPP
├─────────────────┤
│ Physical        │  Layer 1 - Cables, Switches, NIC
└─────────────────┘
```

**Network layer protocols:**
- Internet Protocol (IP) - Primary protocol
- Internet Control Message Protocol (ICMP) - Error reporting and diagnostics
- Internet Group Management Protocol (IGMP) - Multicast group management
- Address Resolution Protocol (ARP) - Maps IP addresses to MAC addresses
- Routing protocols (OSPF, RIP, BGP) - Exchange routing information

**Network layer services:**
1. **Connectionless service:** Packets are routed independently (IP)
2. **Connection-oriented service:** Virtual circuits are established (ATM, Frame Relay)

## IP Addressing

### IPv4 Addressing

**What it is:** A 32-bit numerical label assigned to devices in an IP network.

**Notation:**
- Dotted-decimal notation (e.g., 192.168.1.1)
- Four 8-bit octets (values 0-255) separated by periods
- Total of 2^32 (approximately 4.3 billion) possible addresses

**IPv4 address classes:**

| Class | First Bits | First Octet Range | Default Subnet Mask | Purpose |
|-------|------------|-------------------|---------------------|---------|
| A | 0 | 0-127 | 255.0.0.0 (/8) | Large networks |
| B | 10 | 128-191 | 255.255.0.0 (/16) | Medium networks |
| C | 110 | 192-223 | 255.255.255.0 (/24) | Small networks |
| D | 1110 | 224-239 | N/A | Multicast |
| E | 1111 | 240-255 | N/A | Reserved |

**Special IPv4 addresses:**
- **0.0.0.0:** Default network or unknown host
- **127.0.0.1:** Loopback address (localhost)
- **255.255.255.255:** Limited broadcast
- **169.254.0.0/16:** Link-local addresses (APIPA)
- **10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16:** Private address ranges

### IPv6 Addressing

**What it is:** A 128-bit numerical label that supersedes IPv4 to address the exhaustion problem and provide additional features.

**Notation:**
- Eight groups of four hexadecimal digits separated by colons (e.g., 2001:0db8:85a3:0000:0000:8a2e:0370:7334)
- Leading zeros in a group can be omitted
- One or more consecutive groups of zeros can be replaced with a double colon (::) once in an address
- Simplified example: 2001:db8:85a3::8a2e:370:7334

**Key features:**
- Vast address space: 2^128 addresses (approximately 340 undecillion)
- No need for Network Address Translation (NAT)
- Built-in support for security (IPsec)
- Simplified header format for efficient routing
- Autoconfiguration capabilities
- Better multicast support
- No broadcast addresses (replaced by multicast)

**Types of IPv6 addresses:**
1. **Unicast:** Identifies a single interface
   - Global Unicast (similar to public IPv4): 2000::/3
   - Link-Local (auto-configured): fe80::/10
   - Unique Local (similar to private IPv4): fc00::/7
2. **Multicast:** Identifies a group of interfaces: ff00::/8
3. **Anycast:** Delivered to the nearest of a group of interfaces

**Special IPv6 addresses:**
- **::/128:** Unspecified address
- **::1/128:** Loopback address
- **ff02::1:** All nodes on the local network
- **ff02::2:** All routers on the local network

**IPv4 to IPv6 transition mechanisms:**
- **Dual Stack:** Running both IPv4 and IPv6 simultaneously
- **Tunneling:** Encapsulating IPv6 packets within IPv4 packets
- **Translation:** Converting between IPv4 and IPv6 addresses (NAT64, DNS64)

## Subnetting and CIDR

### Subnetting

**What it is:** The process of dividing a large network into smaller, more manageable subnetworks.

**Why it's needed:**
- Reduces network traffic by containing broadcast domains
- Improves security by isolating network segments
- Simplifies management and troubleshooting
- Addresses can be assigned more efficiently

**How it works:**
1. Borrow bits from the host portion of an IP address
2. Use these bits to create subnet identifiers
3. Each subnet has its own network ID and broadcast address
4. Subnets are separated by routers

**Example - Subnetting a Class C network:**
```
Original network: 192.168.1.0/24
Subnet mask: 255.255.255.0

To create 4 subnets, borrow 2 bits from host portion:
New subnet mask: 255.255.255.192 or /26

Resulting subnets:
Subnet 1: 192.168.1.0/26   (Hosts: 192.168.1.1 - 192.168.1.62)
Subnet 2: 192.168.1.64/26  (Hosts: 192.168.1.65 - 192.168.1.126)
Subnet 3: 192.168.1.128/26 (Hosts: 192.168.1.129 - 192.168.1.190)
Subnet 4: 192.168.1.192/26 (Hosts: 192.168.1.193 - 192.168.1.254)
```

**Subnet calculations:**
- Number of subnets = 2^n (where n is the number of bits borrowed)
- Number of hosts per subnet = 2^m - 2 (where m is remaining host bits, subtract 2 for network and broadcast addresses)

### Classless Inter-Domain Routing (CIDR)

**What it is:** A method for IP address allocation that replaces the traditional class-based addressing system.

**CIDR notation:**
- An IP address followed by a slash and a number indicating network prefix length
- Example: 192.168.1.0/24 (24 bits for network, 8 bits for hosts)

**Key features:**
- Eliminates the concept of address classes (A, B, C)
- Allows for more flexible address allocation
- Enables route aggregation (supernetting) for efficient routing
- Helps address IPv4 exhaustion

**Example - Route aggregation:**
```
Instead of advertising four separate routes:
192.168.0.0/24
192.168.1.0/24
192.168.2.0/24
192.168.3.0/24

Routers can advertise a single aggregated route:
192.168.0.0/22
```

**Benefits of CIDR:**
- Reduces routing table sizes in Internet routers
- More efficient use of remaining IPv4 address space
- Allows for finer-grained control over address assignment
- Supports variable-length subnet masking (VLSM)

## Network Address Translation (NAT)

**What it is:** A technique that modifies network address information in packet headers to map multiple private addresses to one or more public addresses.

**Why it's needed:**
- Conserves public IPv4 addresses
- Provides a level of security by hiding internal network structure
- Facilitates connection to the internet for private networks
- Allows for network flexibility and growth without public address changes

### Types of NAT

#### Static NAT

**What it is:** A one-to-one mapping between a private and a public IP address.

**How it works:**
1. Each internal host is assigned a permanent public IP address
2. Provides consistent external addressing for servers that need to be accessed from the internet

**Diagram:**
```
  Internal Network             Internet
┌─────────────────┐           ┌─────────────────┐
│                 │           │                 │
│  192.168.1.10   │  Static   │   203.0.113.10  │
│    ↑            │   NAT     │      ↑          │
│    │            │ 1:1 Map   │      │          │
│  Private IP     │◄────────►│   Public IP     │
│                 │           │                 │
└─────────────────┘           └─────────────────┘
```

#### Dynamic NAT

**What it is:** A many-to-many mapping where private IP addresses are mapped to a pool of public IP addresses.

**How it works:**
1. A private IP is assigned a public IP from the pool when it initiates a connection
2. The public IP is returned to the pool when the connection terminates
3. The number of simultaneous connections is limited by the size of the public IP pool

**Diagram:**
```
  Internal Network             Internet
┌─────────────────┐           ┌─────────────────┐
│  192.168.1.10   │    ↘      │   203.0.113.5   │
│                 │     ↘     │                 │
│  192.168.1.11   │      ↘    │   203.0.113.6   │
│                 │  Dynamic  │                 │
│  192.168.1.12   │    NAT    │   203.0.113.7   │
│                 │      ↗    │                 │
│  192.168.1.13   │     ↗     │   203.0.113.8   │
│                 │    ↗      │                 │
└─────────────────┘           └─────────────────┘
```

#### Network Address Port Translation (NAPT) / PAT

**What it is:** Also known as Port Address Translation (PAT) or IP masquerading, it maps multiple private IP addresses to a single public IP by using different ports.

**How it works:**
1. The NAT device maintains a translation table of private IP:port to public IP:port mappings
2. When a packet leaves the private network, NAT changes the source address and port
3. When a response comes back, NAT uses the table to route back to the correct internal host

**Diagram:**
```
  Internal Network                 Internet
┌─────────────────────┐           ┌─────────────────┐
│  192.168.1.10:1234  │───┐       │                 │
│                     │   │       │                 │
│  192.168.1.11:1234  │───┼──────►│  203.0.113.5:   │
│                     │   │       │  various ports  │
│  192.168.1.12:1234  │───┘       │                 │
│                     │           │                 │
└─────────────────────┘           └─────────────────┘
```

**NAT traversal challenges:**
- Complicates peer-to-peer communications
- Can break protocols that embed IP addresses in payloads
- May interfere with end-to-end security models
- Requires special techniques for VoIP, gaming, etc.

**NAT traversal techniques:**
- STUN (Session Traversal Utilities for NAT)
- TURN (Traversal Using Relays around NAT)
- ICE (Interactive Connectivity Establishment)
- UPnP (Universal Plug and Play) and NAT-PMP (NAT Port Mapping Protocol)

## IP Fragmentation and Reassembly

**What it is:** The process of breaking a large IP packet into smaller fragments when it needs to traverse a network with a smaller Maximum Transmission Unit (MTU).

**Why it's needed:**
- Different network technologies have different MTU sizes
- Oversized packets must be broken into fragments to pass through links with smaller MTUs
- Enables IP to operate over heterogeneous networks

**How fragmentation works:**
1. Router determines that a packet is larger than the outgoing link's MTU
2. The packet is divided into fragments small enough to pass
3. Each fragment is marked with identification, offset, and more-fragments flag
4. Fragments travel independently to the destination
5. Destination host reassembles the original packet

**IP header fields used for fragmentation:**
- **Identification:** Identifies which packet the fragment belongs to
- **Flags:** Includes the "More Fragments" (MF) bit
- **Fragment Offset:** Indicates where in the original packet this fragment belongs

**Diagram:**
```
Original IP Packet (4000 bytes)
┌───────────────────────────────────────────────────────────────┐
│ IP Header | Data (3980 bytes)                                 │
└───────────────────────────────────────────────────────────────┘

After Fragmentation (MTU = 1500 bytes)
Fragment 1
┌───────────────────────────────────────────────┐
│ IP Header | Data (1480 bytes) | MF=1, Offset=0│
└───────────────────────────────────────────────┘

Fragment 2
┌───────────────────────────────────────────────┐
│ IP Header | Data (1480 bytes) | MF=1, Offset=185│
└───────────────────────────────────────────────┘

Fragment 3
┌───────────────────────────────────────────────┐
│ IP Header | Data (1020 bytes) | MF=0, Offset=370│
└───────────────────────────────────────────────┘
```

**Challenges with fragmentation:**
- Increases processing overhead
- All fragments must arrive for reassembly
- Loss of any fragment requires retransmission of the entire packet
- Complicates security devices (firewalls, IDS)

**Path MTU Discovery:**
- A technique to determine the smallest MTU on the path to a destination
- Uses ICMP "Fragmentation Needed" messages
- Allows senders to avoid fragmentation by keeping packets within path MTU size
- Implemented in modern operating systems

## Internet Protocol (IP)

### IPv4 Protocol

**What it is:** The fundamental network layer protocol that provides addressing, datagram service, and fragmentation for the Internet.

**IPv4 packet header format:**
```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|Version|  IHL  |Type of Service|          Total Length         |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|         Identification        |Flags|      Fragment Offset    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|  Time to Live |    Protocol   |         Header Checksum       |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                       Source Address                          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Destination Address                        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Options                    |    Padding    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

**Key header fields:**
1. **Version:** Indicates the protocol version (4 for IPv4)
2. **IHL (Internet Header Length):** Length of the header in 32-bit words
3. **Type of Service:** Now used for Differentiated Services (DiffServ) and ECN
4. **Total Length:** Length of the entire packet in bytes
5. **Identification:** Used for grouping fragments of a packet
6. **Flags:** Controls and identifies fragments
7. **Fragment Offset:** Indicates position of fragment in original packet
8. **TTL (Time to Live):** Limits packet lifetime to prevent infinite loops
9. **Protocol:** Identifies the next-level protocol (e.g., 6 for TCP, 17 for UDP)
10. **Header Checksum:** Error-checking for the header
11. **Source Address:** 32-bit sender IP address
12. **Destination Address:** 32-bit receiver IP address
13. **Options:** Additional features (rarely used)

**IPv4 characteristics:**
- Connectionless service (no prior setup required)
- Best-effort delivery (no reliability guarantees)
- Stateless operation (each packet handled independently)
- Supports fragmentation and reassembly

### IPv6 Protocol

**What it is:** The next generation Internet Protocol designed to replace IPv4, with a larger address space and improved features.

**IPv6 packet header format:**
```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|Version| Traffic Class |           Flow Label                  |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|         Payload Length        |  Next Header  |   Hop Limit   |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
+                                                               +
|                                                               |
+                         Source Address                        +
|                                                               |
+                                                               +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
+                                                               +
|                                                               |
+                      Destination Address                      +
|                                                               |
+                                                               +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

**Key header fields:**
1. **Version:** Indicates the protocol version (6 for IPv6)
2. **Traffic Class:** Similar to Type of Service in IPv4
3. **Flow Label:** Identifies packets belonging to the same flow
4. **Payload Length:** Length of the payload in bytes
5. **Next Header:** Identifies the type of header immediately following
6. **Hop Limit:** Similar to TTL in IPv4
7. **Source Address:** 128-bit sender IPv6 address
8. **Destination Address:** 128-bit receiver IPv6 address

**IPv6 extension headers:**
- **Hop-by-Hop Options:** For information examined by every node
- **Routing:** Lists intermediate nodes to be visited
- **Fragment:** Contains fragmentation information
- **Authentication Header (AH):** Provides integrity and authentication
- **Encapsulating Security Payload (ESP):** Provides encryption and confidentiality
- **Destination Options:** Information examined only by the destination

**IPv6 improvements over IPv4:**
- Vastly larger address space (128 bits vs. 32 bits)
- Simplified header format for faster processing
- Built-in security (IPsec)
- Better support for QoS
- No need for header checksum (reliability delegated to lower layers)
- No fragmentation at routers (uses Path MTU Discovery)
- Autoconfiguration capabilities
- No broadcast (replaced by multicast)
- Mobility support

## Internet Control Message Protocol (ICMP)

**What it is:** A supporting protocol in the Internet Protocol suite that provides error reporting, diagnostics, and network testing capabilities.

**How it works:**
- Used by network devices to send error messages and operational information
- Carried as a payload in IP packets
- Not used for regular data transmission between applications

**ICMP message format:**
```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|     Type      |     Code      |          Checksum             |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                         Message Body                          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

**Common ICMP message types:**

| Type | Name | Description |
|------|------|-------------|
| 0 | Echo Reply | Response to Echo Request (ping) |
| 3 | Destination Unreachable | Packet could not be delivered |
| 5 | Redirect | Better route available |
| 8 | Echo Request | Request for Echo Reply (ping) |
| 11 | Time Exceeded | TTL expired in transit |
| 12 | Parameter Problem | Invalid IP header |
| 13/14 | Timestamp Request/Reply | Time synchronization |
| 30 | Traceroute | Used by traceroute tools |

**ICMP applications:**
- **Ping:** Tests reachability and round-trip time
- **Traceroute:** Determines the path to a destination
- **Path MTU Discovery:** Finds maximum packet size
- **Network error diagnosis:** Identifies why connections fail

**ICMP Destination Unreachable codes:**

| Code | Meaning |
|------|---------|
| 0 | Network unreachable |
| 1 | Host unreachable |
| 2 | Protocol unreachable |
| 3 | Port unreachable |
| 4 | Fragmentation needed but DF flag set |
| 5 | Source route failed |

**ICMP security considerations:**
- Can be used for network reconnaissance (ping sweep, port scan)
- Used in certain DoS attacks (ping flood, smurf attack)
- Often filtered at perimeter firewalls
- ICMPv6 plays a more essential role than ICMPv4 (needed for basic operations)

## Address Resolution Protocol (ARP)

**What it is:** A protocol used to discover the link layer address (e.g., MAC address) associated with a given network layer address (e.g., IP address).

**Why it's needed:**
- IP communication on a LAN requires both IP and MAC addresses
- IP routing determines the next-hop IP address
- MAC addresses are needed for the actual frame delivery

**How it works:**
1. When a host wants to send an IP packet to another host on the same network, it needs the destination MAC address
2. The sender checks its ARP cache for an existing mapping
3. If no mapping exists, the sender broadcasts an ARP request: "Who has IP address x.x.x.x?"
4. The host with that IP address responds with its MAC address
5. The sender updates its ARP cache and sends the packet

**ARP message format:**
```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|         Hardware Type         |         Protocol Type         |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|  HW Addr Len  | Prot Addr Len |            Operation          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                   Sender Hardware Address                     |
+                                                               +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                   Sender Protocol Address                     |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                   Target Hardware Address                     |
+                                                               +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                   Target Protocol Address                     |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

**ARP operations:**
- **ARP Request (1):** "Who has this IP address?"
- **ARP Reply (2):** "I have that IP address, here's my MAC"
- **RARP Request (3):** "Who knows my IP address?" (Reverse ARP)
- **RARP Reply (4):** "Your IP address is..." (Reverse ARP)

**Diagram - ARP Process:**
```
    Host A                                    Host B
(IP: 192.168.1.10)                       (IP: 192.168.1.20)
(MAC: 00:11:22:33:44:55)                 (MAC: 66:77:88:99:AA:BB)
       │                                         │
       │                                         │
       │ 1. ARP Request (Broadcast)              │
       │ "Who has 192.168.1.20?"                 │
       │─────────────────────────────────────────►
       │                                         │
       │ 2. ARP Reply (Unicast)                  │
       │ "192.168.1.20 is at 66:77:88:99:AA:BB"  │
       │◄─────────────────────────────────────────
       │                                         │
       │ 3. Data can now be sent                 │
       │ using the resolved MAC address          │
       │─────────────────────────────────────────►
       │                                         │
```

**ARP cache:**
- Temporary table storing IP-to-MAC mappings
- Entries typically timeout after a period of inactivity
- Can be examined with `arp -a` command on most systems
- Can include static (permanent) entries for important hosts

**ARP vulnerabilities:**
- **ARP Spoofing/Poisoning:** Attacker sends fake ARP messages to associate their MAC with another host's IP
- **ARP Cache Poisoning:** Corrupting ARP tables to redirect traffic
- **MAC Flooding:** Overwhelming switches with fake MAC addresses
- Mitigation: DHCP snooping, Dynamic ARP Inspection, static ARP entries

## Quality of Service (QoS)

**What it is:** A set of technologies that work on the network layer to provide different priorities to different applications, users, or data flows.

**Why it's needed:**
- Different applications have different requirements (latency, jitter, bandwidth)
- Network resources are limited and need to be allocated efficiently
- Critical applications need guaranteed performance
- Congestion affects different applications differently

**QoS metrics:**
1. **Bandwidth:** Data transfer rate
2. **Delay (latency):** Time taken for packets to reach the destination
3. **Jitter:** Variation in packet delay
4. **Packet loss:** Percentage of packets lost during transmission

**QoS models:**

1. **Best-Effort Service:**
   - No guarantees or prioritization
   - Default Internet model
   - All packets treated equally
   - Simple to implement but no performance guarantees

2. **Integrated Services (IntServ):**
   - Reserves resources for specific flows
   - Uses Resource Reservation Protocol (RSVP)
   - Provides guaranteed service
   - Lacks scalability for large networks

3. **Differentiated Services (DiffServ):**
   - Classifies traffic into classes with different priorities
   - Uses DSCP (Differentiated Services Code Point) field in IP header
   - More scalable than IntServ
   - Provides relative (not absolute) guarantees

**DiffServ per-hop behaviors (PHBs):**
- **Default (DE):** Best-effort service
- **Expedited Forwarding (EF):** Low delay, loss, and jitter (for voice, video)
- **Assured Forwarding (AF):** Groups traffic into classes with different drop precedences
- **Class Selector (CS):** Backward compatibility with IP Precedence

**QoS mechanisms:**

1. **Classification and Marking:**
   - Identify and mark traffic at network entry points
   - Use IP header fields (DSCP, ECN)
   - Set values based on application, protocol, or business priority

2. **Traffic Shaping and Policing:**
   - **Shaping:** Buffers traffic to smooth bursts to a configured rate
   - **Policing:** Drops or marks excess traffic above a configured rate

3. **Queuing and Scheduling:**
   - **Priority Queuing:** Serves higher priority queues first
   - **Weighted Fair Queuing (WFQ):** Allocates bandwidth proportional to weights
   - **Class-Based Weighted Fair Queuing (CBWFQ):** Extends WFQ with defined classes
   - **Low Latency Queuing (LLQ):** Combines priority queuing with CBWFQ

4. **Congestion Avoidance:**
   - **Random Early Detection (RED):** Proactively drops packets as queues fill
   - **Weighted Random Early Detection (WRED):** Applies different drop probabilities based on traffic priority

**Real-world QoS applications:**
- VoIP prioritization
- Video conferencing
- Critical business applications
- Service provider traffic management
- Cloud service differentiation
- Software-defined WAN (SD-WAN) traffic steering

## Summary

- The network layer is responsible for delivering packets from source to destination across multiple networks
- IP provides the addressing and packet forwarding needed for internet communications
- IPv4 uses 32-bit addresses while IPv6 uses 128-bit addresses to solve address exhaustion
- Subnetting and CIDR provide flexible IP address management and hierarchical routing
- NAT allows multiple private IP addresses to share public IP addresses
- Fragmentation enables packets to traverse networks with different MTU sizes
- ICMP provides error reporting and diagnostic capabilities
- ARP maps IP addresses to MAC addresses for local network communication
- QoS mechanisms provide differentiated service levels for various applications
- The network layer forms the backbone of the Internet, enabling global connectivity
