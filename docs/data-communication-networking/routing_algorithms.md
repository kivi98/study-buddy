# Routing Algorithms

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
**Routing Algorithms** | 
[Data Link Layer](data_link_layer.md) | 
[Error Detection](error_detection.md) | 
[Transport Layer](transport_layer.md) | 
[Application Layer](application_layer.md) | 
[Equations](equations.md)

---

## Introduction to Routing

### What is Routing?

**What it is:** The process of selecting paths in a network along which to send network traffic. Routing directs packet forwarding from source to destination through intermediate nodes.

**Key components:**
1. **Routers:** Devices that forward packets between networks
2. **Routing tables:** Data structures in routers that store routing information
3. **Routing protocols:** Mechanisms that exchange routing information between routers
4. **Metrics:** Measurements used to determine the "best" path

**Routing vs. Forwarding:**
- **Routing:** The process of determining the path for data to take
- **Forwarding:** The process of moving packets from an input interface to the appropriate output interface

**The routing problem:**
```
                        B
                      / | \
                     /  |  \
                    /   |   \
                   A    |    E
                    \   |   /
                     \  |  /
                      \ | /
                        C
                        |
                        |
                        D
```

In the network above, how should a packet be routed from A to E? Multiple paths exist:
- A → B → E
- A → C → E
- A → C → B → E
- A → B → C → E

Routing algorithms determine the "best" path based on various metrics.

### Routing Metrics

**What they are:** Values used to determine the desirability of a route. Different metrics prioritize different network characteristics.

**Common routing metrics:**
1. **Hop count:** Number of routers a packet must traverse
2. **Bandwidth:** Data transfer capacity of the links
3. **Delay:** Time taken for a packet to travel from source to destination
4. **Cost:** An abstract value assigned by administrators
5. **Reliability:** Rate of packet loss on the link
6. **Load:** Amount of activity on a network resource
7. **MTU (Maximum Transmission Unit):** Largest packet size that can be transmitted

**Metric usage example:**
```
          2 Mbps          10 Mbps
     A ───────────── B ────────────── C
              5ms           5ms
              
             50 Mbps
     A ───────────────────── C
              15ms
```

- **Hop count:** A → C is better (1 hop vs. 2 hops)
- **Bandwidth:** A → B → C is better (bottleneck 2 Mbps vs. 50 Mbps)
- **Delay:** A → B → C is better (10ms vs. 15ms)

The "best" path depends on which metrics are prioritized.

### Routing Types

#### Static Routing

**What it is:** Manually configured routes that do not change automatically in response to network changes.

**Characteristics:**
- Routes are manually entered by network administrators
- No overhead of routing protocol communications
- Does not adapt to network changes without manual intervention
- Suitable for small networks or specific routes that should not change

**Example:**
```
Router(config)# ip route 192.168.2.0 255.255.255.0 10.0.0.1
```

#### Dynamic Routing

**What it is:** Routing that automatically adjusts to changes in network topology or traffic.

**Characteristics:**
- Routes are learned and updated through routing protocols
- Adapts to network changes automatically
- Requires protocol overhead (bandwidth, CPU)
- More suitable for medium to large networks

**Dynamic routing protocols are classified by:**
1. **Interior vs. Exterior protocols:**
   - **Interior Gateway Protocols (IGPs):** Used within an autonomous system (e.g., RIP, OSPF, EIGRP)
   - **Exterior Gateway Protocols (EGPs):** Used between autonomous systems (e.g., BGP)

2. **Distance Vector vs. Link State vs. Path Vector:**
   - **Distance Vector:** Exchanges distance information with neighbors (e.g., RIP)
   - **Link State:** Floods topology information to all routers (e.g., OSPF)
   - **Path Vector:** Exchanges path information with policy controls (e.g., BGP)

## Distance Vector Routing

**What it is:** A routing algorithm where routers periodically share their routing tables with directly connected neighbors, and each router calculates the best routes based on received information.

**Key principle:** Distributed Bellman-Ford algorithm - each router maintains a vector (table) of distances to all known destinations.

### How Distance Vector Works

**Basic operation:**
1. Each router initially knows only its directly connected networks
2. Routers exchange their distance vector tables with neighbors
3. When a router receives a distance vector from a neighbor, it adds the cost to reach that neighbor
4. If a better path is discovered, the router updates its routing table
5. This process continues until routing tables stabilize (convergence)

**Example:**
```
          1           1
      A ─────── B ─────── C
      |                   |
      | 1                 | 1
      |                   |
      D ─────────────────┘
              3
```

Router A's initial routing table:
| Destination | Distance | Next Hop |
|-------------|----------|----------|
| A | 0 | Direct |
| B | 1 | Direct |
| D | 1 | Direct |

After exchanges, Router A's updated routing table:
| Destination | Distance | Next Hop |
|-------------|----------|----------|
| A | 0 | Direct |
| B | 1 | Direct |
| C | 2 | B |
| D | 1 | Direct |

### Challenges in Distance Vector

#### Count-to-Infinity Problem

**What it is:** A routing loop occurs when a network becomes unreachable, but routers continue incrementing metrics and passing outdated information.

**How it happens:**
1. Router A has a route to network X through Router B with metric 2
2. The link to network X fails
3. Router B learns from Router A that A can reach X with metric 3
4. Router B updates its metric to 4 and informs Router A
5. This continues indefinitely, with metrics increasing

**Solutions:**
1. **Split Horizon:** Don't advertise routes back to the neighbor from which they were learned
2. **Poison Reverse:** Advertise unreachable routes with infinite metric
3. **Triggered Updates:** Send updates immediately when topology changes
4. **Maximum Metric:** Define a maximum value (e.g., 15 in RIP) beyond which networks are considered unreachable

**Diagram of Count-to-Infinity:**
```
Step 1: Normal operation
A: "I can reach X directly with cost 1"
  A ──── X
 /
B: "I can reach X through A with cost 2"

Step 2: Link failure
A ──/─── X
 /
B still thinks it can reach X through A

Step 3: Routing loop begins
A: "I can reach X through B with cost 3"
  A       X
 /
B: "I can reach X through A with cost 4"

Metrics continue increasing...
```

### Routing Information Protocol (RIP)

**What it is:** One of the oldest distance vector routing protocols, using hop count as its metric with a maximum of 15 hops.

**Key features:**
- Simple distance vector protocol
- Metric is hop count (number of routers traversed)
- Maximum hop count of 15 (16 = infinity/unreachable)
- Updates every 30 seconds
- Uses Split Horizon with Poison Reverse
- Implements triggered updates
- Two versions: RIPv1 (classful) and RIPv2 (classless)

**RIP message format:**
```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|  Command (1)  |  Version (1)  |           Routing Domain      |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|           Address Family      |             Route Tag         |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                         IP Address                            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                         Subnet Mask                           |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                         Next Hop                              |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                         Metric                                |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

**RIP timers:**
- **Update Timer:** 30 seconds - Send routing updates
- **Invalid Timer:** 180 seconds - Mark route as invalid if no updates
- **Holddown Timer:** 180 seconds - Ignore updates for recently down routes
- **Flush Timer:** 240 seconds - Remove route from table

**Advantages:**
- Simple to configure and understand
- Low computational requirements
- Works well in small networks

**Disadvantages:**
- Slow convergence
- Limited to 15 hops
- No support for variable-length subnet masks (RIPv1)
- Regular updates consume bandwidth
- Does not consider bandwidth or latency in routing decisions

## Link State Routing

**What it is:** A routing algorithm where each router builds a complete map of the network topology and independently calculates the best path to each destination.

**Key principle:** Each router discovers its neighbors, measures the cost to each, and floods this information to all other routers.

### How Link State Works

**Basic operation:**
1. Each router discovers its neighbors and the cost to reach them
2. Each router builds a Link State Packet (LSP) containing this information
3. LSPs are flooded throughout the network - every router receives every other router's LSP
4. Each router builds a complete topological database of the network
5. Each router runs Dijkstra's shortest path algorithm to calculate best paths

**Dijkstra's algorithm process:**
1. Start with source node (router itself)
2. Find the neighbor with lowest cost
3. Add this neighbor to the "shortest path tree"
4. Examine neighbors of newly added node
5. Repeat until all nodes are in the shortest path tree

**Example network:**
```
     2       1
  A ─── B ─── C
  │\    │     │
 1│ \3  │2    │1
  │  \  │     │
  D ─── E ─── F
     2     1
```

**Link state database at Router A:**
| Router | Neighbors (Cost) |
|--------|------------------|
| A | B(2), D(1), E(3) |
| B | A(2), C(1), E(2) |
| C | B(1), F(1) |
| D | A(1), E(2) |
| E | A(3), B(2), D(2), F(1) |
| F | C(1), E(1) |

**Running Dijkstra's algorithm from Router A:**
1. Start with A (cost 0)
2. Add D (cost 1)
3. Add B (cost 2)
4. Add E (cost 3)
5. Add C (cost 3)
6. Add F (cost 4)

### Link State Protocol Advantages

1. **Fast convergence:** Topology changes are propagated quickly
2. **Loop-free routing:** Complete topology knowledge prevents loops
3. **Efficient use of bandwidth:** Exchanges only when topology changes
4. **Support for multiple metrics:** Can consider bandwidth, delay, etc.
5. **Hierarchical design:** Scales to larger networks (e.g., OSPF areas)

### Link State Protocol Challenges

1. **Memory requirements:** Must store complete topology
2. **Processing power:** Dijkstra's algorithm is more computation-intensive
3. **Initial flooding:** Can consume bandwidth during startup
4. **Complex configuration:** More parameters to configure correctly
5. **Instability from frequent updates:** Flapping links can cause chaos

### Open Shortest Path First (OSPF)

**What it is:** The most widely used link state routing protocol for IP networks, which calculates the shortest path tree using Dijkstra's algorithm.

**Key features:**
- Link state protocol for IP networks
- Uses cost as metric (typically based on bandwidth)
- No hop count limitation
- Fast convergence
- VLSM and CIDR support
- Authentication support
- Hierarchical design with areas
- Updates only when topology changes

**OSPF areas:**
```
                    ┌────────────┐
                    │            │
                    │  Area 0    │
                    │ (Backbone) │
                    │            │
                    └────────────┘
                      /       \
                     /         \
                    /           \
          ┌────────────┐    ┌────────────┐
          │            │    │            │
          │  Area 1    │    │  Area 2    │
          │            │    │            │
          └────────────┘    └────────────┘
```

- **Backbone Area (Area 0):** Central area to which all other areas connect
- **Standard Areas:** Connect directly to the backbone, contain LSAs
- **Stub Areas:** Don't receive external routes, use default route
- **Totally Stubby Areas:** Only receive default route from ABR
- **Not So Stubby Areas (NSSA):** Can import external routes

**OSPF router types:**
1. **Internal Router:** All interfaces in the same area
2. **Area Border Router (ABR):** Interfaces in multiple areas
3. **Backbone Router:** At least one interface in Area 0
4. **Autonomous System Boundary Router (ASBR):** Connects to other routing domains

**OSPF packet types:**
1. **Hello:** Discover and maintain neighbor relationships
2. **Database Description (DBD):** Summarize database contents during synchronization
3. **Link State Request (LSR):** Request specific link state records
4. **Link State Update (LSU):** Contains actual link state advertisements
5. **Link State Acknowledgment (LSAck):** Acknowledges receipt of LSUs

**OSPF operation:**
1. **Neighbor discovery:** Routers exchange Hello packets
2. **Database synchronization:** Routers exchange database descriptions
3. **Route calculation:** Each router runs Dijkstra's algorithm on its LSDB
4. **Route installation:** Best paths are installed in the routing table

**Advantages:**
- Fast convergence
- Scalable to large networks
- Efficient bandwidth usage
- Support for VLSM and CIDR
- Loop-free routing

**Disadvantages:**
- Complex configuration
- Higher CPU and memory requirements
- Hierarchical design requires careful planning

## Path Vector Routing

**What it is:** A routing protocol that maintains the path information (sequence of autonomous systems) to reach a destination, combined with policy-based controls.

**Key principles:**
- Similar to distance vector, but includes the entire path to destinations
- Uses policies to filter and manipulate routes
- Designed for inter-domain routing between autonomous systems
- Prioritizes policy over pure shortest path metrics

### How Path Vector Works

**Basic operation:**
1. Each router advertises its reachable networks to neighbors
2. Along with networks, the router includes the entire path (list of autonomous systems)
3. Receiving routers apply policy-based filters to decide which paths to accept
4. Path information is used to detect and prevent routing loops
5. Policy attributes influence path selection beyond simple metrics

**Example:**
```
    AS 100         AS 200         AS 300
┌──────────┐    ┌──────────┐    ┌──────────┐
│          │    │          │    │          │
│   R1     │────│    R2    │────│    R3    │
│          │    │          │    │          │
└──────────┘    └──────────┘    └──────────┘
```

When advertising 192.168.1.0/24 from AS 100:
- R1 advertises to R2: [AS 100], 192.168.1.0/24
- R2 advertises to R3: [AS 200, AS 100], 192.168.1.0/24

If R3 tried to advertise back to R2, the loop would be detected because AS 200 is already in the path.

### Border Gateway Protocol (BGP)

**What it is:** The primary path vector routing protocol used for inter-domain routing on the Internet, connecting different autonomous systems.

**Key features:**
- Path vector protocol
- Uses TCP port 179 for reliable transport
- Maintains a table of networks, paths, and policy attributes
- Selects routes based on policies rather than just metrics
- External BGP (eBGP) connects different autonomous systems
- Internal BGP (iBGP) distributes external routes within an AS
- Slow and deliberate convergence by design

**BGP path attributes:**
1. **WEIGHT:** Cisco proprietary, local to router
2. **LOCAL_PREF:** Preferred exit point from AS
3. **AS_PATH:** List of AS numbers to reach destination
4. **ORIGIN:** How the route was learned
5. **MED (Multi-Exit Discriminator):** Hint to external AS about preferred entry point
6. **NEXT_HOP:** IP address to use as next hop
7. **COMMUNITY:** Tag for grouping routes for policy application

**BGP path selection process (simplified):**
1. Highest WEIGHT (Cisco only)
2. Highest LOCAL_PREF
3. Locally originated routes
4. Shortest AS_PATH
5. Lowest ORIGIN type
6. Lowest MED
7. eBGP over iBGP
8. Lowest IGP metric to NEXT_HOP
9. Oldest route
10. Lowest router ID

**BGP message types:**
1. **OPEN:** Establishes a peering session
2. **UPDATE:** Announces or withdraws routes
3. **KEEPALIVE:** Maintains the peering session
4. **NOTIFICATION:** Reports errors and closes session

**BGP states:**
1. **Idle:** Initial state
2. **Connect:** TCP connection initiated
3. **Active:** Retrying TCP connection
4. **OpenSent:** OPEN message sent
5. **OpenConfirm:** Waiting for KEEPALIVE
6. **Established:** Session established, can exchange routes

**iBGP and eBGP:**
```
     ┌───────────────────────────────┐
     │           AS 100              │
     │                               │
     │    iBGP                iBGP   │
     │  ┌────┐              ┌────┐   │
     │  │ R1 │──────────────│ R2 │   │
     │  └────┘              └────┘   │
     │    │                   │      │
     └────│───────────────────│──────┘
          │ eBGP         eBGP │
     ┌────│───────────────────│──────┐
     │    │                   │      │
     │  ┌────┐              ┌────┐   │
     │  │ R3 │──────────────│ R4 │   │
     │  └────┘              └────┘   │
     │    iBGP                iBGP   │
     │                               │
     │           AS 200              │
     └───────────────────────────────┘
```

- **eBGP:** Between routers in different AS (R1-R3, R2-R4)
- **iBGP:** Between routers in same AS (R1-R2, R3-R4)
- iBGP requires full mesh or route reflectors/confederations

**BGP route aggregation:**
- Combines multiple specific routes into one summary route
- Reduces routing table size
- Can be done with or without the AS_SET attribute
- Example: 192.168.0.0/24, 192.168.1.0/24, 192.168.2.0/24, 192.168.3.0/24 → 192.168.0.0/22

**Advantages:**
- Scalable to Internet size (hundreds of thousands of routes)
- Policy-based routing with flexible filtering
- Loop prevention via AS_PATH
- Route aggregation support
- Stable design suitable for Internet core

**Disadvantages:**
- Complex configuration
- Slow convergence by design
- Large memory requirements
- Can be prone to misconfiguration
- Limited traffic engineering capabilities without extensions

## Comparison of Routing Protocols

| Feature | Distance Vector (RIP) | Link State (OSPF) | Path Vector (BGP) |
|---------|----------------------|-------------------|-------------------|
| **Algorithm** | Bellman-Ford | Dijkstra (SPF) | Path selection with policies |
| **Knowledge** | Distance to destinations | Complete topology | Paths to destinations with policies |
| **Updates** | Periodic full updates | Topology changes only | Incremental updates |
| **Metric** | Hop count | Cost (typically bandwidth-based) | Policy-based path selection |
| **Convergence** | Slow | Fast | Deliberate (slow by design) |
| **Scalability** | Low (small networks) | Medium (large enterprises) | High (Internet-scale) |
| **Resource usage** | Low CPU, low memory | High CPU, medium memory | Medium CPU, high memory |
| **Loop prevention** | Split horizon, poison reverse | Topology knowledge | AS_PATH checking |
| **Primary use** | Small networks | Enterprise networks | Internet/Service Providers |

## Interior vs. Exterior Gateway Protocols

### Interior Gateway Protocols (IGPs)

**What they are:** Routing protocols used within an autonomous system to exchange routes.

**Characteristics:**
- Optimize for finding the shortest/best path
- Focus on fast convergence
- Generally trust all participants
- Examples: RIP, OSPF, EIGRP, IS-IS

**When to use:**
- Within an organization's network
- When all routers are under the same administrative control
- When fast convergence is important
- When route selection is primarily metric-based

### Exterior Gateway Protocols (EGPs)

**What they are:** Routing protocols used between autonomous systems to exchange routes.

**Characteristics:**
- Optimize for policy enforcement and scalability
- Focus on stability over rapid convergence
- Designed for selective trust model
- Examples: BGP

**When to use:**
- Between different organizations
- When administrative boundaries exist
- When policy control is essential
- When scalability to Internet size is needed
- When route filtering and traffic engineering are important

### Protocol Selection Guidelines

**Selecting the appropriate routing protocol:**

1. **Network size:**
   - Small networks (<50 routers): RIP or OSPF
   - Medium networks (50-200 routers): OSPF with areas
   - Large networks (>200 routers): OSPF with careful area design or IS-IS
   - Internet Service Providers: BGP with IGP

2. **Administrative control:**
   - Single administration: IGP (RIP, OSPF, EIGRP)
   - Multiple administrations: EGP (BGP)

3. **Technical requirements:**
   - Fast convergence: OSPF or EIGRP
   - Low resource usage: RIP
   - Policy control: BGP
   - Vendor interoperability: OSPF, RIP, BGP

4. **Routing domain:**
   - Within AS: IGP
   - Between AS: BGP

## Advanced Routing Concepts

### Hierarchical Routing

**What it is:** Organizing routers into a layered hierarchy to improve scalability and reduce routing table size.

**How it works:**
- Network is divided into regions, areas, or domains
- Routing information is summarized at boundaries
- Different levels of the hierarchy may use different protocols

**Benefits:**
- Reduces routing table size
- Localizes impact of topology changes
- Improves convergence time
- Reduces protocol traffic

**Example: OSPF hierarchical model:**
```
                     ┌───────────┐
                     │  Backbone │
                     │  Area 0   │
                     └───────────┘
                      /         \
                     /           \
            ┌───────────┐   ┌───────────┐
            │  Area 1   │   │  Area 2   │
            └───────────┘   └───────────┘
```

### Policy-Based Routing (PBR)

**What it is:** Routing based on factors other than destination address, such as source address, protocol, or packet size.

**How it works:**
- Define match criteria for traffic
- Specify actions for matched traffic (next hop, interface)
- Supersedes normal routing table lookup

**Use cases:**
- Traffic engineering
- Quality of Service implementation
- Provider selection based on traffic type
- Security requirements

### Multipath Routing

**What it is:** Using multiple paths simultaneously to a destination for load balancing or redundancy.

**Types:**
1. **Equal-Cost Multipath (ECMP):** Load balance across paths with identical metrics
2. **Unequal-Cost Multipath:** Load balance across paths with different metrics (proportional to metric)

**Benefits:**
- Increased bandwidth
- Improved resilience
- Better resource utilization

**Challenges:**
- Packet reordering
- Complexity in tracking flows
- Implementation overhead

### Multicast Routing

**What it is:** Routing techniques to efficiently deliver the same data to multiple recipients.

**Key protocols:**
1. **Protocol Independent Multicast (PIM):**
   - **PIM-SM (Sparse Mode):** Uses a rendezvous point, suitable for dispersed groups
   - **PIM-DM (Dense Mode):** Floods and prunes, suitable for dense groups
   - **PIM-SSM (Source-Specific Multicast):** Builds trees from specific sources

2. **Internet Group Management Protocol (IGMP):** Manages multicast group membership

**Applications:**
- Video streaming
- IPTV
- Video conferencing
- Software distribution

### Software-Defined Networking (SDN) and Routing

**What it is:** A network architecture approach that separates the control plane from the data plane, enabling centralized management.

**SDN routing characteristics:**
- Centralized routing decisions
- Global network visibility
- Programmable through APIs
- Dynamic path computation
- Separation of control and forwarding

**Benefits for routing:**
- Optimized path selection
- Traffic engineering capabilities
- Simplified management
- Faster innovation
- Integration with applications

**Challenges:**
- Control plane scalability
- Latency in routing updates
- Controller reliability
- Security concerns
- Interoperability with traditional routing

## Summary

- Routing is the process of selecting paths in a network to send traffic from source to destination
- Routing algorithms use various metrics like hop count, bandwidth, and delay to determine the best path
- Distance vector protocols like RIP share routing tables with neighbors and are simple but slow to converge
- Link state protocols like OSPF build a complete network topology map and calculate routes locally
- Path vector protocols like BGP use policies and AS paths to route between different organizations
- Interior Gateway Protocols (IGPs) route within autonomous systems, while Exterior Gateway Protocols (EGPs) route between them
- Advanced routing concepts include hierarchical routing, policy-based routing, multipath routing, and SDN
- The choice of routing protocol depends on network size, requirements, and administrative boundaries
