# Advanced Trees

[Back to Course Content](README.md) | [← Previous: Trees and Binary Trees](trees.md) | [Next: Graphs →](graphs.md)

## Red-Black Trees

A Red-Black tree is a self-balancing binary search tree where each node has an extra bit for color (red or black) to maintain balance.

### Red-Black Tree Properties

1. Root is black
2. All leaves (NIL) are black
3. If node is red, both children are black
4. Every path from root to leaves contains same number of black nodes
5. New nodes are always red

### Red-Black Tree Operations

| Operation | Time Complexity | Space Complexity | Description |
|-----------|----------------|------------------|-------------|
| Insert | O(log n) | O(1) | Add new node with recoloring |
| Delete | O(log n) | O(1) | Remove node with recoloring |
| Search | O(log n) | O(1) | Find node |
| Minimum | O(log n) | O(1) | Find minimum value |
| Maximum | O(log n) | O(1) | Find maximum value |

### Red-Black Tree Implementation

```python
class RBNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
        self.parent = None
        self.color = "RED"  # New nodes are red

class RedBlackTree:
    def __init__(self):
        self.NIL = RBNode(None)
        self.NIL.color = "BLACK"
        self.root = self.NIL
    
    def insert(self, data):
        node = RBNode(data)
        node.left = self.NIL
        node.right = self.NIL
        
        y = None
        x = self.root
        
        # Find insertion position
        while x != self.NIL:
            y = x
            if node.data < x.data:
                x = x.left
            else:
                x = x.right
        
        node.parent = y
        if y is None:
            self.root = node
        elif node.data < y.data:
            y.left = node
        else:
            y.right = node
        
        self.fix_insert(node)
    
    def fix_insert(self, k):
        while k.parent and k.parent.color == "RED":
            if k.parent == k.parent.parent.left:
                y = k.parent.parent.right
                if y.color == "RED":
                    k.parent.color = "BLACK"
                    y.color = "BLACK"
                    k.parent.parent.color = "RED"
                    k = k.parent.parent
                else:
                    if k == k.parent.right:
                        k = k.parent
                        self.left_rotate(k)
                    k.parent.color = "BLACK"
                    k.parent.parent.color = "RED"
                    self.right_rotate(k.parent.parent)
            else:
                y = k.parent.parent.left
                if y.color == "RED":
                    k.parent.color = "BLACK"
                    y.color = "BLACK"
                    k.parent.parent.color = "RED"
                    k = k.parent.parent
                else:
                    if k == k.parent.left:
                        k = k.parent
                        self.right_rotate(k)
                    k.parent.color = "BLACK"
                    k.parent.parent.color = "RED"
                    self.left_rotate(k.parent.parent)
        self.root.color = "BLACK"
```

## AVL Trees

An AVL tree is a self-balancing binary search tree where the heights of the left and right subtrees of every node differ by at most one.

### AVL Tree Properties

1. Binary search tree property
2. Balance factor of every node is -1, 0, or 1
3. Balance factor = height(left) - height(right)

### AVL Tree Operations

| Operation | Time Complexity | Space Complexity | Description |
|-----------|----------------|------------------|-------------|
| Insert | O(log n) | O(1) | Add new node with rotations |
| Delete | O(log n) | O(1) | Remove node with rotations |
| Search | O(log n) | O(1) | Find node |
| Minimum | O(log n) | O(1) | Find minimum value |
| Maximum | O(log n) | O(1) | Find maximum value |

### AVL Tree Implementation

```python
class AVLNode:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
        self.height = 1
        self.balance = 0

class AVLTree:
    def __init__(self):
        self.root = None
    
    def height(self, node):
        if not node:
            return 0
        return node.height
    
    def balance_factor(self, node):
        if not node:
            return 0
        return self.height(node.left) - self.height(node.right)
    
    def update_height(self, node):
        if not node:
            return
        node.height = max(self.height(node.left), self.height(node.right)) + 1
        node.balance = self.balance_factor(node)
    
    def right_rotate(self, y):
        x = y.left
        T2 = x.right
        
        x.right = y
        y.left = T2
        
        self.update_height(y)
        self.update_height(x)
        
        return x
    
    def left_rotate(self, x):
        y = x.right
        T2 = y.left
        
        y.left = x
        x.right = T2
        
        self.update_height(x)
        self.update_height(y)
        
        return y
    
    def insert(self, data):
        def _insert(node, data):
            if not node:
                return AVLNode(data)
            
            if data < node.data:
                node.left = _insert(node.left, data)
            else:
                node.right = _insert(node.right, data)
            
            self.update_height(node)
            
            # Left Left Case
            if node.balance > 1 and data < node.left.data:
                return self.right_rotate(node)
            
            # Right Right Case
            if node.balance < -1 and data > node.right.data:
                return self.left_rotate(node)
            
            # Left Right Case
            if node.balance > 1 and data > node.left.data:
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
            
            # Right Left Case
            if node.balance < -1 and data < node.right.data:
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
            
            return node
        
        self.root = _insert(self.root, data)
```

## B-Trees

A B-tree is a self-balancing tree data structure that maintains sorted data and allows searches, sequential access, insertions, and deletions in logarithmic time.

### B-Tree Properties

1. All leaves are at same level
2. Minimum degree 't' defines range of keys
3. Root has at least one key
4. All nodes have at most 2t-1 keys
5. All non-leaf nodes have at least t children

### B-Tree Operations

| Operation | Time Complexity | Space Complexity | Description |
|-----------|----------------|------------------|-------------|
| Insert | O(log n) | O(1) | Add new key with splitting |
| Delete | O(log n) | O(1) | Remove key with merging |
| Search | O(log n) | O(1) | Find key |
| Minimum | O(log n) | O(1) | Find minimum key |
| Maximum | O(log n) | O(1) | Find maximum key |

### B-Tree Implementation

```python
class BTreeNode:
    def __init__(self, leaf=True):
        self.leaf = leaf
        self.keys = []
        self.children = []
        self.parent = None

class BTree:
    def __init__(self, t):
        self.root = BTreeNode(True)
        self.t = t
    
    def insert(self, k):
        root = self.root
        if len(root.keys) == (2 * self.t) - 1:
            temp = BTreeNode(False)
            self.root = temp
            temp.children.insert(0, root)
            root.parent = temp
            self.split_child(temp, 0)
            self.insert_non_full(temp, k)
        else:
            self.insert_non_full(root, k)
    
    def insert_non_full(self, x, k):
        i = len(x.keys) - 1
        if x.leaf:
            while i >= 0 and k < x.keys[i]:
                i -= 1
            x.keys.insert(i + 1, k)
        else:
            while i >= 0 and k < x.keys[i]:
                i -= 1
            i += 1
            if len(x.children[i].keys) == (2 * self.t) - 1:
                self.split_child(x, i)
                if k > x.keys[i]:
                    i += 1
            self.insert_non_full(x.children[i], k)
    
    def split_child(self, x, i):
        t = self.t
        y = x.children[i]
        z = BTreeNode(y.leaf)
        z.parent = x
        x.children.insert(i + 1, z)
        x.keys.insert(i, y.keys[t - 1])
        z.keys = y.keys[t:]
        y.keys = y.keys[:t - 1]
        if not y.leaf:
            z.children = y.children[t:]
            y.children = y.children[:t]
            for child in z.children:
                child.parent = z
```

## Trie (Prefix Tree)

A trie is a tree-like data structure used to store a dynamic set of strings, commonly used for prefix-based operations.

### Trie Properties

1. Root represents empty string
2. Each node represents a character
3. Path from root to node represents a string
4. Common prefixes share nodes

### Trie Operations

| Operation | Time Complexity | Space Complexity | Description |
|-----------|----------------|------------------|-------------|
| Insert | O(m) | O(1) | Add string of length m |
| Search | O(m) | O(1) | Find string of length m |
| Delete | O(m) | O(1) | Remove string of length m |
| Prefix Search | O(p + k) | O(1) | Find k strings with prefix p |

### Trie Implementation

```python
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end = False
        self.count = 0

class Trie:
    def __init__(self):
        self.root = TrieNode()
    
    def insert(self, word):
        node = self.root
        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
            node.count += 1
        node.is_end = True
    
    def search(self, word):
        node = self.root
        for char in word:
            if char not in node.children:
                return False
            node = node.children[char]
        return node.is_end
    
    def starts_with(self, prefix):
        node = self.root
        for char in prefix:
            if char not in node.children:
                return False
            node = node.children[char]
        return True
```

## Real-World Applications

### Red-Black Trees
- Java TreeMap
- Linux kernel scheduling
- C++ STL map/set
- Database indexing

### AVL Trees
- Database indexing
- Memory management
- File systems
- Network routing

### B-Trees
- Database systems
- File systems
- Storage systems
- Cache implementations

### Tries
- Autocomplete
- Spell checking
- IP routing
- Dictionary implementations

## Implementation Considerations

### Memory Management
1. Node allocation/deallocation
2. Memory leaks prevention
3. Garbage collection
4. Cache optimization

### Performance Optimization
1. Balancing strategies
2. Rotation optimization
3. Split/merge operations
4. Cache-friendly layouts

## Best Practices

### Tree Selection
1. Consider data characteristics
2. Evaluate operation patterns
3. Assess memory constraints
4. Consider concurrency needs

### Implementation
1. Handle edge cases
2. Optimize rotations
3. Implement proper balancing
4. Consider thread safety

## Summary

Key points to remember:
1. Each tree type has specific use cases
2. Balancing is crucial for performance
3. Choose based on operation patterns
4. Consider memory constraints
5. Handle edge cases properly
6. Optimize for specific operations

By understanding advanced trees, you can:
- Implement efficient data structures
- Optimize database operations
- Build scalable systems
- Solve complex problems
- Design high-performance applications 