# Transport Layer

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
**Transport Layer** | 
[Application Layer](application_layer.md) | 
[Equations](equations.md)

---

## Introduction to the Transport Layer

### What is the Transport Layer?

**What it is:** The transport layer is the fourth layer in the OSI model and the TCP/IP suite, responsible for end-to-end communication between applications running on different hosts.

**Key responsibilities:**
1. Process-to-process (application-to-application) delivery
2. Segmentation and reassembly of messages
3. Connection management
4. Flow control
5. Error control
6. Congestion control

**Position in network stack:**
```
┌─────────────────┐
│ Application     │  Layer 7 - HTTP, FTP, SMTP, DNS
├─────────────────┤
│ Presentation    │  Layer 6 - TLS/SSL, JPEG, MPEG
├─────────────────┤
│ Session         │  Layer 5 - NetBIOS, RPC
├─────────────────┤
│ Transport       │  Layer 4 - TCP, UDP, SCTP  ← Transport Layer
├─────────────────┤
│ Network         │  Layer 3 - IP, ICMP, OSPF
├─────────────────┤
│ Data Link       │  Layer 2 - Ethernet, Wi-Fi, PPP
├─────────────────┤
│ Physical        │  Layer 1 - Cables, Switches, NIC
└─────────────────┘
```

**In the TCP/IP model:**
```
┌─────────────────┐
│ Application     │  HTTP, FTP, SMTP, DNS, etc.
├─────────────────┤
│ Transport       │  TCP, UDP, SCTP  ← Transport Layer
├─────────────────┤
│ Internet        │  IP, ICMP, IGMP, etc.
├─────────────────┤
│ Network Access  │  Ethernet, Wi-Fi, PPP, etc.
└─────────────────┘
```

### Transport Layer Services

**1. Process-to-Process Delivery:**
- Uses port numbers to identify specific applications/processes
- Combines IP addresses (network layer) + port numbers to create sockets
- Example: Web server at 192.168.1.1:80 (IP address:port number)

**2. Connection-Oriented vs. Connectionless Service:**
- **Connection-oriented:** Establishes a connection before data transfer (e.g., TCP)
- **Connectionless:** No connection establishment, each packet handled independently (e.g., UDP)

**3. Reliability:**
- **Reliable:** Guarantees delivery with acknowledgments and retransmissions
- **Unreliable:** No delivery guarantees, but faster and simpler

**4. Flow Control:**
- Prevents sender from overwhelming receiver
- Adjusts transmission rate based on receiver capabilities

**5. Congestion Control:**
- Prevents network congestion by adjusting transmission rates
- Responds to network conditions to optimize throughput

**6. Multiplexing/Demultiplexing:**
- **Multiplexing:** Combines multiple application data streams into transport layer segments
- **Demultiplexing:** Delivers received segments to the correct application processes

## Port Numbers and Multiplexing

### Port Numbers

**What they are:** 16-bit numbers (0-65535) that identify specific applications or services on a host.

**Port number categories:**
1. **Well-known ports (0-1023):** Standardized services, assigned by IANA
2. **Registered ports (1024-49151):** For applications registered with IANA
3. **Dynamic/Private ports (49152-65535):** Temporary ports for client applications

**Common well-known ports:**

| Port | Protocol | Service |
|------|----------|---------|
| 20, 21 | TCP | FTP (File Transfer Protocol) |
| 22 | TCP | SSH (Secure Shell) |
| 23 | TCP | Telnet |
| 25 | TCP | SMTP (Simple Mail Transfer Protocol) |
| 53 | TCP/UDP | DNS (Domain Name System) |
| 80 | TCP | HTTP (Hypertext Transfer Protocol) |
| 110 | TCP | POP3 (Post Office Protocol v3) |
| 143 | TCP | IMAP (Internet Message Access Protocol) |
| 443 | TCP | HTTPS (HTTP Secure) |
| 3389 | TCP | RDP (Remote Desktop Protocol) |

### Multiplexing and Demultiplexing

**Multiplexing:** The process of combining multiple data streams from different applications into segments at the transport layer of the sender.

**Demultiplexing:** The process of delivering the received segments to the correct application processes at the receiver.

**How it works:**
1. Each application process is assigned a unique port number
2. Transport layer adds source and destination port numbers to each segment
3. Receiver uses these port numbers to route data to the correct application

**Example:**
```
     Client                       Server
┌─────────────────┐           ┌─────────────────┐
│ Web Browser     │           │ Web Server      │
│ Process (Port   │           │ Process (Port   │
│ 49152)          │◄─────────►│ 80)             │
├─────────────────┤           ├─────────────────┤
│ Email Client    │           │ Email Server    │
│ Process (Port   │           │ Process (Port   │
│ 49153)          │◄─────────►│ 25)             │
└─────────────────┘           └─────────────────┘
        │                             │
        │                             │
        ▼                             ▼
┌─────────────────┐           ┌─────────────────┐
│                 │           │                 │
│ Transport Layer │◄─────────►│ Transport Layer │
│ (Multiplex/     │           │ (Multiplex/     │
│  Demultiplex)   │           │  Demultiplex)   │
│                 │           │                 │
└─────────────────┘           └─────────────────┘
```

**Connection identification:**
- **UDP:** Identifies a connection using two values:
  - Destination IP address
  - Destination port number
- **TCP:** Identifies a connection using four values:
  - Source IP address
  - Source port number
  - Destination IP address
  - Destination port number

This allows multiple connections to the same server port from different clients or from the same client using different source ports.

## User Datagram Protocol (UDP)

### UDP Overview

**What it is:** A simple, connectionless transport layer protocol that provides unreliable datagram service with minimal overhead.

**Characteristics:**
- Connectionless (no handshaking before communication)
- Unreliable (no acknowledgments, retransmissions, or delivery guarantees)
- No flow control
- No congestion control
- Message-oriented (preserves message boundaries)
- Low overhead (small header size)
- Stateless (no server-side connection state to maintain)

**UDP Header:**
```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|          Source Port          |       Destination Port        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|            Length             |           Checksum            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                             Data                              |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

**Header fields:**
- **Source Port (16 bits):** Port number of the sending application (optional, can be 0)
- **Destination Port (16 bits):** Port number of the destination application
- **Length (16 bits):** Length of the UDP header and data in bytes
- **Checksum (16 bits):** Error detection for header and data (optional in IPv4, mandatory in IPv6)

### UDP Applications

**When to use UDP:**
1. **Simple request-response communications:** Like DNS lookups
2. **Real-time applications:** Where timeliness is more important than reliability
3. **Broadcast or multicast applications:** Where acknowledgments are impractical
4. **Applications that implement their own reliability:** At the application layer

**Common UDP applications:**
- **Domain Name System (DNS):** Fast lookups for IP addresses
- **Streaming media:** Audio/video streaming
- **Voice over IP (VoIP):** Real-time voice communications
- **Online gaming:** Fast, real-time updates
- **DHCP:** Dynamic Host Configuration Protocol
- **SNMP:** Simple Network Management Protocol
- **TFTP:** Trivial File Transfer Protocol

**Advantages of UDP:**
- Lower latency (no connection establishment)
- Smaller header size (8 bytes vs. 20+ bytes for TCP)
- No connection state to maintain
- Less network overhead (no acknowledgments)
- No retransmission delays
- No congestion control throttling

**Disadvantages of UDP:**
- No reliability guarantees
- No ordering guarantees
- No duplicate protection
- No flow control
- No congestion control (potentially network-unfriendly)
- Limited message size

## Transmission Control Protocol (TCP)

### TCP Overview

**What it is:** A connection-oriented, reliable transport layer protocol that provides ordered, error-checked delivery of a byte stream between applications.

**Characteristics:**
- Connection-oriented (requires connection establishment)
- Reliable (guarantees delivery with acknowledgments and retransmissions)
- Stream-oriented (treats data as a continuous stream of bytes)
- Full-duplex (bidirectional communication)
- Flow control (prevents overwhelming the receiver)
- Congestion control (prevents overwhelming the network)
- Ordered delivery (maintains sequence of transmitted data)

**TCP Header:**
```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|          Source Port          |       Destination Port        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                        Sequence Number                        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Acknowledgment Number                      |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|  Data |       |C|E|U|A|P|R|S|F|                               |
| Offset| Rsrvd |W|C|R|C|S|S|Y|I|            Window             |
|       |       |R|E|G|K|H|T|N|N|                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|           Checksum            |         Urgent Pointer        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Options                    |    Padding    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                             Data                              |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

**Header fields:**
- **Source Port (16 bits):** Port number of the sending application
- **Destination Port (16 bits):** Port number of the destination application
- **Sequence Number (32 bits):** Position of the first byte in the current segment
- **Acknowledgment Number (32 bits):** Next expected byte from the other side
- **Data Offset (4 bits):** Size of the TCP header in 32-bit words
- **Reserved (6 bits):** Reserved for future use, must be zero
- **Control Flags (9 bits):** URG, ACK, PSH, RST, SYN, FIN, etc.
- **Window (16 bits):** Number of bytes the receiver is willing to accept
- **Checksum (16 bits):** Error detection for header and data
- **Urgent Pointer (16 bits):** Points to urgent data in the segment
- **Options (variable):** Optional additional fields (e.g., MSS, SACK, Timestamps)
- **Padding:** Ensures header ends on a 32-bit boundary

### TCP Connection Management

#### Connection Establishment (Three-Way Handshake)

**Purpose:** Establishes a connection and synchronizes sequence numbers between client and server.

**Process:**
1. **Client → Server:** SYN segment with initial sequence number (ISN) x
2. **Server → Client:** SYN-ACK segment with ISN y and acknowledgment x+1
3. **Client → Server:** ACK segment with acknowledgment y+1

**Diagram:**
```
    Client                                Server
       │                                     │
       │          SYN, seq=x                 │
       │ ──────────────────────────────────► │
       │                                     │
       │      SYN-ACK, seq=y, ack=x+1        │
       │ ◄────────────────────────────────── │
       │                                     │
       │          ACK, ack=y+1               │
       │ ──────────────────────────────────► │
       │                                     │
       │             [DATA]                  │
       │ ◄───────────────────────────────────┼──►
       │                                     │
```

**SYN Flooding Attack:**
- Attacker sends many SYN packets without completing handshakes
- Server allocates resources for half-open connections
- Can exhaust server resources (DoS attack)
- Defenses include SYN cookies, connection rate limiting, and firewalls

#### Connection Termination (Four-Way Handshake)

**Purpose:** Gracefully terminates a connection, ensuring all data is delivered.

**Process:**
1. **Client → Server:** FIN segment (client is done sending)
2. **Server → Client:** ACK segment (acknowledges client's FIN)
3. **Server → Client:** FIN segment (server is done sending)
4. **Client → Server:** ACK segment (acknowledges server's FIN)

**Diagram:**
```
    Client                                Server
       │                                     │
       │            FIN, seq=u               │
       │ ──────────────────────────────────► │
       │                                     │
       │           ACK, ack=u+1              │
       │ ◄────────────────────────────────── │
       │                                     │
       │            FIN, seq=v               │
       │ ◄────────────────────────────────── │
       │                                     │
       │           ACK, ack=v+1              │
       │ ──────────────────────────────────► │
       │                                     │
```

**TIME-WAIT State:**
- After sending the final ACK, the client enters TIME-WAIT state
- Typically lasts for 2 × Maximum Segment Lifetime (MSL)
- Ensures any delayed packets will be discarded
- Prevents confusion with new connections using the same ports

**Half-Close:**
- TCP allows one side to end its sending while still receiving data
- Applications can use this for unidirectional shutdown

### TCP Reliability Mechanisms

#### Acknowledgments and Retransmission

**What it is:** The mechanism by which TCP ensures reliable delivery of data.

**Positive Acknowledgment with Retransmission (PAR):**
- Sender transmits segments and waits for acknowledgments
- Receiver sends ACKs for successfully received segments
- If acknowledgment not received within timeout, segment is retransmitted
- Provides reliability even over unreliable network layers

**Retransmission Scenarios:**
1. **Timeout-based retransmission:**
   - Sender starts a timer when sending a segment
   - If timer expires before ACK is received, segment is retransmitted
   - Timer value is adjusted based on network conditions (RTO - Retransmission Timeout)

2. **Fast retransmission:**
   - Sender retransmits a segment upon receiving 3 duplicate ACKs
   - Does not wait for timeout, improving performance

**Calculating Retransmission Timeout (RTO):**
- Uses estimated RTT (Round-Trip Time) and deviation
- RTO = SRTT + 4 × RTTVAR
  - SRTT (Smoothed RTT) = (1-α) × SRTT + α × RTT
  - RTTVAR (RTT Variation) = (1-β) × RTTVAR + β × |SRTT - RTT|
  - Typical values: α = 0.125, β = 0.25
- Exponential backoff: RTO is doubled after each timeout

#### Sequence Numbers and Acknowledgment

**Sequence Numbers:**
- Identify the position of each byte in the data stream
- Enable reordering of segments that arrive out of order
- Allow detection of duplicate segments

**Acknowledgment Numbers:**
- Indicate the next byte expected from the sender
- Cumulative acknowledgments: ACK n means all bytes up to n-1 have been received

**Example:**
```
Sender sends 4 segments of 1000 bytes each:
  Segment 1: SEQ=1000, 1000 bytes of data
  Segment 2: SEQ=2000, 1000 bytes of data
  Segment 3: SEQ=3000, 1000 bytes of data
  Segment 4: SEQ=4000, 1000 bytes of data

Receiver acknowledges:
  ACK=2000 (received bytes up to 1999)
  ACK=3000 (received bytes up to 2999)
  ACK=4000 (received bytes up to 3999)
  ACK=5000 (received bytes up to 4999)
```

#### Selective Acknowledgment (SACK)

**What it is:** An extension to TCP that allows receivers to acknowledge non-contiguous blocks of data.

**How it works:**
- Uses TCP options field to specify blocks of data that have been received
- Sender needs to retransmit only the missing segments
- Improves efficiency when multiple segments are lost

**Example:**
```
Sender sends segments with sequence numbers 1000, 2000, 3000, 4000, 5000
Segments 2000 and 3000 are lost

Without SACK:
  Receiver ACKs 1000 (expecting 2000)
  Receiver ACKs 1000 (still expecting 2000)
  Receiver ACKs 1000 (still expecting 2000)
  Sender must retransmit from 2000 onwards

With SACK:
  Receiver ACKs 1000 (expecting 2000)
  Receiver ACKs 1000 with SACK option indicating 4000-6000 received
  Sender knows to retransmit only segments 2000 and 3000
```

#### Duplicate Detection

**What it is:** The mechanism to identify and handle duplicate segments.

**How it works:**
- Sequence numbers identify duplicate data
- Receiver discards segments with already received sequence numbers
- Acknowledgments inform sender that data was received (even if duplicated)

### Flow Control

**What it is:** A mechanism to prevent the sender from overwhelming the receiver by sending too much data too quickly.

**How it works:**
- Receiver advertises a window size in each ACK
- Window size indicates how many more bytes the receiver can accept
- Sender limits its unacknowledged data to the current window size

**Sliding Window Protocol:**
- Allows multiple segments to be in transit simultaneously
- Window "slides" forward as segments are acknowledged
- Dynamically adjusts based on receiver's capabilities

**Example:**
```
Receiver window: 4000 bytes
Sender has sent 1000 bytes, unacknowledged
Sender can send 3000 more bytes before waiting for ACKs
```

**Window Management:**
- Buffer space at receiver determines window size
- Zero window advertisement stops sender temporarily
- Window updates via ACKs keep sender informed
- Window scale option allows larger windows (beyond 65,535 bytes)

**Silly Window Syndrome:**
- Problem where small amounts of data are transferred inefficiently
- Solutions:
  - Clark's algorithm (receiver-side): delay window updates
  - Nagle's algorithm (sender-side): collect small writes

### Congestion Control

**What it is:** A mechanism to prevent network congestion by limiting the rate at which data is sent based on network conditions.

**Indications of congestion:**
- Packet loss (timeout or duplicate ACKs)
- Increased delay (higher RTT)
- Explicit Congestion Notification (ECN)

**TCP Congestion Control States:**

1. **Slow Start:**
   - Begins with a small congestion window (cwnd), typically 1-10 MSS
   - Doubles cwnd for each RTT (exponential growth)
   - Continues until reaching the slow start threshold (ssthresh) or packet loss

2. **Congestion Avoidance:**
   - Enters when cwnd exceeds ssthresh
   - Increases cwnd linearly (by approximately one MSS per RTT)
   - More conservative growth to probe for available bandwidth

3. **Fast Recovery:**
   - Enters after triple duplicate ACK (fast retransmit)
   - Reduces cwnd by half and adds 3 MSS (for the 3 duplicate ACKs)
   - Increases cwnd for each additional duplicate ACK

**TCP Congestion Control Algorithms:**

1. **TCP Tahoe:**
   - On packet loss (timeout or triple duplicate ACK):
     - Sets ssthresh = cwnd/2
     - Resets cwnd to 1 MSS
     - Enters slow start

2. **TCP Reno:**
   - On timeout:
     - Sets ssthresh = cwnd/2
     - Resets cwnd to 1 MSS
     - Enters slow start
   - On triple duplicate ACK:
     - Sets ssthresh = cwnd/2
     - Sets cwnd = ssthresh + 3 MSS
     - Enters fast recovery

3. **TCP New Reno:**
   - Improves fast recovery phase
   - Remains in fast recovery until all segments outstanding at start of fast recovery are acknowledged

4. **TCP CUBIC:**
   - Default in Linux
   - Uses a cubic function for window growth
   - Less dependent on RTT, more fair for different RTTs

5. **TCP BBR (Bottleneck Bandwidth and RTT):**
   - Models network by estimating bandwidth and RTT
   - Aims to operate at optimal point (maximum bandwidth with minimum delay)
   - Doesn't rely on packet loss as congestion signal

**AIMD (Additive Increase, Multiplicative Decrease):**
- The core principle behind TCP congestion control
- Additive increase: cwnd += 1 MSS per RTT (linear growth)
- Multiplicative decrease: cwnd = cwnd/2 (halving on loss)
- Leads to a stable and fair allocation of network bandwidth

**Diagram:**
```
   Congestion
   Window
   (cwnd)
      ▲
      │
      │    /\      /\
      │   /  \    /  \
      │  /    \  /    \    /\
      │ /      \/      \  /  \
      │/                \/    \
      └─────────────────────────► Time
        SS  CA  SS CA  SS CA  SS

      SS: Slow Start
      CA: Congestion Avoidance
```

### TCP Performance Enhancement

#### Nagle's Algorithm

**What it is:** An algorithm to reduce the number of small packets sent over the network.

**How it works:**
- If there is unacknowledged data in transit:
  - Buffer small segments until ACK is received
  - Or until a full-sized segment can be sent
- If no unacknowledged data, send immediately

**Applications:**
- Interactive applications like Telnet, SSH
- Can be disabled using TCP_NODELAY socket option for applications requiring immediate transmission

#### Delayed Acknowledgments

**What it is:** A technique where the receiver delays sending ACKs to reduce overhead.

**How it works:**
- Receiver waits up to 200-500ms before sending an ACK
- If another segment arrives during this time, an ACK is sent immediately
- If response data is generated, the ACK is piggy-backed with the data

**Benefits:**
- Reduces the number of small ACK packets
- Allows for piggy-backing ACKs with response data
- Decreases protocol overhead

#### TCP Fast Open (TFO)

**What it is:** A technique to reduce connection establishment latency by sending data in the SYN packet.

**How it works:**
- Client obtains a TFO cookie from server in an initial connection
- In subsequent connections, client sends SYN with TFO cookie and initial data
- Server validates cookie and can process data immediately

**Benefits:**
- Eliminates one RTT for data transfer
- Particularly beneficial for short-lived connections

#### Window Scaling

**What it is:** An extension that allows larger TCP windows for high-bandwidth, high-latency networks.

**How it works:**
- Standard TCP window is limited to 65,535 bytes (16 bits)
- Window scale option multiplies the advertised window by a power of 2
- Negotiated during connection setup
- Allows windows up to 1GB

**Bandwidth-Delay Product (BDP):**
- Maximum amount of data in transit = Bandwidth × Round-trip time
- High BDP links need large windows for full utilization
- Example: 100 Mbps link with 100ms RTT needs ~1.25MB window

## Comparison of TCP and UDP

| Feature | TCP | UDP |
|---------|-----|-----|
| **Connection** | Connection-oriented | Connectionless |
| **Reliability** | Reliable (acknowledgments and retransmissions) | Unreliable (no guarantees) |
| **Ordering** | Maintains order | No ordering guarantees |
| **Flow Control** | Yes (sliding window) | No |
| **Congestion Control** | Yes | No |
| **Header Size** | 20-60 bytes | 8 bytes |
| **Delivery Model** | Byte stream | Message-oriented |
| **Speed** | Slower due to overhead | Faster due to simplicity |
| **Usage** | Web browsing, email, file transfer | Streaming, DNS, VoIP, online games |
| **State Tracking** | Maintains connection state | Stateless |

**When to choose TCP:**
- Application requires reliable delivery
- Ordered delivery is important
- Application needs flow/congestion control
- Data integrity is critical

**When to choose UDP:**
- Low latency is critical
- Some data loss is acceptable
- Application implements its own reliability if needed
- Simple request-response patterns
- Broadcast/multicast communication

## Other Transport Layer Protocols

### Stream Control Transmission Protocol (SCTP)

**What it is:** A transport layer protocol providing reliable message delivery, multi-homing support, and multi-streaming.

**Key features:**
- Connection-oriented like TCP
- Message-oriented like UDP
- Supports multi-homing (multiple IP addresses per endpoint)
- Supports multi-streaming (independent flows within a connection)
- Built-in heartbeat mechanism
- Protection against SYN flooding attacks
- Partial reliability option (PR-SCTP)

**Applications:**
- Signaling in telephony networks (SS7 over IP)
- WebRTC data channels
- Database access
- Mission-critical applications requiring reliability and redundancy

### Datagram Congestion Control Protocol (DCCP)

**What it is:** A transport protocol that provides congestion control for unreliable datagram traffic.

**Key features:**
- Connectionless service with connection establishment
- Unreliable but congestion-controlled
- Multiple congestion control algorithms (TCP-like, TCP-friendly)
- ECN support (Explicit Congestion Notification)
- Feature negotiation during connection setup

**Applications:**
- Streaming media
- Internet telephony
- Online games
- Applications requiring congestion control but not reliability

### Quick UDP Internet Connections (QUIC)

**What it is:** A transport protocol developed by Google, now standardized as HTTP/3, designed to improve performance of connection-oriented web applications.

**Key features:**
- Built on UDP for faster connection establishment
- Integrated TLS-like security
- Multiple streams within one connection
- Connection migration (continue connection when IP changes)
- Improved congestion control
- Forward Error Correction (FEC)

**Applications:**
- Web browsing (HTTP/3)
- Google services
- CDN content delivery
- Mobile applications

## Transport Layer Security (TLS)

**What it is:** A security protocol that provides privacy and data integrity between communicating applications.

**Note:** TLS sits between the transport layer and application layer in the TCP/IP model (not strictly a transport layer protocol).

**Key features:**
- Authentication (verifies the identity of communicating parties)
- Confidentiality (encrypts data)
- Integrity (ensures data has not been modified)
- Perfect forward secrecy (in TLS 1.2+)

**TLS Handshake Process:**
1. Client sends ClientHello (supported cipher suites, random number)
2. Server responds with ServerHello, certificate, and key exchange parameters
3. Client verifies certificate, sends key exchange information
4. Both parties derive session keys
5. Secure communication begins

**TLS Versions:**
- TLS 1.0 (1999) - Deprecated
- TLS 1.1 (2006) - Deprecated
- TLS 1.2 (2008) - Widely used
- TLS 1.3 (2018) - Latest version, faster handshake, improved security

**Applications:**
- HTTPS (HTTP over TLS)
- Secure email (SMTP over TLS)
- Secure instant messaging
- VPN technologies
- Any application requiring secure communications

## Summary

- The transport layer provides end-to-end communication between applications on different hosts
- UDP offers simple, connectionless, unreliable, but fast datagram service
- TCP provides connection-oriented, reliable, ordered delivery with flow and congestion control
- Port numbers identify applications and enable multiplexing/demultiplexing
- TCP establishes connections via three-way handshake and terminates via four-way handshake
- TCP reliability is ensured through sequence numbers, acknowledgments, and retransmissions
- Flow control prevents senders from overwhelming receivers
- Congestion control prevents overloading the network infrastructure
- Additional protocols like SCTP, DCCP, and QUIC provide alternatives with different feature sets
- TLS adds security to transport layer communications
