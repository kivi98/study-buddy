#!/bin/bash

# Create a temporary directory for processing
mkdir -p temp_mobile_app

# Create the main markdown file
cat > temp_mobile_app/mobile_app_exam.md << 'EOL'
# Mobile App Development - Exam Reference Guide

## Table of Contents
1. [Mobile App Fundamentals](#mobile-app-fundamentals)
2. [Android Development](#android-development)
3. [iOS Development](#ios-development)
4. [Cross-Platform Development](#cross-platform-development)
5. [Mobile App Architecture](#mobile-app-architecture)
6. [Mobile App Testing](#mobile-app-testing)
7. [Mobile App Security](#mobile-app-security)
8. [Mobile App Performance](#mobile-app-performance)

## Mobile App Fundamentals

### Mobile App Types
| Type | Description | Examples |
|------|-------------|----------|
| Native | Built for specific platform | Android (Java/Kotlin), iOS (Swift) |
| Hybrid | Web-based in native container | Ionic, Cordova |
| Cross-platform | Single codebase for multiple platforms | React Native, Flutter |
| Progressive Web App | Web app with native features | Twitter Lite |

### Mobile App Lifecycle
1. **Planning Phase**
   - Requirements gathering
   - Market research
   - User persona creation
   - Feature prioritization

2. **Design Phase**
   - UI/UX design
   - Wireframing
   - Prototyping
   - Design system creation

3. **Development Phase**
   - Frontend development
   - Backend integration
   - API development
   - Database design

4. **Testing Phase**
   - Unit testing
   - Integration testing
   - User acceptance testing
   - Performance testing

5. **Deployment Phase**
   - App store submission
   - Beta testing
   - Production release
   - Monitoring and maintenance

## Android Development

### Android Architecture Components
| Component | Purpose | Key Features |
|-----------|---------|--------------|
| Activity | UI screen | Lifecycle management |
| Fragment | UI portion | Reusable UI components |
| Service | Background tasks | Long-running operations |
| Broadcast Receiver | System events | Event handling |
| Content Provider | Data sharing | Data access layer |

### Android Lifecycle Methods
```java
// Activity Lifecycle
onCreate()      // Initial setup
onStart()       // Becoming visible
onResume()      // Getting focus
onPause()       // Losing focus
onStop()        // Becoming invisible
onDestroy()     // Cleanup
onRestart()     // Restarting stopped activity

// Fragment Lifecycle
onAttach()      // Fragment attached to activity
onCreate()      // Initial creation
onCreateView()  // Creating the view
onViewCreated() // View created
onStart()       // Becoming visible
onResume()      // Getting focus
onPause()       // Losing focus
onStop()        // Becoming invisible
onDestroyView() // View destroyed
onDestroy()     // Fragment destroyed
onDetach()      // Fragment detached
```

### Android UI Components
| Component | Purpose | Key Properties |
|-----------|---------|----------------|
| Layout | Container | orientation, padding, margin |
| Button | User action | text, onClick, style |
| TextView | Text display | text, textSize, textColor |
| EditText | Text input | hint, inputType |
| ImageView | Image display | src, scaleType |
| RecyclerView | List display | layoutManager, adapter |

## iOS Development

### iOS Architecture Components
| Component | Purpose | Key Features |
|-----------|---------|--------------|
| ViewController | UI management | Lifecycle management |
| View | UI elements | Layout and styling |
| Model | Data management | Business logic |
| Delegate | Communication | Protocol-based |
| Navigation Controller | Screen navigation | Stack-based |

### iOS Lifecycle Methods
```swift
// ViewController Lifecycle
viewDidLoad()       // Initial setup
viewWillAppear()    // Before view appears
viewDidAppear()     // After view appears
viewWillDisappear() // Before view disappears
viewDidDisappear()  // After view disappears
viewWillLayoutSubviews() // Before layout
viewDidLayoutSubviews()  // After layout
```

### iOS UI Components
| Component | Purpose | Key Properties |
|-----------|---------|----------------|
| UIView | Base container | frame, bounds |
| UILabel | Text display | text, font, color |
| UIButton | User action | title, target, action |
| UITextField | Text input | placeholder, delegate |
| UIImageView | Image display | image, contentMode |
| UITableView | List display | dataSource, delegate |

## Cross-Platform Development

### React Native
| Feature | Description | Key Points |
|---------|-------------|------------|
| Components | Reusable UI elements | JSX syntax |
| State Management | Data handling | useState, useEffect |
| Navigation | Screen routing | React Navigation |
| Styling | CSS-like styling | StyleSheet |
| Native Modules | Platform-specific code | Bridge |

### Flutter
| Feature | Description | Key Points |
|---------|-------------|------------|
| Widgets | UI building blocks | Stateless/Stateful |
| State Management | Data handling | setState, Provider |
| Navigation | Screen routing | Navigator |
| Styling | Theme-based | Material Design |
| Platform Channels | Native code | MethodChannel |

## Mobile App Architecture

### Common Patterns
1. **MVC (Model-View-Controller)**
   - Model: Data and business logic
   - View: UI components
   - Controller: User input handling

2. **MVVM (Model-View-ViewModel)**
   - Model: Data layer
   - View: UI layer
   - ViewModel: Presentation logic

3. **Clean Architecture**
   - Presentation Layer
   - Domain Layer
   - Data Layer

### Key Principles
1. **SOLID Principles**
   - Single Responsibility
   - Open/Closed
   - Liskov Substitution
   - Interface Segregation
   - Dependency Inversion

2. **DRY (Don't Repeat Yourself)**
   - Code reusability
   - Component abstraction
   - Shared utilities

## Mobile App Testing

### Testing Types
| Type | Purpose | Tools |
|------|---------|-------|
| Unit Testing | Component testing | JUnit, XCTest |
| UI Testing | Interface testing | Espresso, XCUITest |
| Integration Testing | Component interaction | Mockito, XCTest |
| Performance Testing | Speed and efficiency | Android Profiler, Instruments |

### Testing Best Practices
1. **Test Coverage**
   - Critical paths
   - Edge cases
   - Error scenarios

2. **Automation**
   - CI/CD integration
   - Automated builds
   - Test reporting

## Mobile App Security

### Security Measures
| Aspect | Description | Implementation |
|--------|-------------|----------------|
| Data Encryption | Secure storage | AES, RSA |
| Authentication | User verification | OAuth, JWT |
| Network Security | Secure communication | HTTPS, SSL |
| Input Validation | Data sanitization | Input filtering |

### Security Best Practices
1. **Data Protection**
   - Secure storage
   - Encryption
   - Key management

2. **Authentication**
   - Biometric auth
   - Token-based auth
   - Session management

## Mobile App Performance

### Performance Metrics
| Metric | Description | Target |
|--------|-------------|---------|
| Launch Time | App startup | < 2 seconds |
| Response Time | User interaction | < 100ms |
| Memory Usage | RAM consumption | < 100MB |
| Battery Impact | Power consumption | Minimal |

### Optimization Techniques
1. **Memory Management**
   - Image optimization
   - Cache management
   - Resource cleanup

2. **Network Optimization**
   - Request batching
   - Response caching
   - Compression

## Quick Reference Guide

### Common Pitfalls
1. **Development**
   - Platform-specific issues
   - Version compatibility
   - Device fragmentation

2. **Testing**
   - Device testing
   - Network conditions
   - Battery impact

3. **Deployment**
   - Store guidelines
   - Version management
   - Update strategy

### Best Practices
1. **Code Quality**
   - Clean code principles
   - Documentation
   - Code review

2. **User Experience**
   - Responsive design
   - Offline support
   - Error handling

3. **Maintenance**
   - Version control
   - Dependency management
   - Bug tracking

EOL

# Convert markdown to PDF with proper styling
pandoc temp_mobile_app/mobile_app_exam.md \
    --pdf-engine=wkhtmltopdf \
    --standalone \
    --toc \
    --toc-depth=3 \
    --highlight-style=tango \
    --variable=geometry:margin=1in \
    --variable=documentclass:article \
    --variable=fontsize:11pt \
    --variable=mainfont:DejaVuSerif \
    --variable=monofont:DejaVuSansMono \
    -o Mobile_App_Exam_Reference.pdf

# Clean up
rm -rf temp_mobile_app

echo "PDF generation complete! Check Mobile_App_Exam_Reference.pdf" 