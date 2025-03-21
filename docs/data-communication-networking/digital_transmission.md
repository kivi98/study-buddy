# Digital Transmission Fundamentals

**Course:** Data Communication and Networking  
**Instructor:** Prof. Dr. Networking

## Navigation

[Table of Contents](../README.md) | 
[Data Communication and Networking Home](README.md) | 
[Introduction to Networks](introduction_to_networks.md) | 
[Network Architecture](network_architecture.md) | 
**Digital Transmission** | 
[Multiplexing](multiplexing.md) | 
[Media Access Control](media_access_control.md) | 
[Network Layer](network_layer.md) | 
[Routing Algorithms](routing_algorithms.md) | 
[Data Link Layer](data_link_layer.md) | 
[Error Detection](error_detection.md) | 
[Transport Layer](transport_layer.md) | 
[Application Layer](application_layer.md) | 
[Equations](equations.md)

---

## Signal Fundamentals

### Waves and Signals

**What it is:** A signal is a time-varying physical quantity that carries information. In data communications, signals typically take the form of electromagnetic waves or electrical voltage variations.

**Key characteristics:**
- **Amplitude:** The height or strength of the signal
- **Frequency:** The number of complete cycles per second (measured in Hertz)
- **Phase:** The position of the waveform relative to a reference point
- **Wavelength:** The physical distance between two consecutive points in the same phase

**Key parameters of a sine wave:**
- **Period (T):** The time taken to complete one cycle
- **Frequency (f):** The number of cycles per second (f = 1/T)
- **Amplitude (A):** The maximum value of the signal
- **Phase (φ):** The angle at a particular point in the cycle

**Mathematical representation of a sine wave:**
y(t) = A × sin(2πft + φ)

**Diagram:**
```
    Amplitude
        ↑
        │      /^\
        │     /   \
        │    /     \
        │   /       \
        │  /         \
        │ /           \
        │/             \
--------+---------------\----------→ Time
        │               /\
        │              /  \
        │             /    \
        ↓            
     Period (T) = 1/Frequency
```

### Periodic and Aperiodic Signals

#### Periodic Signals

**What it is:** A signal that completes a pattern within a finite time and repeats that pattern over identical time intervals.

**Characteristics:**
- Repeats at regular intervals
- Has a fixed frequency or set of frequencies
- Can be represented as a sum of sine waves (Fourier series)

**Examples:**
- Sine waves
- Square waves
- Clock signals in digital systems
- Carrier waves in modulation

#### Aperiodic Signals

**What it is:** A signal that doesn't exhibit a repetitive pattern over time.

**Characteristics:**
- No repetition over time
- Contains a continuous spectrum of frequencies
- Cannot be represented by a discrete set of frequencies

**Examples:**
- A single pulse
- Random noise
- Digital data with non-repeating patterns
- Voice and video signals

### Bandwidth-Limited Signals

**What it is:** Signals that contain frequencies only within a specific range or band.

**Key concepts:**
- **Bandwidth:** The range of frequencies contained in a signal
- **Bandwidth limitation:** The restriction of a signal to a specific frequency range
- **Nyquist rate:** The minimum sampling rate required to reconstruct a signal (2 × highest frequency)

**Causes of bandwidth limitation:**
1. **Physical medium characteristics:** All transmission media can pass only a limited range of frequencies
2. **Regulatory restrictions:** Frequency bands are allocated for specific uses
3. **Design constraints:** Equipment is designed to operate within specific frequency ranges
4. **Intentional filtering:** Limiting bandwidth to reduce noise or share spectrum

**Effects of bandwidth limitation:**
1. **Signal distortion:** Loss of information when frequency components are cut off
2. **Intersymbol interference:** Symbols bleed into adjacent symbol times
3. **Maximum data rate constraint:** Limits the speed at which data can be transmitted

**Real-world applications:**
- Telephone networks traditionally limited voice to ~3 kHz bandwidth
- AM radio stations are allocated 10 kHz channels
- FM radio stations are allocated 200 kHz channels
- Wi-Fi channels have 20 or 40 MHz bandwidth per channel

## Baseband vs Broadband

### Baseband Transmission

**What it is:** A transmission technique where the digital signal is sent directly over the medium without frequency modulation.

**How it works:**
1. Digital data is encoded into digital signals (voltage pulses)
2. Signals use the entire bandwidth of the medium
3. Only one signal can be transmitted at a time
4. Bidirectional communication requires either half-duplex or multiple channels

**Characteristics:**
- Simpler technology
- Lower cost
- Digital signal processing
- Limited to shorter distances
- Usually requires amplifiers or repeaters for longer distances

**Real-world applications:**
- Ethernet LANs
- USB connections
- Serial connections (RS-232, RS-485)
- Digital telephone connections

### Broadband Transmission

**What it is:** A transmission technique where multiple signals are transmitted simultaneously over the medium using different frequency bands.

**How it works:**
1. Digital data is modulated onto different carrier frequencies
2. Each signal occupies its own frequency band
3. Multiple signals can be transmitted simultaneously
4. Frequency Division Multiplexing (FDM) is typically used

**Characteristics:**
- More complex technology
- Higher cost
- Analog or digital signal processing
- Suitable for longer distances
- Supports multiple channels simultaneously
- Usually requires modems to convert between digital data and modulated signals

**Real-world applications:**
- Cable television
- DSL internet
- Cable internet
- Cellular networks
- Satellite communications

### Comparison of Baseband and Broadband

| Feature | Baseband | Broadband |
|---------|----------|-----------|
| Signal Type | Digital | Usually analog (modulated) |
| Frequency Usage | Entire bandwidth | Divided into channels |
| Simultaneous Signals | No | Yes |
| Directionality | Unidirectional or bidirectional | Usually unidirectional per frequency |
| Distance | Shorter | Longer |
| Cost | Lower | Higher |
| Equipment | Simpler | More complex |
| Example | Ethernet | Cable TV |

## Transmission and Reception Flow

### Digital Communication System Components

**What it is:** The end-to-end path that data follows from source to destination in a digital communication system.

**Basic components:**
1. **Source:** Generates the information to be transmitted
2. **Source encoder:** Converts information into a digital format (bits)
3. **Channel encoder:** Adds redundancy for error detection/correction
4. **Digital modulator:** Converts digital data into signals suitable for transmission
5. **Channel:** The medium through which signals travel
6. **Digital demodulator:** Converts received signals back into digital data
7. **Channel decoder:** Detects and possibly corrects errors
8. **Source decoder:** Converts digital data back to the original format
9. **Destination:** Receives the transmitted information

**Diagram:**
```
┌────────┐   ┌────────┐   ┌────────┐   ┌────────┐
│ Source │──►│ Source │──►│ Channel│──►│ Digital│
│        │   │ Encoder│   │ Encoder│   │ Modul. │
└────────┘   └────────┘   └────────┘   └───┬────┘
                                          ▼
┌────────┐   ┌────────┐   ┌────────┐   ┌───┴────┐
│  Dest. │◄──│ Source │◄──│ Channel│◄──│ Digital│
│        │   │ Decoder│   │ Decoder│   │ Demod. │
└────────┘   └────────┘   └────────┘   └────────┘
```

### Transmitter Functions

1. **Signal Generation**
   - Convert digital data (0s and 1s) into electrical, optical, or electromagnetic signals
   - Apply appropriate encoding scheme
   - Shape signals to fit channel characteristics

2. **Modulation** (if used)
   - Place digital information onto an analog carrier wave
   - Adjust amplitude, frequency, phase, or combination
   - Match signal to transmission medium requirements

3. **Amplification**
   - Increase signal power to overcome attenuation
   - Maintain signal integrity over distance

4. **Filtering**
   - Remove unwanted frequency components
   - Limit bandwidth to conform to regulations
   - Reduce interference with other signals

### Receiver Functions

1. **Signal Detection**
   - Extract signal from background noise
   - Identify signal boundaries
   - Synchronize with transmitter timing

2. **Demodulation** (if used)
   - Extract original data from modulated carrier
   - Recover amplitude, frequency, or phase information

3. **Amplification and Equalization**
   - Boost received signal strength
   - Compensate for channel distortion
   - Correct frequency-dependent attenuation

4. **Decoding**
   - Convert received signals back to digital data
   - Apply error detection and correction
   - Reconstruct original bit patterns

## Modems

**What it is:** A device that converts digital data into signals suitable for transmission over a specific medium and vice versa (MOdulator-DEModulator).

**Functions:**
1. **Modulation:** Converting digital data to analog signals for transmission
2. **Demodulation:** Converting received analog signals back to digital data
3. **Error correction:** Detecting and correcting transmission errors
4. **Flow control:** Managing data flow between devices
5. **Compression:** Reducing data size to increase effective throughput
6. **Handshaking:** Establishing and managing connections

### Types of Modems

#### Telephone Modems

**What it is:** Devices that convert digital data into audio signals for transmission over the public switched telephone network (PSTN).

**How it works:**
1. Computer sends digital data to the modem
2. Modem converts digital data to audio tones
3. Audio tones travel through telephone network
4. Receiving modem converts audio back to digital data

**Evolution of standards:**
- **300 bps** (Bell 103) - Early standard using FSK
- **1200-2400 bps** (V.22, V.22bis) - Phase-shift keying
- **9600-14400 bps** (V.32, V.32bis) - QAM techniques
- **28800-33600 bps** (V.34) - Advanced QAM with advanced coding
- **56000 bps** (V.90, V.92) - Digital downstream, analog upstream

#### DSL Modems

**What it is:** Devices that provide digital communication over the local telephone network without interfering with voice service.

**Types:**
- **ADSL (Asymmetric DSL):** Faster downstream than upstream
- **SDSL (Symmetric DSL):** Equal speeds in both directions
- **VDSL (Very-high-bitrate DSL):** Higher speeds over shorter distances

**Characteristics:**
- Uses frequencies above voice range (25 kHz to 1.1 MHz)
- Distances limited to approximately 5.5 km from telephone exchange
- Speeds range from 1 Mbps to 100+ Mbps depending on technology and distance

#### Cable Modems

**What it is:** Devices that provide internet access over cable television infrastructure.

**How it works:**
1. Uses unused bandwidth on cable TV network
2. Data travels on different frequencies than TV signals
3. Shared medium with other subscribers in the neighborhood

**Characteristics:**
- Higher bandwidth than telephone modems (10-1000 Mbps)
- Asymmetric speeds (faster download than upload)
- Subject to congestion during peak usage times

#### Fiber Modems (ONT/ONU)

**What it is:** Devices that convert between optical signals in fiber networks and electrical signals used by customer equipment.

**Types:**
- **ONT (Optical Network Terminal):** Used in FTTH (Fiber to the Home)
- **ONU (Optical Network Unit):** Used in fiber-to-the-neighborhood deployments

**Characteristics:**
- Very high speeds (up to 10 Gbps for consumer devices)
- Low latency
- Immune to electromagnetic interference
- Long-distance capabilities

## Encoding Techniques

### Line Coding Fundamentals

**What it is:** Methods for representing digital data on a transmission medium by converting sequences of bits to signals.

**Design goals:**
1. **Reliable clock recovery:** Receiver should be able to synchronize
2. **Error detection:** Should allow detection of transmission errors
3. **Spectral efficiency:** Use available bandwidth effectively
4. **Cost and complexity:** Practical implementation considerations
5. **Noise immunity:** Resistance to interference and signal degradation

### Types of Line Coding

#### Non-Return to Zero (NRZ)

**What it is:** A binary code where the signal level remains constant during a bit interval with no transition to zero between bits of the same value.

**Variants:**
1. **NRZ-L (NRZ-Level):**
   - Logic 1: High voltage level
   - Logic 0: Low voltage level
   - No transition between identical consecutive bits

2. **NRZ-I (NRZ-Invert):**
   - Logic 1: Transition at beginning of bit interval
   - Logic 0: No transition
   - Also called "differential encoding"

**Characteristics:**
- Simple implementation
- No built-in error detection
- Poor synchronization for long sequences of 1s or 0s
- DC component present
- Bandwidth efficient (1 bit per symbol)

**Diagram:**
```
Binary:  0  1  1  0  0  1  0  1
NRZ-L:  ─┐  │  │  ┌─┐  │  ┌─┐
         │  │  │  │ │  │  │ │
        ─┘  └──┘  └─┘  └──┘ └─
            
NRZ-I:  ───┐  ┌───────┐  ┌────
         │  │  │ │  │  │  │
        ─┘  └──┘ └──┘  └──┘
```

#### Manchester Encoding

**What it is:** A line code in which each bit is represented by a transition in the middle of the bit period.

**How it works:**
- Logic 0: High-to-low transition in the middle of the bit
- Logic 1: Low-to-high transition in the middle of the bit
- Transition always occurs in the middle of each bit period

**Characteristics:**
- Self-clocking (guaranteed transition in each bit)
- No DC component
- Easy synchronization
- Error detection capabilities
- Uses twice the bandwidth of NRZ (less efficient)
- Used in original Ethernet (10BASE-T)

**Diagram:**
```
Binary:     0     1     0     1     1     0
             │     │     │     │     │     │
Manchester: ┌┐    ┌┐    ┌┐    ┌┐    ┌┐    ┌┐
           │└┘   │┌┘   │└┘   │┌┘   │┌┘   │└┘
           └─────┘     └─────┘     └─────┘
```

#### Other Common Encoding Schemes

1. **Differential Manchester**
   - Transition in middle of bit always occurs
   - Logic 0: Transition at start of bit interval
   - Logic 1: No transition at start of bit interval
   - Used in Token Ring networks

2. **Bipolar AMI (Alternate Mark Inversion)**
   - Logic 0: No line signal (zero voltage)
   - Logic 1: Alternating positive and negative pulses
   - Good noise immunity
   - No DC component
   - Used in T1/E1 telecommunications

3. **4B/5B**
   - Maps 4-bit groups to 5-bit code words
   - Ensures sufficient transitions for clock recovery
   - Used in FDDI and Fast Ethernet (100BASE-TX)

4. **8B/10B**
   - Maps 8-bit groups to 10-bit code words
   - Balanced DC component
   - Good error detection
   - Used in Gigabit Ethernet, Fibre Channel, PCI Express

### Comparison of Encoding Techniques

| Encoding Scheme | DC Component | Bandwidth Efficiency | Self-Clocking | Error Detection | Complexity |
|-----------------|--------------|----------------------|---------------|----------------|------------|
| NRZ-L | Yes | High | Poor | Poor | Low |
| NRZ-I | Yes | High | Poor | Poor | Low |
| Manchester | No | Low | Excellent | Good | Medium |
| Differential Manchester | No | Low | Excellent | Good | Medium |
| Bipolar AMI | No | Medium | Poor for long 0s | Good | Medium |
| 4B/5B | Possible | Medium | Good | Good | Medium |
| 8B/10B | No | Medium | Excellent | Excellent | High |

## Baud Rate vs Bit Rate

### Baud Rate

**What it is:** The number of signal units (symbols) transmitted per second.

**Formula:**
Baud Rate = 1 / Symbol Duration (in seconds)

**Characteristics:**
- Measures the rate of symbol changes
- Limited by the channel bandwidth
- Physical layer characteristic
- Directly related to the signal's bandwidth requirements

### Bit Rate

**What it is:** The number of bits transmitted per second.

**Formula:**
Bit Rate = Baud Rate × log₂(M)

Where M is the number of distinct symbols in the signaling scheme.

**Characteristics:**
- Measures actual data throughput
- Can be higher than baud rate if multiple bits are encoded per symbol
- Application layer characteristic
- What users experience as "speed"

### Relationship Between Bit Rate and Baud Rate

**For binary signaling (2 levels):**
Bit Rate = Baud Rate (since log₂(2) = 1)

**For multilevel signaling:**
- 4 levels (e.g., 4-QAM): Bit Rate = Baud Rate × 2 (since log₂(4) = 2)
- 8 levels (e.g., 8-PSK): Bit Rate = Baud Rate × 3 (since log₂(8) = 3)
- 16 levels (e.g., 16-QAM): Bit Rate = Baud Rate × 4 (since log₂(16) = 4)

**Example:**
A modem using 16-QAM at 600 baud transmits:
Bit Rate = 600 × 4 = 2400 bps

### Practical Considerations

1. **Symbol density vs. noise immunity**
   - Higher symbol density (more bits per baud) requires better signal-to-noise ratio
   - More susceptible to errors
   - Requires more complex modulation and demodulation

2. **Channel bandwidth limitations**
   - Maximum baud rate is limited by available bandwidth
   - Nyquist limit: Maximum baud rate = 2 × bandwidth

3. **Cost vs. performance tradeoffs**
   - More complex modulation schemes require more expensive equipment
   - Higher bit rates often require more bandwidth or more complex coding

## Channel Capacity and Data Rates

### Measuring Data Carrying Capacity

#### Bandwidth

**What it is:** The range of frequencies that a channel can transmit.

**Measured in:** Hertz (Hz)

**Significance:**
- Fundamental limitation on channel capacity
- Determined by physical characteristics of the medium and electronic components
- Fixed resource that must be used efficiently

#### Throughput

**What it is:** The actual amount of data successfully transferred over a channel per unit time.

**Measured in:** Bits per second (bps)

**Characteristics:**
- Often lower than the theoretical maximum capacity
- Affected by protocol overhead, error rates, congestion, etc.
- What users typically experience
- Can vary over time due to changing conditions

#### Goodput

**What it is:** The actual amount of useful data delivered to the application layer per unit time, excluding protocol overhead and retransmissions.

**Measured in:** Bits per second (bps)

**Characteristics:**
- Always lower than or equal to throughput
- Excludes headers, acknowledgments, retransmissions
- Represents "useful" data delivered to applications
- True measure of application performance

### Maximum Data Rate of a Channel

#### Nyquist Theorem (Noiseless Channel)

**What it is:** A formula that determines the maximum data rate for a noiseless channel with limited bandwidth.

**Formula:**
Maximum Data Rate = 2 × B × log₂(L) bits per second

Where:
- B is the bandwidth of the channel in Hertz
- L is the number of signal levels used

**Real-world application:**
For a noiseless 3 kHz channel using 8 signal levels:
Maximum Data Rate = 2 × 3,000 × log₂(8) = 2 × 3,000 × 3 = 18,000 bps

**Limitations:**
- Assumes a perfect, noiseless channel
- Real channels always have some noise
- Theoretical upper limit that can't be achieved in practice

#### Shannon-Hartley Theorem (Noisy Channel)

**What it is:** A formula that determines the maximum data rate for a noisy channel with limited bandwidth.

**Formula:**
C = B × log₂(1 + SNR) bits per second

Where:
- C is the channel capacity in bits per second
- B is the bandwidth of the channel in Hertz
- SNR is the Signal-to-Noise Ratio (expressed as a power ratio, not in dB)

**SNR in dB conversion:**
SNR (power ratio) = 10^(SNR_dB/10)

**Real-world application:**
For a 3 kHz channel with an SNR of 30 dB:
SNR (power ratio) = 10^(30/10) = 10^3 = 1,000
C = 3,000 × log₂(1 + 1,000) = 3,000 × log₂(1,001) ≈ 3,000 × 10 = 30,000 bps

**Significance:**
- Establishes the theoretical maximum capacity of a noisy channel
- Fundamental limit that cannot be exceeded regardless of coding or modulation
- Guides design of modulation schemes and error correction codes

### Factors Affecting Channel Capacity

1. **Bandwidth**
   - Directly proportional to capacity
   - Limited by physical medium and regulatory constraints
   - Expensive resource that must be shared

2. **Signal-to-Noise Ratio (SNR)**
   - Better SNR allows higher capacity
   - Affected by transmission power, distance, interference
   - Can be improved with better equipment, shielding, amplification

3. **Modulation Technique**
   - More efficient techniques approach Shannon limit
   - Advanced techniques (QAM, OFDM) maximize bits per symbol
   - Complex modulation requires better SNR

4. **Coding Schemes**
   - Error correction codes allow operation closer to Shannon limit
   - Modern codes (LDPC, Turbo codes) approach theoretical limits
   - Tradeoff between overhead and error resilience

## Summary

- Digital signals can be periodic or aperiodic, with bandwidth limitations affecting the maximum achievable data rate
- Baseband systems transmit digital signals directly, while broadband systems use modulation on carrier frequencies
- The transmission and reception process involves multiple stages including encoding, modulation, and error correction
- Modems convert between digital data and signals appropriate for various transmission media
- Line coding techniques like NRZ and Manchester encoding provide different tradeoffs between bandwidth efficiency and reliability
- Baud rate measures signal changes per second, while bit rate measures actual data transmission speed
- Channel capacity is governed by the Nyquist and Shannon theorems, establishing fundamental limits based on bandwidth and noise
