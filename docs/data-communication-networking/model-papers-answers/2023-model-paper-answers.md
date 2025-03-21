# Data Communication and Networking - 2023 Model Paper Answers

## Question 01 (25 marks)

### (a) Assume that you are watching a movie stored in a server in America using your mobile phone.

#### (i) A possible network diagram and four possible network types:

```
[User Mobile Phone] <---> [Cellular Network] <---> [Internet] <---> [CDN Edge Server] <---> [Origin Server in America]
```

**Four possible network types involved:**

1. **Personal Area Network (PAN)**: If the user is using Bluetooth headphones or casting to a nearby device.
2. **Cellular Network (WAN)**: The mobile data network (4G/5G) connecting the phone to the internet.
3. **Metropolitan Area Network (MAN)**: Regional network infrastructure connecting cellular towers to internet exchange points.
4. **Wide Area Network (WAN)**: The global internet connecting different continents and countries.

#### (ii) Three possible data communication mediums:

1. **Radio Waves (Wireless)**
   - **Strength**: Mobility and convenience, allowing users to access content from anywhere with cellular coverage.
   - **Weakness**: Susceptible to interference, signal degradation due to obstacles, and limited bandwidth compared to wired options.

2. **Fiber Optic Cables**
   - **Strength**: Very high bandwidth capacity and low latency for intercontinental data transfer, immune to electromagnetic interference.
   - **Weakness**: Expensive to install and repair, especially for undersea cables connecting continents.

3. **Copper Cables**
   - **Strength**: Widely deployed infrastructure, relatively inexpensive for last-mile connections.
   - **Weakness**: Limited bandwidth compared to fiber optics, signal degradation over long distances, susceptible to electromagnetic interference.

#### (iii) Three networking protocols involved:

1. **HTTP/HTTPS (Application Layer)**
   - **Responsibility**: Handles the request and delivery of web content (the movie) between the client (mobile phone) and server. HTTPS adds encryption for secure transmission.

2. **TCP (Transport Layer)**
   - **Responsibility**: Ensures reliable, ordered delivery of the video stream data packets, handles flow control and congestion control to maintain smooth playback.

3. **IP (Network Layer)**
   - **Responsibility**: Routes packets across the global internet from the server in America to the user's mobile phone, handling addressing and best-path determination.

### (b) Why do we have layered networking functionalities? Name three layers of TCP/IP five-layer model and explain their role.

**Why we have layered networking functionalities:**

Layered networking provides:
- **Modularity**: Each layer performs a specific function, making the system easier to design and maintain.
- **Standardization**: Clearly defined interfaces between layers allow different vendors to develop compatible products.
- **Flexibility**: Layers can be modified independently without affecting other layers.
- **Troubleshooting**: Problems can be isolated to specific layers, making debugging easier.
- **Evolution**: Individual layers can evolve without requiring changes to the entire stack.

**Three layers of the TCP/IP five-layer model:**

1. **Application Layer (Layer 5)**
   - **Role**: Provides network services directly to end-users and applications.
   - **Functions**: Implements specific protocols for user services like HTTP for web browsing, SMTP for email, FTP for file transfers, DNS for name resolution.
   - **Example Protocols**: HTTP, HTTPS, FTP, SMTP, DNS, SSH, Telnet.

2. **Transport Layer (Layer 4)**
   - **Role**: Provides end-to-end communication services for applications.
   - **Functions**: Handles segmentation of data, flow control, error control, and congestion control.
   - **Example Protocols**: TCP (connection-oriented, reliable delivery) and UDP (connectionless, best-effort delivery).

3. **Network Layer (Layer 3)**
   - **Role**: Handles routing of packets across different networks.
   - **Functions**: Logical addressing (IP addresses), routing, and forwarding of packets.
   - **Example Protocols**: IP (IPv4, IPv6), ICMP, OSPF, BGP.

### (c) Terms used to refer to data in TCP/IP five-layer model, encapsulation and decapsulation.

**Terms used to refer to data in each layer of the TCP/IP model:**

1. **Application Layer**: Data or Messages
2. **Transport Layer**: Segments (TCP) or Datagrams (UDP)
3. **Network Layer**: Packets
4. **Data Link Layer**: Frames
5. **Physical Layer**: Bits

**Encapsulation:**
Encapsulation is the process of adding header (and sometimes trailer) information to data as it moves down the protocol stack. Each layer adds its own header containing control information needed by the corresponding layer on the receiving end.

**Decapsulation:**
Decapsulation is the reverse process where headers (and trailers) are removed as data moves up the protocol stack at the receiving end. Each layer strips off its corresponding header and passes the remaining data to the layer above.

**Why encapsulation and decapsulation are needed in networking devices:**

- **Switches (Data Link Layer devices)**:
  - Encapsulation: Add MAC addresses in frame headers for local delivery.
  - Decapsulation: Remove and process frame headers to determine where to forward data.
  - Purpose: Enables switches to forward frames based on MAC addresses within a local network.

- **Routers (Network Layer devices)**:
  - Encapsulation: Add new IP headers when forwarding packets between different networks.
  - Decapsulation: Remove and process IP headers to determine routing decisions.
  - Purpose: Enables routers to forward packets between different networks based on IP addresses.

These processes allow networking devices to:
- Maintain separation of concerns between different network functions
- Process only the information relevant to their operation
- Forward data appropriately across heterogeneous networks
- Implement security and access control policies

## Question 02 (25 marks)

### (a) Issues with nodes of different communication speeds and finite buffers over a noisy channel.

#### (i) Two possible issues due to noises in the communication channel:

1. **Data Corruption**: Noise can alter bits during transmission, causing the received data to be different from what was sent. This leads to errors in the received information.

2. **Packet Loss**: Severe noise can corrupt packets to the point where they cannot be recognized or are rejected by error detection mechanisms, leading to complete loss of information.

#### (ii) Solutions to the above issues:

1. **For Data Corruption**:
   - **Error Detection Codes**: Use techniques like parity bits, checksums, or Cyclic Redundancy Check (CRC) to detect errors in the received data.
   - **Error Correction Codes**: Implement Forward Error Correction (FEC) techniques like Hamming codes or Reed-Solomon codes that can not only detect but also correct certain types of errors without retransmission.

2. **For Packet Loss**:
   - **Acknowledgment-based Protocols**: Implement protocols where the receiver acknowledges correctly received packets, and the sender retransmits packets that are not acknowledged within a timeout period.
   - **Negative Acknowledgment (NACK)**: The receiver can explicitly request retransmission of packets it determines are missing or corrupted.

#### (iii) More efficient mechanism while guaranteeing a solution:

The simplest solution of "stop-and-wait" (where the sender waits for an acknowledgment before sending the next packet) can be inefficient, especially with high latency. A more efficient approach is:

**Sliding Window Protocol**:
- Allows multiple packets to be "in flight" simultaneously without waiting for individual acknowledgments
- Sender maintains a window of packets that can be sent without acknowledgment
- Receiver maintains a window of packets it can accept
- As acknowledgments arrive, the sender's window "slides" forward to allow new packets to be sent
- Variants include:
  - **Go-Back-N**: If an error is detected, all subsequent packets are retransmitted
  - **Selective Repeat**: Only the specific corrupted packets are retransmitted

This approach significantly improves efficiency while still ensuring reliability by:
- Utilizing the channel more effectively during the time that would otherwise be spent waiting
- Handling multiple packets simultaneously
- Adapting the window size based on network conditions

### (b) How can a sending node know traffic and adjust its sending speed accordingly?

A sending node can adapt to changing traffic conditions through:

1. **Congestion Control Mechanisms**:
   - **TCP Congestion Window**: Dynamically adjusts the number of packets in transit based on network conditions
   - **Slow Start**: Begins with a small window size and exponentially increases until congestion is detected
   - **Congestion Avoidance**: After detecting congestion, linearly increases window size to probe for available bandwidth
   - **Fast Recovery**: Quickly recovers from isolated packet losses without drastically reducing throughput

2. **Feedback Mechanisms**:
   - **Acknowledgment Timing**: Measuring the time between sending a packet and receiving its acknowledgment (RTT - Round Trip Time)
   - **Duplicate ACKs**: Multiple acknowledgments for the same sequence number indicate packet loss
   - **Explicit Congestion Notification (ECN)**: Network devices mark packets when experiencing congestion
   - **ICMP Source Quench**: (Legacy) Explicit messages from routers requesting reduced sending rate

3. **Adaptive Algorithms**:
   - **RTT Estimation**: Maintaining a smoothed average of round-trip times to detect increasing delays
   - **Timeout Calculation**: Adjusting retransmission timeouts based on observed network conditions
   - **Rate-based Adjustments**: Directly controlling sending rate based on observed throughput and loss rates

### (c) Three channelizing methods to share a communication channel among multiple nodes.

1. **Frequency Division Multiplexing (FDM)**:
   - **Description**: Divides the available bandwidth into separate frequency bands or channels
   - **Operation**: Each user is allocated a specific frequency band for transmission
   - **Advantages**: Simple implementation, no synchronization required, no contention between users
   - **Disadvantages**: Inefficient use of bandwidth if a user is not transmitting, requires guard bands between channels to prevent interference
   - **Applications**: Radio broadcasting, television broadcasting, cable systems

2. **Time Division Multiplexing (TDM)**:
   - **Description**: Divides the channel into time slots, with each user allocated specific slots
   - **Operation**: Users take turns using the full bandwidth of the channel for short time periods
   - **Advantages**: Full bandwidth available to each user during their time slot, simple implementation
   - **Disadvantages**: Inefficient if users don't use their allocated time slots, requires synchronization
   - **Applications**: Digital telephone systems, GSM cellular networks, SONET/SDH networks

3. **Code Division Multiplexing (CDM)**:
   - **Description**: Users share the same frequency band and time slots but use unique codes to distinguish their transmissions
   - **Operation**: Each user's data is encoded with a unique spreading code; receivers use the same code to extract the specific user's data
   - **Advantages**: Resistant to interference and jamming, can accommodate variable data rates, provides privacy
   - **Disadvantages**: More complex implementation, requires precise power control, limited by code orthogonality
   - **Applications**: CDMA cellular networks, GPS, military communications

### (d) Hamming (7,4) code with even parity for codeword 1011011.

#### (i) Is the codeword correct?

To determine if the codeword 1011011 is correct using Hamming (7,4) code with even parity:

1. In Hamming (7,4), positions 1, 2, and 4 are parity bits (positions are numbered from 1 to 7)
2. The remaining positions (3, 5, 6, 7) contain data bits

For the codeword 1011011, the bits are distributed as follows:
- Position 1: 1 (parity bit)
- Position 2: 0 (parity bit)
- Position 3: 1 (data bit)
- Position 4: 1 (parity bit)
- Position 5: 0 (data bit)
- Position 6: 1 (data bit)
- Position 7: 1 (data bit)

Let's check each parity bit:
- Parity bit 1 (position 1) checks positions 1, 3, 5, 7: 1 + 1 + 0 + 1 = 3 (odd parity ✗)
- Parity bit 2 (position 2) checks positions 2, 3, 6, 7: 0 + 1 + 1 + 1 = 3 (odd parity ✗)
- Parity bit 4 (position 4) checks positions 4, 5, 6, 7: 1 + 0 + 1 + 1 = 3 (odd parity ✗)

Since all parity checks fail (odd count when we need even parity), the codeword is not correct.

#### (ii) Error correction:

a) **How many errors are there?**
   
Based on the parity checks, we can identify the position of the error:
- Parity bit 1: Fails (odd parity)
- Parity bit 2: Fails (odd parity)
- Parity bit 4: Fails (odd parity)

The error position is determined by adding the positions of the failed parity checks:
Error position = 1 + 2 + 4 = 7

Therefore, there is 1 error, and it's at position 7.

b) **Can you correct the error?**

Yes, we can correct the error. The bit at position 7 should be flipped:
- Original codeword: 1011011
- Corrected codeword: 1011010 (changing the last bit from 1 to 0)

Let's verify our correction by checking the parity bits again:
- Parity bit 1 (position 1) checks positions 1, 3, 5, 7: 1 + 1 + 0 + 0 = 2 (even parity ✓)
- Parity bit 2 (position 2) checks positions 2, 3, 6, 7: 0 + 1 + 1 + 0 = 2 (even parity ✓)
- Parity bit 4 (position 4) checks positions 4, 5, 6, 7: 1 + 0 + 1 + 0 = 2 (even parity ✓)

All parity checks now pass with even parity, confirming that our error correction was successful.

The Hamming (7,4) code can detect and correct single-bit errors, which is the case here.

## Question 03 (25 marks)

### (a) How a web browser finds the right server on the internet to retrieve content.

When a user types "http://www.graduate.sjp.ac.lk/" in the address bar of a web browser, the following steps occur to find and retrieve content:

1. **URL Parsing**:
   - The browser parses the URL into components: protocol (http), domain name (www.graduate.sjp.ac.lk), and path (/).

2. **DNS Resolution**:
   - The browser needs to convert the domain name to an IP address
   - First, it checks its local DNS cache
   - If not found, it sends a DNS query to the configured DNS resolver (typically provided by the ISP)
   - The DNS resolver follows these steps if it doesn't have the answer cached:
     - Contacts a root DNS server to find the authoritative server for the .lk TLD
     - Contacts the .lk TLD server to find the authoritative server for ac.lk
     - Contacts the ac.lk DNS server to find the authoritative server for sjp.ac.lk
     - Contacts the sjp.ac.lk DNS server to get the IP address for www.graduate.sjp.ac.lk
   - The IP address is returned to the browser and cached for future use

3. **TCP Connection Establishment**:
   - The browser initiates a TCP connection to the web server at the resolved IP address on port 80 (default for HTTP)
   - This involves a three-way handshake:
     - Browser sends SYN packet
     - Server responds with SYN-ACK
     - Browser sends ACK to complete the connection

4. **HTTP Request**:
   - The browser sends an HTTP GET request for the specified resource:
     ```
     GET / HTTP/1.1
     Host: www.graduate.sjp.ac.lk
     User-Agent: [Browser information]
     Accept: text/html,application/xhtml+xml,...
     ...
     ```

5. **Server Processing**:
   - The web server receives the request
   - It processes the request, identifying the requested resource (/ in this case)
   - The server retrieves or generates the content (typically an HTML page)

6. **HTTP Response**:
   - The server sends back an HTTP response with the requested content:
     ```
     HTTP/1.1 200 OK
     Date: [Current date and time]
     Server: [Server software]
     Content-Type: text/html; charset=UTF-8
     Content-Length: [Size of the content]
     
     <!DOCTYPE html>
     <html>
     ...
     </html>
     ```

7. **Content Rendering**:
   - The browser receives the HTML content
   - It parses the HTML and begins rendering the page
   - If the HTML references additional resources (CSS, JavaScript, images), the browser initiates separate requests for each

8. **TCP Connection Closure**:
   - After all content is transferred, the TCP connection may be closed or kept alive for subsequent requests (depending on HTTP headers)

This entire process typically happens in a fraction of a second, allowing users to quickly access web content from servers located anywhere in the world.

### (b) How the right content goes to the right tab and how a server sends the right content to the right user.

#### How the right content goes to the right tab:

1. **Connection and Process Management**:
   - Modern browsers use a multi-process architecture where each tab runs in a separate process or thread
   - Each tab maintains its own set of connections to web servers
   - The browser's main process coordinates these tab processes

2. **Request Identification**:
   - When a browser initiates an HTTP request from a specific tab, it associates that request with the tab's process ID or thread ID
   - The browser maintains an internal mapping between network connections and the tabs that initiated them

3. **Response Routing**:
   - When responses arrive from the network, the browser examines which connection they came from
   - Using its internal mapping, the browser routes the response data to the appropriate tab process
   - The tab process then processes and renders the content

4. **State Management**:
   - Each tab maintains its own DOM (Document Object Model), JavaScript execution context, and rendering pipeline
   - This isolation ensures that content and scripts from one tab don't interfere with other tabs
   - The browser's resource manager may share cached resources between tabs for efficiency

#### How a server sends the right content to the right user:

1. **Connection-Based Identification**:
   - Each user establishes a unique TCP connection to the server
   - The server maintains separate connection contexts for each client
   - Responses are sent back over the same connection from which the request came

2. **Session Management**:
   - For persistent identification across multiple requests or connections, servers use session mechanisms:
   
   - **Cookies**:
     - Server sends a Set-Cookie header with a unique session identifier
     - Browser stores this cookie and sends it with subsequent requests to the same domain
     - Server uses the cookie to identify the user and retrieve their session data
   
   - **Session IDs in URLs**:
     - Session identifiers can be embedded in URLs (e.g., example.com/shop?sessionid=12345)
     - Less common due to security concerns and sharing issues
   
   - **HTTP Authentication**:
     - Basic or Digest authentication credentials are sent with each request
     - Provides persistent identification without cookies

3. **State Storage**:
   - Server maintains session state for each user, typically in:
     - Memory (for small sites)
     - Databases (for larger applications)
     - Distributed caches (for high-traffic sites)
   - This state contains user-specific information like shopping carts, preferences, and authentication status

4. **Load Balancing Considerations**:
   - In distributed systems with multiple servers:
     - Sticky sessions ensure a user always connects to the same server
     - Centralized session storage allows any server to handle any user
     - Session replication synchronizes session data across servers

5. **Security Measures**:
   - HTTPS encrypts the connection to prevent session hijacking
   - Token validation prevents cross-site request forgery
   - Session timeouts limit the window of vulnerability
   - IP validation can provide additional verification (though less reliable with mobile users)

This combination of connection management, session tracking, and state storage allows web applications to maintain user context and deliver personalized content to millions of concurrent users.

## Question 04 (25 marks)

### (a) Single source shortest path routing algorithm to find the final routing table of node A.

Using the Bellman-Ford algorithm to find the shortest paths from node A to all other nodes in the network shown in the diagram:

**Network Diagram:**
The network consists of nodes A through H with the following connections and costs:
- A to B: 1
- A to D: -1 (negative cost, which is why Bellman-Ford is more appropriate than Dijkstra's algorithm)
- B to C: 2
- B to E: 4
- C to F: 3
- D to C: 5
- D to G: 2
- E to F: -1
- E to H: 2
- F to G: 1
- F to H: 3
- G to F: 1

**Step 1: Initialize**
- Set distance to A = 0 (source node)
- Set distance to all other nodes = ∞ (infinity)
- Initialize predecessor for each node as undefined

**Step 2: Relax all edges |V|-1 times**
- For each edge (u, v) with weight w, if distance[u] + w < distance[v], update distance[v] = distance[u] + w and predecessor[v] = u
- Repeat this process for all edges |V|-1 times (in this case, 7 times)

**Step 3: Check for negative cycles**
- For each edge (u, v) with weight w, if distance[u] + w < distance[v], a negative cycle exists
- Bellman-Ford can detect negative cycles, though they aren't present in this network

**Execution of the Algorithm:**

**Initialization:**
- distance[A] = 0, all other distances = ∞
- All predecessors are undefined

**Iteration 1:**
- Process edge A→B: distance[B] = 0 + 1 = 1, predecessor[B] = A
- Process edge A→D: distance[D] = 0 + (-1) = -1, predecessor[D] = A
- Process edge B→C: distance[C] = 1 + 2 = 3, predecessor[C] = B
- Process edge B→E: distance[E] = 1 + 4 = 5, predecessor[E] = B
- Process edge C→F: distance[F] = 3 + 3 = 6, predecessor[F] = C
- Process edge D→C: distance[C] = min(3, -1 + 5) = 3, no change
- Process edge D→G: distance[G] = -1 + 2 = 1, predecessor[G] = D
- Process edge E→F: distance[F] = min(6, 5 + (-1)) = 4, predecessor[F] = E
- Process edge E→H: distance[H] = 5 + 2 = 7, predecessor[H] = E
- Process edge F→G: distance[G] = min(1, 4 + 1) = 1, no change
- Process edge F→H: distance[H] = min(7, 4 + 3) = 7, no change
- Process edge G→F: distance[F] = min(4, 1 + 1) = 2, predecessor[F] = G

**Iteration 2:**
- Most edges don't cause updates, but we check:
- Process edge E→F: distance[F] = min(2, 5 + (-1)) = 2, no change
- Process edge F→H: distance[H] = min(7, 2 + 3) = 5, predecessor[H] = F

**Iterations 3-7:**
- No further updates to distances occur
- The algorithm converges to the shortest paths

**Final distances and predecessors:**
- distance[A] = 0, predecessor[A] = undefined
- distance[B] = 1, predecessor[B] = A
- distance[C] = 3, predecessor[C] = B
- distance[D] = -1, predecessor[D] = A
- distance[E] = 5, predecessor[E] = B
- distance[F] = 2, predecessor[F] = G
- distance[G] = 1, predecessor[G] = D
- distance[H] = 5, predecessor[H] = F

**Final Routing Table for Node A:**

| Destination | Distance | Next Hop |
|-------------|----------|----------|
| A | 0 | Direct |
| B | 1 | B |
| C | 3 | B |
| D | -1 | D |
| E | 5 | B |
| F | 2 | D → G |
| G | 1 | D |
| H | 5 | D → G → F |

**Explanation:**
- For destinations B and D, node A sends packets directly to these nodes.
- For node C, the shortest path is through B (A → B → C) with total cost 3.
- For node E, the shortest path is through B (A → B → E) with total cost 5.
- For node F, the shortest path is through D and G (A → D → G → F) with total cost 2.
- For node G, the shortest path is through D (A → D → G) with total cost 1.
- For node H, the shortest path is through D, G, and F (A → D → G → F → H) with total cost 5.

**Advantages of Bellman-Ford for this network:**
1. **Handles negative edge weights**: Unlike Dijkstra's algorithm, Bellman-Ford correctly handles the negative edge weights in this network (A to D: -1 and E to F: -1).
2. **Detects negative cycles**: If the network contained a negative cycle, Bellman-Ford would detect it (though there are none in this case).
3. **Guarantees correct results**: For networks with negative edges but no negative cycles, Bellman-Ford guarantees the correct shortest paths.

The Bellman-Ford algorithm is particularly useful in routing protocols like RIP (Routing Information Protocol) where routers exchange distance vector information to compute optimal paths.

### (b) IP addressing for a university network.

Given:
- A computer in the university has IP address 19.163.182.146/20
- Science faculty: ~700 computers
- Engineering faculty: ~450 computers
- Medical faculty: ~250 computers
- Commerce faculty: ~1000 computers
- Computer Science dept: ~300 computers
- Mathematics dept: ~125 computers
- Statistics dept: ~118 computers

#### (i) What is the subnet mask of the Medical faculty?

First, let's determine the university's overall network:
- IP address: 19.163.182.146/20
- Network address: 19.163.176.0/20 (the first 20 bits define the network)
- This gives us a range from 19.163.176.0 to 19.163.191.255
- Total addresses: 2^(32-20) = 2^12 = 4,096 addresses

Now, we need to divide this address space among the faculties:
- Group the faculties by size: Commerce (1000), Science (700), Engineering (450), Medical (250)
- Commerce needs at least 1000 addresses: 2^10 = 1024 addresses (10 host bits)
- Science needs at least 700 addresses: 2^10 = 1024 addresses (10 host bits)
- Engineering needs at least 450 addresses: 2^9 = 512 addresses (9 host bits)
- Medical needs at least 250 addresses: 2^8 = 256 addresses (8 host bits)

For the Medical faculty with 250 computers, we need a subnet that can accommodate at least 250 addresses.
The smallest power of 2 that exceeds 250 is 2^8 = 256.

Therefore, the subnet mask for the Medical faculty is:
- Prefix length: 32 - 8 = 24
- Subnet mask: /24 or 255.255.255.0

#### (ii) What is the network address of the subnet that the above IP address belongs to?

The IP address 19.163.182.146/20 belongs to the network:
- First 20 bits define the network
- Converting to binary and masking with the /20 prefix:
  19.163.182.146 = 00010011.10100011.10110110.10010010
  /20 mask        = 11111111.11111111.11110000.00000000
  Network address = 00010011.10100011.10110000.00000000 = 19.163.176.0

Therefore, the network address is 19.163.176.0/20.

#### (iii) What is the last usable IP address of the above subnet?

For a /20 network:
- Network address: 19.163.176.0
- Broadcast address: 19.163.191.255
- Usable range: 19.163.176.1 to 19.163.191.254

Therefore, the last usable IP address of the subnet is 19.163.191.254.
