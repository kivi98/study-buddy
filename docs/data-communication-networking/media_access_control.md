# Media Access Control

**Course:** Data Communication and Networking  
**Instructor:** Prof. Dr. Networking

## Navigation

[Table of Contents](../README.md) | 
[Data Communication and Networking Home](README.md) | 
[Introduction to Networks](introduction_to_networks.md) | 
[Network Architecture](network_architecture.md) | 
[Digital Transmission](digital_transmission.md) | 
[Multiplexing](multiplexing.md) | 
**Media Access Control** | 
[Network Layer](network_layer.md) | 
[Routing Algorithms](routing_algorithms.md) | 
[Data Link Layer](data_link_layer.md) | 
[Error Detection](error_detection.md) | 
[Transport Layer](transport_layer.md) | 
[Application Layer](application_layer.md) | 
[Equations](equations.md)

---

## Media Access Control Fundamentals

### What is Media Access Control?

**What it is:** A set of protocols and mechanisms that determine how multiple devices share and access a common communication medium or channel.

**Why it's needed:**
- Prevent collisions when multiple devices attempt to transmit simultaneously
- Ensure fair access to the shared medium
- Maximize channel utilization
- Minimize delay and overhead

**Key responsibilities:**
1. Determine when a device can transmit data
2. Handle collisions if they occur
3. Retransmit data after collisions or losses
4. Enforce fair access to the medium

**Types of networks requiring MAC:**
- Local Area Networks (LANs)
- Wireless networks
- Cable networks
- Satellite networks
- Any network where multiple devices share a common medium

### Media Access Control Approaches

MAC protocols can be broadly categorized into three main approaches:

1. **Contention-Based (Random Access):**
   - Devices compete for access to the medium
   - No central coordination
   - Examples: ALOHA, CSMA/CD, CSMA/CA

2. **Controlled Access:**
   - Devices take turns accessing the medium
   - Access is coordinated through a schedule or token
   - Examples: Token Ring, FDDI, Polling

3. **Channelization:**
   - The available bandwidth is divided among devices
   - Each device gets dedicated resources
   - Examples: FDMA, TDMA, CDMA

## Contention-Based Network Access

### Pure ALOHA

**What it is:** The earliest random access protocol developed at the University of Hawaii in the 1970s. Devices transmit whenever they have data, without checking if the medium is busy.

**How it works:**
1. When a station has data to send, it transmits immediately
2. If a collision occurs (detected by lack of acknowledgment), the station waits for a random time interval
3. After the random backoff time, the station retransmits the data
4. This process continues until the transmission succeeds

**Diagram:**
```
  Station A: ─────▇▇▇▇───────────────▇▇▇▇─────────
  Station B: ───────────▇▇▇▇────────────────▇▇▇▇───
             
  Channel:   ─────▇▇▇▇───▇▇▇▇────────▇▇▇▇───▇▇▇▇───
                       ╱╲           
                      ╱  ╲  
                     ╱    ╲                 
                    ╱      ╲
                   ╱        ╲
                  ╱ Collision╲
                 ╱            ╲
```

**Pure ALOHA Efficiency:**

The maximum channel utilization (throughput) for Pure ALOHA is:

S = G × e^(-2G)

Where:
- S is the throughput (successful transmissions per frame time)
- G is the offered load (attempted transmissions per frame time)

The maximum throughput is 18.4% when G = 0.5, meaning that Pure ALOHA can utilize at most 18.4% of the channel capacity.

**Characteristics:**
- Simple implementation
- Does not require synchronization
- Very inefficient under heavy load
- Performs poorly as the number of users increases
- No carrier sensing (transmits without checking medium)

**Real-world applications:**
- Early satellite communications
- Historical significance as the first random access protocol
- Rarely used in modern systems due to low efficiency

### Slotted ALOHA

**What it is:** An improvement over Pure ALOHA that divides time into discrete slots and requires stations to transmit only at the beginning of a slot.

**How it works:**
1. Time is divided into equal slots, with slot size equal to the frame transmission time
2. Stations can only begin transmission at the start of a slot
3. If a collision occurs, the station waits a random number of slots before retransmitting
4. All stations must be synchronized to recognize slot boundaries

**Diagram:**
```
  Time slots: |    1    |    2    |    3    |    4    |    5    |
  Station A:  |    ▇▇   |         |    ▇▇   |         |         |
  Station B:  |         |    ▇▇   |         |    ▇▇   |         |
  Station C:  |         |         |    ▇▇   |         |    ▇▇   |
              |         |         |         |         |         |
  Channel:    |    ▇▇   |    ▇▇   |   ▇▇▇▇  |    ▇▇   |    ▇▇   |
                                      ╱╲
                                     ╱  ╲
                                    ╱    ╲
                                   ╱Colli-╲
                                  ╱  sion  ╲
```

**Slotted ALOHA Efficiency:**

The maximum channel utilization for Slotted ALOHA is:

S = G × e^(-G)

Where:
- S is the throughput (successful transmissions per slot time)
- G is the offered load (attempted transmissions per slot time)

The maximum throughput is 36.8% when G = 1, making Slotted ALOHA twice as efficient as Pure ALOHA.

**Characteristics:**
- Requires synchronization between all stations
- Better performance than Pure ALOHA
- Still relatively inefficient under heavy load
- No carrier sensing
- Simple implementation

**Pure ALOHA vs. Slotted ALOHA**

| Feature | Pure ALOHA | Slotted ALOHA |
|---------|------------|---------------|
| **Maximum throughput** | 18.4% | 36.8% |
| **Synchronization** | Not required | Required |
| **Transmission timing** | Anytime | Only at beginning of slots |
| **Collision vulnerability** | Two full frame times | One slot time |
| **Implementation complexity** | Simpler | More complex |
| **Real-world usage** | Rare | Limited |

### Carrier Sense Multiple Access (CSMA)

**What it is:** A MAC protocol that improves upon ALOHA by having stations listen to the channel before transmitting.

**How it works:**
1. Before transmitting, a station listens to the medium to determine if it's idle or busy
2. If the medium is idle, the station transmits immediately
3. If the medium is busy, the station defers transmission using one of several persistence strategies
4. If a collision occurs, the station backs off and tries again later

**CSMA Persistence Strategies:**

1. **1-Persistent CSMA:**
   - If the medium is idle, transmit immediately (with probability 1)
   - If the medium is busy, continuously listen until the medium becomes idle, then transmit immediately
   - Most aggressive strategy with highest collision probability

2. **Non-Persistent CSMA:**
   - If the medium is idle, transmit immediately
   - If the medium is busy, wait a random time before sensing the channel again
   - Less aggressive, lower throughput but fewer collisions

3. **p-Persistent CSMA:**
   - If the medium is idle, transmit with probability p and defer with probability (1-p)
   - If deferred, wait for the next time slot and check again
   - If the medium is busy, continuously listen until the medium becomes idle
   - Balance between throughput and collision probability

**Characteristics:**
- Better performance than ALOHA due to carrier sensing
- Still vulnerable to collisions due to propagation delay
- Different persistence strategies offer tradeoffs between throughput and collision probability
- Well-suited for networks with moderate traffic

**Diagram:**
```
  Station A detects idle channel and transmits:
  
  Station A: ───────▇▇▇▇▇▇▇▇────────────────
  
  Station B checks channel before transmitting,
  detects busy channel, and waits:
  
  Station B: ─────────────────────▇▇▇▇▇▇▇▇──
             ↑       ↑         ↑
             │       │         │
       Channel    Channel    Channel
        idle      busy        idle
```

### CSMA/CD (Collision Detection)

**What it is:** An enhancement to CSMA that allows stations to detect collisions during transmission and stop transmitting immediately to reduce channel wastage.

**How it works:**
1. Station listens to the medium before transmitting (carrier sense)
2. If the medium is idle, the station begins transmitting
3. While transmitting, the station simultaneously monitors the medium for collisions
4. If a collision is detected, the station immediately stops transmitting and sends a jam signal
5. After a collision, stations wait for a random backoff time before trying again
6. The backoff time is typically determined by the Binary Exponential Backoff algorithm

**Binary Exponential Backoff:**
1. After the first collision, choose a random backoff time from {0, 1} slot times
2. After the second collision, choose from {0, 1, 2, 3} slot times
3. After the third collision, choose from {0, 1, 2, 3, 4, 5, 6, 7} slot times
4. In general, after the nth collision, choose from {0, 1, 2, ..., 2^n - 1} slot times
5. Maximum number of retries is typically limited (e.g., 16 for Ethernet)

**CSMA/CD Efficiency:**

The efficiency of CSMA/CD depends on the ratio of propagation delay to transmission time:

Efficiency = 1 / (1 + 5a)

Where:
- a = propagation delay / transmission time

This shows that CSMA/CD efficiency decreases with increasing network size (larger propagation delay) or decreasing packet size (shorter transmission time).

### Collision Detection in Wired Networks

**What it is:** The mechanism by which stations detect collisions in a wired network such as Ethernet.

**How it works:**
1. Transmitter monitors the voltage level on the cable while transmitting
2. If the observed signal is different from what was transmitted, a collision is detected
3. The transmitter sends a jam signal to ensure all stations detect the collision
4. All stations involved in the collision back off for a random time

**Key requirements:**
- Signal attenuation must not be too high (limits network size)
- Minimum frame size must be large enough to ensure collisions are detected before transmission completes
- In Ethernet, minimum frame size (64 bytes) ensures collision detection for networks up to 2500 meters

**Real-world application:**
- Traditional Ethernet (10BASE5, 10BASE2, 10BASE-T)
- The basis for IEEE 802.3 standards

### Collision Detection in Wireless Networks

**What it is:** The mechanism used to handle collisions in wireless networks, which face unique challenges compared to wired networks.

**Challenges in wireless environments:**
1. **Hidden node problem:** Nodes may not be able to detect each other's transmissions
2. **Signal strength variance:** Difficult to detect collisions by comparing transmitted and received signals
3. **High signal attenuation:** Transmitted signal is much stronger than any received collision signal
4. **Half-duplex nature:** Most wireless transceivers cannot transmit and receive simultaneously

**Solution approach (CSMA/CA):**
1. Use collision avoidance instead of collision detection
2. Rely on acknowledgments from receiver to detect transmission success
3. Use RTS/CTS mechanism to reduce hidden node problem
4. Employ random backoff before transmission to reduce collision probability

**Real-world application:**
- IEEE 802.11 wireless LANs (Wi-Fi)
- Various wireless sensor networks

## "Taking Turns" MAC Protocols

**What they are:** MAC protocols that avoid collisions by having nodes take turns accessing the medium rather than competing for it.

### Polling

**What it is:** A MAC protocol where a central controller (master) polls each station (slave) in sequence, giving it permission to transmit.

**How it works:**
1. The master maintains a list of all slaves
2. The master sends a poll message to each slave in order
3. When a slave receives a poll message, it can transmit data if it has any
4. After transmitting data (or indicating it has none), control returns to the master
5. The master moves to the next slave in the list

**Diagram:**
```
     ┌───┐  1. Poll  ┌───┐
     │   │---------->│   │
     │   │           │   │
     │   │  2. Data  │   │
     │   │<----------│   │
     │   │           │   │
     │   │  3. Poll  │   │
     │ M │---------->│ S │
     │ A │           │ T │
     │ S │  4. Data  │ A │
     │ T │<----------│ T │
     │ E │           │ I │
     │ R │  5. Poll  │ O │
     │   │---------->│ N │
     │   │           │ S │
     │   │  6. No    │   │
     │   │<-- Data   │   │
     │   │           │   │
     └───┘           └───┘
```

**Advantages:**
- No collisions
- Guaranteed maximum delay for each station
- Simple implementation
- Supports different priorities through polling frequency

**Disadvantages:**
- Polling overhead
- Single point of failure (master)
- Latency increases with number of stations
- Inefficient if many stations have no data to transmit

**Real-world applications:**
- Bluetooth networks (master-slave configuration)
- Industrial control networks
- Point-of-sale systems
- Some wireless sensor networks

### Token Passing

**What it is:** A MAC protocol where the stations form a logical ring and pass a special control packet (token) that grants permission to transmit.

**How it works:**
1. Stations are arranged in a logical ring (not necessarily matching physical topology)
2. A special control packet (token) circulates around the ring
3. Only the station holding the token can transmit data
4. After transmitting data (or if it has none), the station passes the token to the next station
5. If the token is lost, a token recovery procedure is initiated

**Diagram:**
```
        Token passing in a logical ring
        
                ┌───┐
            ┌───│ A │◄────┐
            │   └───┘     │
            │             │
            ▼             │
          ┌───┐         ┌───┐
          │ B │         │ D │
          └───┘         └───┘
            │             ▲
            │             │
            ▼             │
          ┌───┐           │
          │ C │───────────┘
          └───┘
```

**Advantages:**
- No collisions
- Fair access (each station gets equal opportunities)
- Predictable performance under heavy load
- Guaranteed maximum delay for each station
- No central point of failure

**Disadvantages:**
- Token overhead
- Complexity of token management and recovery
- Sensitivity to station failures
- Delay under light load (must wait for token)

**Real-world applications:**
- Token Ring networks (IEEE 802.5)
- FDDI (Fiber Distributed Data Interface)
- Some industrial networks
- Manufacturing automation networks

## Wireless MAC Challenges

### Hidden Node Problem

**What it is:** A situation in wireless networks where a node can communicate with an access point but cannot detect transmissions from other nodes communicating with the same access point due to distance or obstacles.

**Why it happens:**
- Radio waves have limited range
- Obstacles can block radio signals
- Signal strength decreases with distance
- Nodes outside each other's range cannot detect transmissions

**Consequences:**
- Increased collisions
- Reduced throughput
- Unpredictable delays
- Unfair medium access

**Diagram:**
```
       Node A             Access Point             Node B
       ┌───┐                ┌───┐                  ┌───┐
       │   │◄──────────────►│   │◄────────────────►│   │
       └───┘                └───┘                  └───┘
        
         ╱                                           ╲
        ╱                                             ╲
       ╱       Cannot detect each other's signals      ╲
      ╱                                                 ╲
     ╱                                                   ╲
    ╱                                                     ╲
   ╱                                                       ╲

   Node A and B can both communicate with the access point,
   but cannot detect each other's transmissions.
```

**Solutions:**
1. **RTS/CTS mechanism:** Described in detail below
2. **Increasing transmit power:** Can reduce hidden nodes but increases interference
3. **Adding access points:** Reduces distance between nodes and APs
4. **Directional antennas:** Can help in some scenarios

### Exposed Terminal Problem

**What it is:** A situation in wireless networks where a node is prevented from transmitting to another node because a nearby transmitter has indicated that it is using the medium, even though the intended receiver would not experience interference.

**Why it happens:**
- Node defers transmission after hearing another node's transmission
- The intended receiver is outside the interference range of the other transmitter
- Carrier sensing is too conservative, reducing spatial reuse

**Consequences:**
- Unnecessary transmission delays
- Reduced network throughput
- Inefficient use of the wireless medium
- Unfair medium access

**Diagram:**
```
       Node A             Node B             Node C            Node D
       ┌───┐               ┌───┐             ┌───┐             ┌───┐
       │   │◄─────────────►│   │◄───────────►│   │◄───────────►│   │
       └───┘               └───┘             └───┘             └───┘
        
       Communications range of B      Communications range of C
       └───────────────────┘          └───────────────────┘
        
        
   If B is transmitting to A, C can hear B's transmission and will
   defer its own transmission to D, even though this transmission
   would not interfere with the A-B communication.
```

**Solutions:**
1. **Power control:** Adjust transmit power to minimize interference zone
2. **Directional antennas:** Focus signal toward intended receiver
3. **Advanced MAC protocols:** Protocols that consider spatial reuse
4. **Network allocation vector (NAV):** Used in 802.11 to indicate expected transmission duration

### RTS/CTS Mechanism

**What it is:** A handshaking procedure used in wireless networks to reduce collisions caused by hidden nodes. RTS stands for "Request to Send" and CTS stands for "Clear to Send."

**How it works:**
1. Before transmitting data, the sender transmits a short RTS frame to the receiver
2. The RTS includes the sender address, receiver address, and duration of the upcoming transmission
3. If the receiver is available, it responds with a CTS frame
4. The CTS also includes the duration of the upcoming transmission
5. All nodes within range of either the sender or receiver set their Network Allocation Vector (NAV) to avoid transmitting during this time
6. The sender proceeds with data transmission after receiving the CTS
7. The receiver acknowledges successful reception with an ACK

**Diagram:**
```
   Sender                                           Receiver
   ┌───┐                                            ┌───┐
   │   │──────────── RTS (duration) ───────────────►│   │
   │   │                                            │   │
   │   │◄─────────── CTS (duration) ────────────────│   │
   │   │                                            │   │
   │   │─────────────── DATA ──────────────────────►│   │
   │   │                                            │   │
   │   │◄──────────────── ACK ───────────────────── │   │
   └───┘                                            └───┘
   
   Other nodes in range of sender       Other nodes in range of receiver
   ┌───┐                                ┌───┐
   │   │ NAV set by RTS                 │   │ NAV set by CTS
   └───┘                                └───┘
```

**Advantages:**
1. **Reduces hidden node problem:** Even if nodes cannot hear each other, they will hear either RTS or CTS
2. **Reserves channel:** The duration information in RTS/CTS helps nodes avoid transmitting during ongoing communications
3. **Reduces collision probability for large frames:** Only the small RTS frames risk collision
4. **Improves throughput:** Especially in networks with hidden nodes and large data frames

**Disadvantages:**
1. **Overhead:** RTS/CTS exchanges add overhead, which can be significant for small data frames
2. **Delay:** Additional handshaking increases latency
3. **Not perfect:** Does not completely eliminate hidden node problem
4. **Exposed node problem may remain:** CTS can cause unnecessary deferrals

**When to use RTS/CTS:**
- Networks with many hidden nodes
- When transmitting large frames
- In environments with high contention
- In high-interference environments

**Real-world applications:**
- IEEE 802.11 wireless LANs (Wi-Fi)
- RTS/CTS threshold can be configured to use the mechanism only for frames larger than a certain size
- Some wireless sensor networks
- Ad hoc wireless networks

## Comparison of MAC Protocols

| Protocol | Collision Handling | Throughput under Light Load | Throughput under Heavy Load | Fairness | Implementation Complexity | Examples |
|----------|-------------------|----------------------------|----------------------------|----------|--------------------------|----------|
| Pure ALOHA | None (just retry) | Good | Poor (18.4% max) | Poor | Very Low | Early satellite networks |
| Slotted ALOHA | Synchronized slots | Good | Poor (36.8% max) | Fair | Low | Early satellite networks |
| CSMA | Carrier sensing | Very Good | Variable | Poor | Medium | Early Ethernet variants |
| CSMA/CD | Detect and abort | Excellent | Good | Fair | Medium | Ethernet (IEEE 802.3) |
| CSMA/CA | Avoid collisions | Good | Fair | Fair | Medium-High | Wi-Fi (IEEE 802.11) |
| Token Passing | No collisions | Fair (token overhead) | Excellent | Excellent | High | Token Ring, FDDI |
| Polling | No collisions | Fair (polling overhead) | Good | Configurable | Medium | Bluetooth, industrial networks |

## Summary

- Media Access Control protocols determine how multiple devices share a common communication medium
- Pure ALOHA and Slotted ALOHA are simple but inefficient protocols with maximum throughputs of 18.4% and 36.8% respectively
- CSMA improves efficiency by having stations listen before transmitting, while CSMA/CD further enhances performance by detecting collisions
- Wireless networks face unique challenges like the hidden node and exposed terminal problems, which are partially addressed by mechanisms like RTS/CTS
- "Taking turns" protocols like polling and token passing eliminate collisions but introduce overhead and complexity
- The choice of MAC protocol depends on network characteristics, application requirements, and the balance between simplicity and efficiency
