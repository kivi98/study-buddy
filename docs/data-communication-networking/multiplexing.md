# Multiplexing and Multiple Access

**Course:** Data Communication and Networking  
**Instructor:** Prof. Dr. Networking

## Navigation

[Table of Contents](../README.md) | 
[Data Communication and Networking Home](README.md) | 
[Introduction to Networks](introduction_to_networks.md) | 
[Network Architecture](network_architecture.md) | 
[Digital Transmission](digital_transmission.md) | 
**Multiplexing** | 
[Media Access Control](media_access_control.md) | 
[Network Layer](network_layer.md) | 
[Routing Algorithms](routing_algorithms.md) | 
[Data Link Layer](data_link_layer.md) | 
[Error Detection](error_detection.md) | 
[Transport Layer](transport_layer.md) | 
[Application Layer](application_layer.md) | 
[Equations](equations.md)

---

## Multiplexing Fundamentals

### What is Multiplexing?

**What it is:** A technique that allows multiple signals to share a single transmission medium or communication channel simultaneously.

**Why it's needed:**
- Transmission media are expensive resources (especially long-distance links)
- Most communication resources have higher capacity than a single user needs
- Efficiently sharing resources reduces cost and increases utilization

**Key components:**
1. **Multiplexer (MUX):** Combines multiple input signals into a single output signal
2. **Demultiplexer (DEMUX):** Separates the multiplexed signal back into original component signals
3. **Channel:** The shared transmission medium

**Diagram:**
```
                          Shared Medium
   ┌─────┐              ┌────────────┐              ┌─────┐
   │Input│              │            │              │Output│
   │  1  │─────┐        │            │        ┌─────│  1  │
   └─────┘     │        │            │        │     └─────┘
               │        │            │        │            
   ┌─────┐     │        │            │        │     ┌─────┐
   │Input│     │ ┌────┐ │            │ ┌────┐ │     │Output│
   │  2  │─────┼─│MUX │─│────────────│─│DEMUX│─┼─────│  2  │
   └─────┘     │ └────┘ │            │ └────┘ │     └─────┘
               │        │            │        │            
   ┌─────┐     │        │            │        │     ┌─────┐
   │Input│     │        │            │        │     │Output│
   │  3  │─────┘        │            │        └─────│  3  │
   └─────┘              │            │              └─────┘

```

### Types of Multiplexing

There are several multiplexing techniques, each dividing the communication channel in a different way:

1. **Frequency Division Multiplexing (FDM):** Divides the channel by frequency
2. **Time Division Multiplexing (TDM):** Divides the channel by time
3. **Code Division Multiple Access (CDMA):** Divides the channel by unique codes
4. **Wavelength Division Multiplexing (WDM):** Divides optical fiber by wavelength
5. **Space Division Multiple Access (SDMA):** Divides by spatial location or direction

Each technique has advantages and disadvantages depending on the application, transmission medium, and requirements.

## Frequency Division Multiplexing (FDM)

**What it is:** A multiplexing technique that assigns each signal a different carrier frequency within the available bandwidth of the channel.

**How it works:**
1. The available bandwidth is divided into multiple non-overlapping frequency bands
2. Each signal is modulated onto a different carrier frequency
3. All modulated signals are combined and transmitted simultaneously
4. At the receiver, filters separate the signals based on their frequency
5. Each signal is demodulated to recover the original data

**Key characteristics:**
- Signals are transmitted simultaneously but on different frequencies
- Guard bands (unused frequency ranges) separate channels to prevent interference
- Typically used for analog signals, though can be used for digital with appropriate modulation
- No synchronization is required between channels
- Hardware implementation is relatively straightforward

**Diagram:**
```
  Power
    ↑
    │   ┌──┐  ┌──┐  ┌──┐  ┌──┐
    │   │  │  │  │  │  │  │  │
    │   │  │  │  │  │  │  │  │
    │   │  │  │  │  │  │  │  │
    │   │  │  │  │  │  │  │  │
    │   │  │  │  │  │  │  │  │
    └───┴──┴──┴──┴──┴──┴──┴──┴───→ Frequency
        Ch1   Ch2   Ch3   Ch4
          Guard bands
```

**Real-world applications:**
- AM and FM radio broadcasting
- Television broadcasting
- Cable television
- First-generation cellular telephone systems
- DSL Internet service
- Early satellite communication systems

### FDMA (Frequency Division Multiple Access)

**What it is:** The application of FDM techniques to allow multiple users to share a communication medium.

**How it works:**
1. The available bandwidth is divided into channels
2. Each user is assigned a specific frequency channel
3. The user has exclusive use of that channel for the duration of the connection
4. Channels are separated by guard bands to prevent interference

**Characteristics:**
- Simple implementation
- No timing synchronization required between users
- Limited by available bandwidth
- Inefficient when traffic is bursty
- Relatively immune to near-far problem (where closer transmitters drown out distant ones)

**Real-world applications:**
- First-generation (1G) cellular systems (AMPS)
- Satellite communication systems
- Cable TV systems
- Maritime and aviation radio communications

## Time Division Multiplexing (TDM)

**What it is:** A multiplexing technique that assigns each signal a different time slot on the shared communication channel.

**How it works:**
1. The time domain is divided into fixed-length frames
2. Each frame is further divided into time slots
3. Each input signal is assigned a specific time slot in each frame
4. The multiplexer samples each input signal in turn and transmits the samples in their assigned time slots
5. The demultiplexer at the receiving end separates the samples based on their time slots and reconstructs the original signals

### Synchronous TDM

**What it is:** A form of TDM where each input source is allocated a fixed time slot in each frame, regardless of whether it has data to transmit.

**Characteristics:**
- Time slots are allocated in a fixed, predefined pattern
- Simpler implementation
- Potential wasted capacity if sources don't always have data
- No addressing information needed (position in frame identifies source)
- Requires precise synchronization between transmitter and receiver

**Diagram:**
```
              Frame                    Frame
   ┌───────────────────────┐ ┌───────────────────────┐
   │ 1 │ 2 │ 3 │ 4 │ 1 │ 2 │ │ 3 │ 4 │ 1 │ 2 │ 3 │ 4 │ ...
   └───────────────────────┘ └───────────────────────┘
     ↑   ↑   ↑   ↑
     │   │   │   └── Time slot for source 4
     │   │   └────── Time slot for source 3
     │   └────────── Time slot for source 2
     └────────────── Time slot for source 1
```

**Real-world applications:**
- Digital telephone systems (T1/E1 lines)
- ISDN (Integrated Services Digital Network)
- SONET/SDH optical networks
- GSM cellular systems (combined with FDMA)

### Statistical TDM (Asynchronous TDM)

**What it is:** A form of TDM where time slots are allocated dynamically based on demand.

**How it works:**
1. The multiplexer scans the input lines for data
2. When data is found, it's placed in the next available time slot along with addressing information
3. Only active sources are allocated time slots
4. The demultiplexer uses the addressing information to route data to the correct destination

**Characteristics:**
- More efficient use of bandwidth compared to synchronous TDM
- More complex implementation requiring addressing information
- Variable frame length possible
- Better suited for bursty traffic patterns
- Potential for congestion if too many sources are active simultaneously

**Diagram:**
```
   ┌─────────────────────────────────────────┐
   │H1│D1│H3│D3│H4│D4│H1│D1│H2│D2│H3│D3│...   │
   └─────────────────────────────────────────┘
     ↑  ↑
     │  └── Data from source identified in header
     └───── Header with address information
```

**Real-world applications:**
- Packet switching networks
- ATM (Asynchronous Transfer Mode)
- Computer network routers and switches
- Satellite communication with multiple bursty users

### TDMA (Time Division Multiple Access)

**What it is:** The application of TDM techniques to allow multiple users to share a communication medium.

**How it works:**
1. The time domain is divided into frames
2. Each frame contains time slots allocated to different users
3. Each user transmits only during their assigned time slot
4. Guard times between slots prevent interference due to timing variations

**Characteristics:**
- Efficient for constant bit rate traffic
- Requires precise timing synchronization
- Users can transmit at full channel bandwidth during their time slot
- Inefficient for users with varying bandwidth requirements
- Requires guard times to prevent overlap

**Real-world applications:**
- Second-generation (2G) digital cellular systems (GSM)
- Satellite communication systems
- Wireless LANs
- Digital cordless phone systems
- Global Positioning System (GPS)

## Code Division Multiple Access (CDMA)

**What it is:** A multiplexing technique that allows multiple signals to occupy the same frequency band simultaneously by using unique spreading codes for each signal.

**How it works:**
1. Each user is assigned a unique code sequence (spreading code)
2. The user's data is multiplied by their spreading code (spreading)
3. All users transmit on the same frequency simultaneously
4. The receiver uses the same code to extract the original data (despreading)
5. Signals with different codes appear as random noise to receivers using a different code

### CDMA Principles

**Key concepts:**
1. **Spreading:** Each bit of user data is represented by multiple chips (bits) of the spreading code
2. **Processing gain:** The ratio of the spread bandwidth to the original bandwidth
3. **Orthogonality:** Codes are designed to have minimal cross-correlation
4. **Near-far problem:** Signals from closer transmitters can overwhelm signals from distant ones

**Mathematical representation:**
- Original data: d = {d₁, d₂, ..., dₙ} where dᵢ ∈ {-1, +1}
- Spreading code: c = {c₁, c₂, ..., cₘ} where cⱼ ∈ {-1, +1}
- Spread signal: s = d × c (each bit dᵢ is multiplied by the entire code c)

### CDMA Code Generation

**What it is:** The process of creating orthogonal or pseudo-orthogonal codes for CDMA systems.

**Requirements for good codes:**
1. Good autocorrelation properties (code correlates strongly with itself only when perfectly aligned)
2. Good cross-correlation properties (different codes should have minimal correlation)
3. Balance of +1s and -1s for spectral efficiency

**Common types of codes:**
1. **Walsh codes:** Perfectly orthogonal but limited in number
2. **PN sequences:** Pseudo-random binary sequences with good correlation properties
3. **Gold codes:** Generated by XORing specific pairs of maximum-length sequences
4. **Kasami sequences:** Provide larger sets of codes with good correlation properties

### CDMA Encode/Decode Process

**Encoding:**
1. Each user multiplies their data bit (+1 or -1) by their assigned code sequence
2. The resulting spread signal is transmitted
3. Multiple spread signals are added together in the channel

**Example with 2 users:**
- User 1 data bit: +1, Code: [+1, -1, +1, -1]
- User 2 data bit: -1, Code: [+1, +1, -1, -1]
- User 1 spread signal: [+1, -1, +1, -1] × (+1) = [+1, -1, +1, -1]
- User 2 spread signal: [+1, +1, -1, -1] × (-1) = [-1, -1, +1, +1]
- Combined signal on channel: [+1, -1, +1, -1] + [-1, -1, +1, +1] = [0, -2, +2, 0]

**Decoding:**
1. The receiver multiplies the received signal by the desired user's code
2. The result is summed and normalized
3. A positive sum indicates a +1 data bit, a negative sum indicates a -1 data bit

**Example (continuing from above):**
- Received signal: [0, -2, +2, 0]
- To decode User 1:
  - [0, -2, +2, 0] × [+1, -1, +1, -1] = [0, +2, +2, 0] = +4 (normalized: +1)
- To decode User 2:
  - [0, -2, +2, 0] × [+1, +1, -1, -1] = [0, -2, -2, 0] = -4 (normalized: -1)

**Diagram:**
```
User 1 Data:     1      0      1      0
                 │      │      │      │
                 ▼      ▼      ▼      ▼
User 1 Code:   [+---] [+---] [+---] [+---]
Spread Signal: [+---] [----] [+---] [----]
                 ▲      ▲      ▲      ▲
                 │      │      │      │
                 +      +      +      +
                 ▲      ▲      ▲      ▲
                 │      │      │      │
User 2 Code:   [++--] [++--] [++--] [++--]
Spread Signal: [++--] [----] [++--] [----]
                 ▲      ▲      ▲      ▲
                 │      │      │      │
User 2 Data:     1      0      1      0

Combined Signal → Transmitted → Received

Receiver for User 1:
Received Signal × User 1 Code = User 1 Data
```

### Advantages and Challenges of CDMA

**Advantages:**
1. **Capacity:** Can support more users than traditional FDMA or TDMA
2. **Frequency reuse:** The same frequency can be used in adjacent cells
3. **Multipath resistance:** Spread spectrum signals are resistant to multipath fading
4. **Privacy:** Difficult to intercept without knowing the spreading code
5. **Graceful degradation:** Performance gradually declines as users increase

**Challenges:**
1. **Near-far problem:** Power control is critical to prevent closer users from overwhelming distant ones
2. **Synchronization:** Requires precise timing for optimal performance
3. **Complexity:** More complex than FDMA or TDMA
4. **Self-interference:** Imperfect orthogonality causes interference between users

**Real-world applications:**
- Third-generation (3G) cellular systems (WCDMA, CDMA2000)
- GPS (Global Positioning System)
- Wireless LANs (IEEE 802.11b uses a form of CDMA)
- Satellite communications
- Military communication systems

## Phase-Shift Keying (PSK)

**What it is:** A digital modulation scheme that conveys data by changing the phase of a reference signal (carrier wave).

**How it works:**
1. The carrier signal's phase is shifted to represent different digital values
2. The receiver detects these phase shifts to recover the original data
3. Multiple bits can be encoded using multiple phase shifts

### Types of PSK

#### Binary Phase-Shift Keying (BPSK)

**What it is:** The simplest form of PSK using two phases separated by 180° to represent binary 0 and 1.

**Characteristics:**
- Most robust PSK variant (least susceptible to noise)
- Only 1 bit per symbol (low spectral efficiency)
- Used in applications requiring high reliability but modest data rates
- Phase shifts: 0° and 180°

**Diagram:**
```
Binary:     0         1         0         1
           ┌─┐       ┌─┐       ┌─┐       ┌─┐
           │ │       │ │       │ │       │ │
Signal:    │ │       │ │       │ │       │ │
       ────┘ └───────┘ └───────┘ └───────┘ └────
           0°        180°       0°        180°
```

#### Quadrature Phase-Shift Keying (QPSK)

**What it is:** A PSK variant using four phases (usually 45°, 135°, 225°, and 315°) to encode two bits per symbol.

**Characteristics:**
- Twice the spectral efficiency of BPSK (2 bits per symbol)
- Good balance between robustness and data rate
- Used in many modern digital communication systems
- Can be viewed as two BPSK signals in quadrature (I and Q channels)

**Constellation diagram:**
```
     Q
     ↑
     │
  01 │ 00
     │
 ────┼──── → I
     │
  11 │ 10
     │
```

#### Higher-Order PSK

**What it is:** PSK schemes using 8, 16, or more phase positions to encode more bits per symbol.

**Examples:**
- 8-PSK: 3 bits per symbol, 8 phase positions
- 16-PSK: 4 bits per symbol, 16 phase positions

**Characteristics:**
- Higher spectral efficiency
- More susceptible to noise and interference
- Requires higher signal-to-noise ratio
- Used in high-bandwidth applications where spectrum is limited

**Real-world applications:**
- Satellite communications
- Wireless LANs (802.11 variants)
- Digital television broadcasting
- Cable modems
- Cellular communications

## Wavelength Division Multiplexing (WDM)

**What it is:** A multiplexing technique used in fiber optic communications that combines multiple optical signals on a single fiber by using different wavelengths (colors) of laser light.

**How it works:**
1. Each data stream modulates a laser with a unique wavelength
2. All wavelengths are combined using an optical multiplexer
3. The combined light travels through a single optical fiber
4. At the receiver, an optical demultiplexer separates the wavelengths
5. Each wavelength is detected separately to recover the original data

**Key components:**
1. **Laser transmitters:** Generate light at specific wavelengths
2. **Optical multiplexers/demultiplexers:** Combine/separate different wavelengths
3. **Optical fiber:** Carries all wavelengths simultaneously
4. **Optical amplifiers:** Boost signal strength without conversion to electrical signals
5. **Optical receivers:** Convert light back to electrical signals

**Types of WDM:**
1. **Coarse WDM (CWDM):** Uses wider channel spacing (20 nm), typically 8-16 channels
2. **Dense WDM (DWDM):** Uses narrow channel spacing (0.4-1.6 nm), supporting 40-160 channels
3. **Ultra-dense WDM (UDWDM):** Even narrower spacing, supporting hundreds of channels

**Diagram:**
```
  Data 1 ───► Laser λ₁ ──┐
                          │
  Data 2 ───► Laser λ₂ ──┼──► Optical  ───► Fiber ───► Optical  ───┬──► Receiver ───► Data 1
                          │     MUX              DEMUX             │
  Data 3 ───► Laser λ₃ ──┼─                                 ─────┼──► Receiver ───► Data 2
                          │                                        │
  Data 4 ───► Laser λ₄ ──┘                                        └──► Receiver ───► Data 4
```

**Real-world applications:**
- Long-haul telecommunications networks
- Metropolitan area networks
- Data center interconnects
- Cable television networks
- Submarine communication cables

## Space Division Multiple Access (SDMA)

**What it is:** A multiplexing technique that uses the spatial separation of users or devices to allow multiple transmissions to occur simultaneously using the same time and frequency resources.

**How it works:**
1. Signals are separated based on their physical location or direction
2. Directional antennas or smart antenna arrays focus energy in specific directions
3. Multiple users can transmit on the same frequency at the same time from different locations
4. The system exploits the spatial dimension to increase capacity

**Key technologies:**
1. **Directional antennas:** Focus RF energy in specific directions
2. **Phased array antennas:** Electronically steer beams toward specific users
3. **MIMO (Multiple-Input Multiple-Output):** Use multiple antennas to create spatial streams
4. **Beamforming:** Adaptively focus signals toward intended receivers

**Characteristics:**
- Increases system capacity without additional spectrum
- Reduces interference between users
- More complex hardware and signal processing required
- Performance depends on spatial separation between users
- Works best in environments with rich scattering

**Diagram:**
```
                       ┌──────┐
                   ┌───►User A◄───┐
                   │   └──────┘   │
                   │              │
┌───────┐      ┌───┴───┐      ┌───┴───┐
│ Base  │      │Antenna│      │Antenna│
│Station│◄────►│Beam 1 │      │Beam 2 │
└───────┘      └───┬───┘      └───┬───┘
                   │              │
                   │   ┌──────┐   │
                   └───►User B◄───┘
                       └──────┘
```

**Real-world applications:**
- 4G and 5G cellular networks (Massive MIMO)
- Satellite communications (spot beams)
- Wi-Fi access points with MIMO technology
- Point-to-multipoint fixed wireless systems
- Radar systems

## Comparison of Multiplexing Techniques

| Feature | FDM | TDM | CDMA | WDM | SDMA |
|---------|-----|-----|------|-----|------|
| **Division basis** | Frequency | Time | Code | Wavelength | Space |
| **Typical applications** | Radio, TV, Cable | Telephony, Data | Cellular, Military | Fiber optics | Cellular, Satellite |
| **Complexity** | Low | Medium | High | Medium-High | Very High |
| **Synchronization requirements** | Low | High | Medium | Low | Medium |
| **Bandwidth efficiency** | Medium | Medium-High | High | Very High | High |
| **Interference susceptibility** | Medium | Low | Medium | Very Low | Medium |
| **Guard bands/times needed?** | Yes | Yes | No | Yes | No |
| **Near-far problem?** | No | No | Yes | No | Limited |
| **Hardware cost** | Low | Medium | High | High | Very High |

## Summary

- Multiplexing allows multiple signals to share a single transmission medium, increasing efficiency and reducing costs
- Frequency Division Multiplexing (FDM) divides the channel by frequency, with applications in radio, TV, and early cellular systems
- Time Division Multiplexing (TDM) divides the channel by time slots, used in digital telephone systems and 2G cellular networks
- Code Division Multiple Access (CDMA) uses unique spreading codes to allow users to share the same frequency simultaneously
- Phase-Shift Keying (PSK) changes the phase of a carrier signal to represent digital data, with variants like BPSK and QPSK
- Wavelength Division Multiplexing (WDM) combines multiple optical signals on a single fiber using different wavelengths of light
- Space Division Multiple Access (SDMA) uses spatial separation and directional antennas to increase system capacity
- Each multiplexing technique offers different tradeoffs in terms of complexity, efficiency, and application suitability
