# Data Link Layer

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
**Data Link Layer** | 
[Error Detection](error_detection.md) | 
[Transport Layer](transport_layer.md) | 
[Application Layer](application_layer.md) | 
[Equations](equations.md)

---

## Introduction to the Data Link Layer

### What is the Data Link Layer?

**What it is:** The second layer in the OSI model, responsible for node-to-node data transfer between two directly connected nodes. It provides functional and procedural means to transfer data between network entities and might provide the means to detect and possibly correct errors that may occur in the physical layer.

**Key responsibilities:**
1. Framing (creating and recognizing frame boundaries)
2. Physical addressing (MAC addresses)
3. Flow control (preventing sender from overwhelming receiver)
4. Error control (detecting and retransmitting damaged or lost frames)
5. Access control (determining which device has control of the link)

**Position in network stack:**
```
┌─────────────────┐
│ Application     │  Layer 7
├─────────────────┤
│ Presentation    │  Layer 6
├─────────────────┤
│ Session         │  Layer 5
├─────────────────┤
│ Transport       │  Layer 4
├─────────────────┤
│ Network         │  Layer 3
├─────────────────┤
│ Data Link       │  Layer 2 ← Data Link Layer
├─────────────────┤
│ Physical        │  Layer 1
└─────────────────┘
```

### Data Link Layer Sublayers

**The Data Link Layer is commonly divided into two sublayers:**

1. **Logical Link Control (LLC) Sublayer:**
   - Handles flow control, error control, and identifying network layer protocols
   - Provides a uniform interface to the network layer
   - Defined by IEEE 802.2 standard

2. **Media Access Control (MAC) Sublayer:**
   - Handles access to the shared medium
   - Responsible for physical addressing
   - Includes protocols like CSMA/CD, CSMA/CA
   - Varies based on the specific LAN technology

```
┌─────────────────────────────────┐
│          Network Layer          │
└─────────────────────────────────┘
                ▲
                │
┌─────────────────────────────────┐
│  Logical Link Control Sublayer  │ ┐
├─────────────────────────────────┤ │ Data Link Layer
│  Media Access Control Sublayer  │ ┘
└─────────────────────────────────┘
                ▲
                │
┌─────────────────────────────────┐
│          Physical Layer         │
└─────────────────────────────────┘
```

## Framing

**What it is:** The process of dividing the bit stream received from the network layer into manageable units called frames, and adding header and trailer information for link layer functionality.

**Purpose of framing:**
- Organize raw bit stream into manageable units
- Add control information (headers and trailers)
- Enable error detection and correction
- Allow for addressing at the data link layer
- Support media access control

### Framing Methods

#### Character Count

**What it is:** Specifies the number of characters in the frame at the beginning of the frame header.

**How it works:**
1. The first field in the frame indicates the total number of characters in the frame
2. The receiver uses this count to determine where the frame ends
3. The next count field indicates the beginning of the next frame

**Diagram:**
```
┌────┬──────────────────────┬────┬─────────────┬────┬────────┐
│ 8  │ Data (8 characters)  │ 15 │ Data (15)   │ 10 │ Data...│
└────┴──────────────────────┴────┴─────────────┴────┴────────┘
  ↑                            ↑                   ↑
  Count for                    Count for           Count for
  first frame                  second frame        third frame
```

**Disadvantages:**
- Vulnerable to transmission errors affecting the count field
- If count is corrupted, synchronization is lost for all subsequent frames
- Not widely used in modern networks due to reliability concerns

#### Character Stuffing (Byte Stuffing)

**What it is:** Uses special characters to mark the beginning and end of a frame, with escape mechanisms for when those characters appear in the data.

**How it works:**
1. Frame starts with a special flag character (commonly DLE STX - Data Link Escape, Start of Text)
2. Frame ends with another flag character (commonly DLE ETX - Data Link Escape, End of Text)
3. If the flag character appears in the data, an escape character (DLE) is inserted before it
4. If an escape character appears in the data, another escape character is inserted before it

**Example:**
```
Original data: A B DLE C DLE ETX D
After stuffing: DLE STX A B DLE DLE C DLE DLE ETX DLE ETX
                ↑      ↑         ↑           ↑
               Start   DLE in    DLE in      End
               Flag    data      data        Flag
```

**Advantages:**
- Simple to implement
- Self-synchronizing (can recover from errors)

**Disadvantages:**
- Character-oriented (not efficient for binary data)
- Variable frame size after stuffing
- Overhead increases with the occurrence of control characters in data

#### Bit Stuffing

**What it is:** Similar to character stuffing but works at the bit level, inserting extra bits when a specific bit pattern appears in the data.

**How it works:**
1. Frame begins and ends with a specific bit pattern (commonly 01111110, or 0x7E)
2. During transmission, if five consecutive 1s appear in the data, a 0 is inserted
3. Receiver removes any 0 that follows five consecutive 1s

**Example:**
```
Flag: 01111110
Original data: 01001111110110
After stuffing: 01001111(0)110110
                     ↑
                     Stuffed bit (0)

Frame: 01111110 01001111(0)110110 01111110
       ↑        ↑                 ↑
       Start    Data with         End
       Flag     stuffed bit       Flag
```

**Advantages:**
- Works at bit level (more efficient)
- Independent of character encoding
- Commonly used in protocols like HDLC

**Disadvantages:**
- Slight increase in bandwidth due to stuffed bits
- More complex to implement in software (bit manipulation)

#### Violation Coding

**What it is:** Uses violations of the physical layer encoding scheme to mark frame boundaries.

**How it works:**
1. Physical layer uses a specific encoding scheme (like Manchester or 4B/5B)
2. Special non-data symbols that violate the encoding rules mark frame boundaries
3. Because these symbols cannot occur in valid data, they uniquely identify frame limits

**Example (using Manchester encoding):**
```
Manchester encoding: 
- Transition mid-bit: low-to-high = 1, high-to-low = 0
- Always has a transition in the middle of each bit time

Normal data: 10110
Manchester: ↓↑↑↓↓↑↑↓↓↑

Frame delimiter: No transition in middle (violation of Manchester rules)
```

**Advantages:**
- No overhead in terms of extra bits or characters
- Very reliable frame synchronization
- Efficient use of bandwidth

**Disadvantages:**
- Dependent on physical layer encoding scheme
- More complex implementation
- Not applicable to all transmission media

## Addressing

### MAC Addressing

**What it is:** Physical addressing scheme used in the data link layer to uniquely identify network interfaces on a shared medium.

**MAC address characteristics:**
- 48 bits (6 bytes) in most common implementation
- Usually written as six pairs of hexadecimal digits (e.g., 00:1A:2B:3C:4D:5E)
- First three bytes identify the manufacturer (OUI - Organizationally Unique Identifier)
- Last three bytes are managed by the manufacturer to ensure uniqueness
- Theoretically worldwide unique for each network interface

**Types of MAC addresses:**
1. **Unicast:** Identifies a specific network interface (most common)
2. **Multicast:** Identifies a group of network interfaces (01:xx:xx:xx:xx:xx)
3. **Broadcast:** Identifies all network interfaces on the local network (FF:FF:FF:FF:FF:FF)

**Example of the address field in an Ethernet frame:**
```
┌─────────────────┬─────────────────┬───────┐
│ Destination MAC │   Source MAC    │ Data  │
│  (6 bytes)      │   (6 bytes)     │ ...   │
└─────────────────┴─────────────────┴───────┘
```

## Flow Control

**What it is:** Mechanisms to ensure that a sender does not overwhelm a receiver by transmitting data faster than the receiver can process it.

### Stop-and-Wait Flow Control

**What it is:** The simplest flow control mechanism where the sender waits for an acknowledgment after each frame before sending the next frame.

**How it works:**
1. Sender transmits a single frame
2. Sender waits for acknowledgment (ACK)
3. Once ACK is received, sender transmits the next frame
4. If ACK is not received within a timeout period, the frame is retransmitted

**Diagram:**
```
    Sender                      Receiver
      │                            │
      │──────── Frame 0 ──────────►│
      │                            │
      │◄─────── ACK 0 ─────────────│
      │                            │
      │──────── Frame 1 ──────────►│
      │                            │
      │◄─────── ACK 1 ─────────────│
      │                            │
      │──────── Frame 0 ──────────►│
      │                            │
      │◄─────── ACK 0 ─────────────│
      │                            │
```

**Advantages:**
- Simple to implement
- Low buffer requirements
- Self-pacing

**Disadvantages:**
- Very inefficient use of bandwidth
- High latency on high-bandwidth or high-delay links
- Poor performance on long-distance links

**Efficiency calculation:**
```
Efficiency = (Transmission time per frame) / (Transmission time + RTT)

Where:
- Transmission time = Frame size / Bandwidth
- RTT = Round-trip time
```

### Sliding Window Flow Control

**What it is:** A more efficient flow control mechanism that allows multiple frames to be in transit at once, within a "window" of sequence numbers.

**How it works:**
1. Sender maintains a window of sequence numbers it can send without waiting for ACKs
2. Receiver maintains a window of sequence numbers it can accept
3. As frames are acknowledged, the sender's window "slides" forward
4. Window size limits the maximum number of unacknowledged frames

**Diagram (with window size = 4):**
```
    Sequence numbers:  0   1   2   3   4   5   6   7
                     ┌───┬───┬───┬───┬───┬───┬───┬───┐
                     │   │   │   │   │   │   │   │   │
                     └───┴───┴───┴───┴───┴───┴───┴───┘
                       ↑               ↑
                       │               │
                     Sent &        Window
                    Acknowledged    (can send)
```

**Sender operations:**
- Send any frame within the window
- Advance left edge of window when ACKs arrive
- Stop sending when window is full (right edge reached)
- Use timeout for retransmissions

**Receiver operations:**
- Accept frames within receive window
- Send ACKs for correctly received frames
- Advance window when delivering frames in sequence

**Types of sliding window implementations:**
1. **Go-Back-N:**
   - Receiver accepts only in-sequence frames
   - On error, sender retransmits all frames from the error point forward
   - Simple receiver buffer management (only one buffer needed)

2. **Selective Repeat:**
   - Receiver accepts and buffers out-of-sequence frames
   - Only damaged or lost frames are retransmitted
   - More efficient use of bandwidth
   - Requires more complex buffer management at receiver

**Advantages of sliding window:**
- Much better utilization of bandwidth
- Better handling of high bandwidth-delay product links
- Reduced impact of round-trip time

**Disadvantages:**
- More complex implementation
- Requires buffer management
- Potential for sequence number ambiguity if window size is too large relative to sequence number space

## Error Control

**What it is:** Mechanisms to detect and recover from errors that occur in frame transmission.

### Error Detection Methods

Data link layer uses various error detection techniques, including:
- Parity checking (simple, detects odd number of bit errors)
- Cyclic Redundancy Check (CRC) (powerful, detects burst errors)
- Checksums (detects errors by summing the data values)

These are covered in detail in the [Error Detection](error_detection.md) section.

### Error Control Techniques

#### Automatic Repeat Request (ARQ)

**What it is:** A method where the receiver requests retransmission of frames detected to have errors.

**Key ARQ variants:**

1. **Stop-and-Wait ARQ:**
   - Sender transmits one frame, then waits for acknowledgment
   - If ACK not received before timeout, frame is retransmitted
   - If damaged frame is received, receiver discards it and sends no ACK
   - Uses 1-bit sequence number to handle duplicate frames

   ```
   Sender                         Receiver
     │                               │
     │───────── Frame 0 ────────────►│ 
     │                               │ (Frame received correctly)
     │◄──────── ACK 0 ───────────────│
     │                               │
     │───────── Frame 1 ────────────►│ 
     │                               │ (Frame lost or damaged)
     │         (Timeout)             │
     │                               │
     │───────── Frame 1 ────────────►│
     │                               │ (Frame received correctly)
     │◄──────── ACK 1 ───────────────│
     │                               │
   ```

2. **Go-Back-N ARQ:**
   - Sender can have multiple unacknowledged frames
   - Uses cumulative ACKs (ACKing frame N acknowledges all frames up to N)
   - If an error is detected, receiver discards that frame and all subsequent frames
   - After timeout, sender retransmits the erroneous frame and all subsequent frames

   ```
   Sender                         Receiver
     │                               │
     │───────── Frame 0 ────────────►│ 
     │───────── Frame 1 ────────────►│ 
     │───────── Frame 2 ────────────►│ (Frame 2 damaged)
     │───────── Frame 3 ────────────►│ (Discarded)
     │                               │
     │◄──────── ACK 1 ───────────────│ (Up to frame 1 received correctly)
     │                               │
     │         (Timeout)             │
     │                               │
     │───────── Frame 2 ────────────►│ 
     │───────── Frame 3 ────────────►│ 
     │                               │
     │◄──────── ACK 3 ───────────────│
     │                               │
   ```

3. **Selective Repeat ARQ:**
   - Sender can have multiple unacknowledged frames
   - Receiver individually acknowledges correctly received frames
   - Receiver buffers correctly received frames that are out of order
   - Sender only retransmits frames that are not acknowledged

   ```
   Sender                         Receiver
     │                               │
     │───────── Frame 0 ────────────►│ 
     │───────── Frame 1 ────────────►│ 
     │───────── Frame 2 ────────────►│ (Frame 2 damaged)
     │───────── Frame 3 ────────────►│ (Buffered)
     │                               │
     │◄──────── ACK 0 ───────────────│ 
     │◄──────── ACK 1 ───────────────│ 
     │◄──────── NAK 2 ───────────────│ (Negative acknowledgment)
     │◄──────── ACK 3 ───────────────│ 
     │                               │
     │───────── Frame 2 ────────────►│ (Only frame 2 is retransmitted)
     │                               │
     │◄──────── ACK 2 ───────────────│
     │                               │
   ```

**Comparison of ARQ types:**

| Feature | Stop-and-Wait ARQ | Go-Back-N ARQ | Selective Repeat ARQ |
|---------|-------------------|---------------|----------------------|
| **Efficiency** | Low | Medium | High |
| **Complexity** | Low | Medium | High |
| **Buffer requirement** | Low (sender: 1, receiver: 1) | Medium (sender: N, receiver: 1) | High (sender: N, receiver: N) |
| **Bandwidth usage** | Poor | Better | Best |
| **Frame reordering** | Not required | Not required | Required |
| **Sequence numbers** | 1 bit sufficient | Must be > window size | Must be > 2x window size |
| **Retransmissions** | Single frame | Multiple frames | Specific frames only |

## Medium Access Control

**What it is:** Techniques that determine which device gets to use the shared transmission medium when multiple devices are connected.

### Types of MAC Protocols

1. **Random Access Protocols:**
   - ALOHA (Pure and Slotted)
   - CSMA (Carrier Sense Multiple Access)
   - CSMA/CD (Collision Detection)
   - CSMA/CA (Collision Avoidance)

2. **Controlled Access Protocols:**
   - Polling
   - Token Passing

3. **Channelization Protocols:**
   - FDMA (Frequency Division Multiple Access)
   - TDMA (Time Division Multiple Access)
   - CDMA (Code Division Multiple Access)

These are covered in detail in the [Media Access Control](media_access_control.md) section.

## Data Link Layer Protocols

### Ethernet (IEEE 802.3)

**What it is:** The most widely used family of LAN technologies, defined by the IEEE 802.3 standard.

**Key features:**
- CSMA/CD access method (traditional)
- Switched operation (modern)
- Various physical layer implementations (10BASE-T, 100BASE-TX, 1000BASE-T, etc.)
- 48-bit MAC addressing
- Various speeds: 10 Mbps, 100 Mbps, 1 Gbps, 10 Gbps, 40 Gbps, 100 Gbps

**Ethernet frame format:**
```
┌────────┬────────┬──────┬──────┬───────┬──────┬────────┐
│Preamble│  SFD   │ Dest │ Src  │Length/│ Data │  CRC   │
│(7 bytes)│(1 byte)│ MAC  │ MAC  │Type   │(46-1500│(4 bytes)│
│        │        │(6 B) │(6 B) │(2 B)  │ bytes)│        │
└────────┴────────┴──────┴──────┴───────┴──────┴────────┘
```

**Frame fields:**
- **Preamble:** 7 bytes of alternating 1s and 0s (10101010...) to synchronize
- **SFD (Start Frame Delimiter):** 1 byte (10101011) marking the start of the frame
- **Destination MAC Address:** 6 bytes identifying the target interface
- **Source MAC Address:** 6 bytes identifying the sending interface
- **Length/Type:** 2 bytes indicating either frame length or protocol type
- **Data:** 46-1500 bytes of payload (minimum 46 to ensure collision detection)
- **CRC:** 4-byte cyclic redundancy check for error detection

**Ethernet operation:**
1. Traditional Ethernet (CSMA/CD):
   - Listen before transmitting (carrier sense)
   - If medium is busy, wait
   - If medium is idle, transmit
   - Listen while transmitting (collision detection)
   - If collision detected, stop transmitting and send jam signal
   - Wait random backoff time, then try again

2. Modern switched Ethernet:
   - Full-duplex operation (no collisions)
   - Dedicated bandwidth between host and switch
   - No need for CSMA/CD (though protocol still defined)
   - Switches forward frames based on MAC addresses

**Ethernet variants:**

| Standard | Speed | Medium | Distance | Notes |
|----------|-------|--------|----------|-------|
| 10BASE-T | 10 Mbps | Twisted pair | 100m | Original twisted pair Ethernet |
| 100BASE-TX | 100 Mbps | Cat 5+ UTP | 100m | Fast Ethernet |
| 1000BASE-T | 1 Gbps | Cat 5e+ UTP | 100m | Gigabit Ethernet on copper |
| 1000BASE-SX | 1 Gbps | Multimode fiber | 550m | Gigabit Ethernet on fiber |
| 10GBASE-T | 10 Gbps | Cat 6a+ UTP | 100m | 10 Gigabit Ethernet on copper |
| 40GBASE-SR4 | 40 Gbps | Multimode fiber | 100m | 40 Gigabit Ethernet |
| 100GBASE-SR4 | 100 Gbps | Multimode fiber | 100m | 100 Gigabit Ethernet |

### Point-to-Point Protocol (PPP)

**What it is:** A data link protocol used to establish a direct connection between two nodes.

**Key features:**
- Provides connection authentication, transmission encryption, and compression
- Used for direct connections like dial-up, DSL, and point-to-point links
- Supports multiple network layer protocols (IP, IPX, AppleTalk)
- Self-configuring (automatic IP address assignment, etc.)

**PPP layers:**
1. **Physical layer:** Often uses HDLC-like framing
2. **Link Control Protocol (LCP):** Establishes, configures, and tests the connection
3. **Authentication protocols:** PAP, CHAP for user authentication
4. **Network Control Protocols (NCPs):** Configure different network layer protocols

**PPP frame format:**
```
┌────────┬────────┬────────┬────────┬────────┬────────┐
│  Flag  │ Address│Control │Protocol│  Data  │  FCS   │
│(1 byte)│(1 byte)│(1 byte)│(2 bytes)│(variable)│(2/4 bytes)│
└────────┴────────┴────────┴────────┴────────┴────────┘
  0x7E     0xFF     0x03
```

**Frame fields:**
- **Flag:** 0x7E - Marks beginning/end of frame (bit stuffing used within frame)
- **Address:** 0xFF - Broadcast address (PPP doesn't use individual addresses)
- **Control:** 0x03 - Unnumbered information
- **Protocol:** Identifies the network layer protocol in the data field
- **Data:** Variable size containing the encapsulated protocol data
- **FCS (Frame Check Sequence):** 16 or 32-bit CRC for error detection

**PPP connection phases:**
1. **Dead:** Link is not being used
2. **Establishment:** LCP configures and tests the link
3. **Authentication:** Optional phase using PAP or CHAP
4. **Network:** NCP configures different network layer protocols
5. **Open:** Data transfer
6. **Termination:** Link is terminated and returns to Dead phase

**PPP in different contexts:**
- **PPP over Serial:** Original implementation over serial links
- **PPPoE (PPP over Ethernet):** Encapsulates PPP frames within Ethernet frames, commonly used for DSL
- **PPPoA (PPP over ATM):** Encapsulates PPP over ATM, used in some DSL implementations
- **PPPmux:** Multiplexes multiple PPP connections over a single link

### High-level Data Link Control (HDLC)

**What it is:** A bit-oriented, synchronous data link layer protocol developed by ISO.

**Key features:**
- Bit-oriented protocol (works with bit streams)
- Supports both point-to-point and multipoint configurations
- Provides flow control and error recovery
- Used as basis for many other protocols (PPP, LAPB, LAPD)

**HDLC operation modes:**
1. **Normal Response Mode (NRM):** Primary station initiates transfers, secondary only responds
2. **Asynchronous Response Mode (ARM):** Secondary can transmit without permission from primary
3. **Asynchronous Balanced Mode (ABM):** Both stations are equal (combined primary/secondary)

**HDLC frame format:**
```
┌────────┬────────┬────────┬────────┬────────┬────────┐
│  Flag  │ Address│Control │  Data  │  FCS   │  Flag  │
│(1 byte)│(1+ bytes)│(1+ bytes)│(variable)│(2/4 bytes)│(1 byte)│
└────────┴────────┴────────┴────────┴────────┴────────┘
  0x7E                                          0x7E
```

**Frame fields:**
- **Flag:** 0x7E (01111110) - Marks beginning/end of frame
- **Address:** Station address (often 8 bits, extendable)
- **Control:** Identifies frame type and sequence numbers
- **Data:** Variable size containing the encapsulated data
- **FCS (Frame Check Sequence):** 16 or 32-bit CRC for error detection
- **Flag:** 0x7E - Ending flag (may be shared with next frame's beginning flag)

**HDLC frame types:**
1. **Information frames (I-frames):** Carry user data and acknowledgments
2. **Supervisory frames (S-frames):** Provide control functions like ACK, NAK, etc.
3. **Unnumbered frames (U-frames):** Used for link management functions

### Other Data Link Layer Protocols

#### IEEE 802.11 (Wi-Fi)

**What it is:** A family of wireless LAN protocols, commonly known as Wi-Fi.

**Key features:**
- CSMA/CA access method with optional RTS/CTS
- Support for infrastructure and ad-hoc networks
- Various physical layer implementations (different frequency bands and modulations)
- Security features (WEP, WPA, WPA2, WPA3)
- Quality of Service (QoS) support

**802.11 frame format (simplified):**
```
┌────────┬────────┬────────┬────────┬────────┬────────┬────────┬────────┐
│ Frame  │Duration│Address1│Address2│Address3│Sequence│Address4│  Data  │...
│Control │/ID     │        │        │        │Control │(opt)   │        │
└────────┴────────┴────────┴────────┴────────┴────────┴────────┴────────┘
```

**Wi-Fi standards:**

| Standard | Frequency | Max Data Rate | Range (indoor) | Notes |
|----------|-----------|---------------|----------------|-------|
| 802.11a | 5 GHz | 54 Mbps | ~35m | Older standard, less interference |
| 802.11b | 2.4 GHz | 11 Mbps | ~35m | Older standard, good range |
| 802.11g | 2.4 GHz | 54 Mbps | ~38m | Backward compatible with 802.11b |
| 802.11n | 2.4/5 GHz | 600 Mbps | ~70m | MIMO, channel bonding |
| 802.11ac | 5 GHz | 6.9 Gbps | ~35m | Wave 2: MU-MIMO, wider channels |
| 802.11ax | 2.4/5/6 GHz | 9.6 Gbps | ~35m | Wi-Fi 6, OFDMA, better efficiency |

#### Token Ring (IEEE 802.5)

**What it is:** A LAN protocol where a token passes around a ring, and only the station holding the token can transmit.

**Key features:**
- Deterministic access method (token passing)
- No collisions
- Active monitor to manage the ring
- Priority system for accessing the token
- Generally operated at 4 or 16 Mbps
- Largely obsolete today

**Frame format:**
```
┌────┬────┬────┬────┬────┬────┬────┬────┐
│ SD │ AC │ FC │ DA │ SA │Data│ FCS│ ED │
└────┴────┴────┴────┴────┴────┴────┴────┘
```

**Fields:**
- **SD (Starting Delimiter):** Marks frame start
- **AC (Access Control):** Priority and reservation bits
- **FC (Frame Control):** Frame type and control information
- **DA (Destination Address):** Target MAC address
- **SA (Source Address):** Sender MAC address
- **Data:** Variable length payload
- **FCS (Frame Check Sequence):** Error detection
- **ED (Ending Delimiter):** Marks frame end

## Comparison of Data Link Layer Protocols

| Feature | Ethernet (802.3) | PPP | HDLC | WiFi (802.11) |
|---------|-------------------|-----|------|---------------|
| **Medium** | Wired (twisted pair, fiber) | Serial, Ethernet, ATM | Serial links | Wireless |
| **Topology** | Star (switched), Bus (legacy) | Point-to-point | Point-to-point, Multipoint | Star (infrastructure), Mesh (ad-hoc) |
| **Access method** | CSMA/CD (traditional), Switched (modern) | N/A (direct connection) | Polling (NRM), Token-like (ARM, ABM) | CSMA/CA |
| **Error control** | CRC-32 | CRC-16/32 | CRC-16/32 | CRC-32 |
| **Flow control** | None (relies on higher layers) | Optional windowing | Windowing in I-frames | None (relies on higher layers) |
| **Addressing** | 48-bit MAC addresses | No addressing (implied) | 8+ bit addresses | 48-bit MAC addresses |
| **Primary use** | LANs, Data centers | WAN links, Internet access | Synchronous links, Frame Relay, X.25 | Wireless LANs |
| **Maximum frame size** | 1500 bytes typical | Negotiated (typically large) | Variable | 2304 bytes max |
| **Current relevance** | Very high (dominant) | Medium (specific applications) | Low (specialized) | Very high (dominant wireless) |

## Switching Technologies

### Bridges

**What it is:** A network device that connects multiple network segments at the data link layer.

**How it works:**
1. Examines the source MAC address of incoming frames
2. Builds a table mapping MAC addresses to ports
3. Uses the table to forward frames to the appropriate port
4. Floods unknown destinations to all ports except the source
5. Does not forward recognized broadcast domain boundaries

**Key features:**
- Operates at Layer 2 (data link layer)
- Reduces collision domains
- Maintains same broadcast domain
- Simpler than routers (store-and-forward only MAC addresses)
- Can connect different physical media but same protocol

### Switches

**What it is:** An evolution of bridges that connects multiple network segments with dedicated bandwidth between ports.

**How it works:**
1. Similar to bridges, but with dedicated hardware for each port
2. Maintains a MAC address table mapping addresses to ports
3. Allows simultaneous frame forwarding between different port pairs
4. Supports various features like VLANs, STP, link aggregation

**Switch operation modes:**
1. **Store-and-forward:** Receives entire frame, checks for errors, then forwards
2. **Cut-through:** Begins forwarding as soon as the destination address is received
3. **Fragment-free:** Forwards after receiving first 64 bytes (to avoid collision fragments)

**Advanced switch features:**
- **VLANs (Virtual LANs):** Logically segment a switch into multiple independent switches
- **STP (Spanning Tree Protocol):** Prevents loops in networks with redundant paths
- **Link Aggregation:** Combines multiple links for increased bandwidth and redundancy
- **Port Mirroring:** Copies traffic from one port to another for monitoring
- **QoS (Quality of Service):** Prioritizes certain types of traffic

### Comparison of Switching Technologies

| Feature | Hub | Bridge | Switch | Router |
|---------|-----|--------|--------|--------|
| **OSI Layer** | 1 (Physical) | 2 (Data Link) | 2 (Data Link) | 3 (Network) |
| **Addressing used** | None | MAC | MAC | IP |
| **Forward decision based on** | None (repeats to all) | MAC address | MAC address | IP address |
| **Collision domain** | Shared | Separate for each segment | Separate for each port | Separate for each port |
| **Broadcast domain** | Shared | Shared | Shared (per VLAN) | Separate for each interface |
| **Typical latency** | Very low | Medium | Low | Higher |
| **Learning capability** | None | Yes (MAC table) | Yes (MAC table) | Yes (routing table) |
| **Filtering capability** | None | Basic | Advanced | Advanced |

## Virtual LANs (VLANs)

**What it is:** A technology that partitions a single physical network into multiple logical networks, isolating broadcast domains.

**Key benefits:**
- Logical grouping of users by function rather than location
- Containment of broadcast and multicast traffic
- Reduced security risks
- Simplified network management
- Better performance through broadcast containment

**How VLANs work:**
1. Switch ports are assigned to specific VLANs
2. Traffic is isolated between VLANs
3. Special trunk links carry traffic for multiple VLANs
4. VLAN tags (802.1Q) identify which VLAN a frame belongs to

**802.1Q VLAN tagging:**
```
Standard Ethernet frame:
┌────────┬──────┬──────┬───────┬──────┬────────┐
│Preamble│ Dest │ Src  │Length/│ Data │  CRC   │
│  + SFD │ MAC  │ MAC  │Type   │      │        │
└────────┴──────┴──────┴───────┴──────┴────────┘

802.1Q tagged frame:
┌────────┬──────┬──────┬───────┬───────┬──────┬────────┐
│Preamble│ Dest │ Src  │0x8100 │ VLAN  │ Data │  CRC   │
│  + SFD │ MAC  │ MAC  │       │ tag   │      │recalculated│
└────────┴──────┴──────┴───────┴───────┴──────┴────────┘
                               └─ 4 bytes ─┘
```

**VLAN interfaces:**
- **Access port:** Connected to end devices, belongs to a single VLAN
- **Trunk port:** Carries traffic for multiple VLANs between switches
- **Hybrid port:** Can carry both tagged and untagged traffic

**Inter-VLAN routing:**
- Traffic between VLANs requires routing (Layer 3)
- Can be accomplished through:
  1. **Router with multiple interfaces:** Each connected to a different VLAN
  2. **Router-on-a-stick:** Single physical interface with subinterfaces for each VLAN
  3. **Layer 3 switch:** Switch with routing capabilities

## Summary

- The data link layer provides node-to-node data transfer and is responsible for framing, addressing, error control, and flow control
- Framing methods include character count, character/bit stuffing, and violation coding
- MAC addressing provides physical addressing at the data link layer with 48-bit addresses
- Flow control mechanisms like Stop-and-Wait and Sliding Window prevent sender from overwhelming receiver
- Error control methods include error detection codes and ARQ protocols (Stop-and-Wait, Go-Back-N, Selective Repeat)
- Media Access Control techniques determine how devices share the transmission medium
- Common data link protocols include Ethernet, PPP, HDLC, and IEEE 802.11 (Wi-Fi)
- Bridges and switches operate at the data link layer to connect network segments
- Virtual LANs (VLANs) partition physical networks into isolated logical networks
- The data link layer forms the foundation for reliable communication between directly connected devices
