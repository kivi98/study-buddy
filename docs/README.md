# Course Notes - Statistics and Computer System Architecture

This repository contains comprehensive course notes for two subjects:
1. Statistics for Computing (CSC 502)
2. Computer System Architecture

## Table of Contents

### Statistics for Computing
**Instructor:** Prof. (Dr.) R.M. Kapila Rathnayaka

#### 1. [Statistics Fundamentals](statistics/statistics_fundamentals_summary.md)
- Introduction to Statistics
- Importance of Statistics
- Data Types and Classification
  - Sources of Data (Primary vs. Secondary)
  - Quantitative vs. Qualitative Data
- Basic Statistical Concepts
  - Descriptive vs. Inferential Statistics
  - Population vs. Sample
- Sampling Techniques
  - Probability Sampling Methods
  - Non-probability Sampling
- Sample Size Considerations
- Acceptance Sampling
- Probability Concepts

#### 2. [Measures of Central Tendency](statistics/measures_of_central_tendency.md)
- Introduction to Central Tendency
- Types of Measures
  - Mathematical Averages
  - Positional Averages
- Arithmetic Mean
  - Formula and Examples
  - Limitations
- Median
  - Calculation Method
  - Examples
- Quartiles
- Mode
  - Types of Mode
  - Examples
- Geometric Mean
  - Formula and Applications
- Harmonic Mean
  - Formula and Applications
- Choosing the Appropriate Measure

#### 3. [Random Variables and Probability Distributions](statistics/random_variables_and_probability_distributions.md)
- Random Variables
  - Definition and Mathematical Definition
  - Types (Discrete vs. Continuous)
- Probability Distributions
  - Discrete Probability Distributions
    - Properties of PMF
    - Examples
  - Continuous Probability Distributions
    - Probability Density Function (PDF)
    - Examples
- Mathematical Expectation
  - Expected Value of Discrete Random Variables
  - Expected Value of Continuous Random Variables
  - Properties
- Variance and Standard Deviation
  - Formulas for Discrete and Continuous Variables
  - Properties
- Common Probability Distributions
  - Discrete Distributions (Bernoulli, Binomial, Poisson)
  - Continuous Distributions (Uniform, Normal)

#### 4. [Statistical Inference and Estimation](statistics/statistical_inference_and_estimation.md)
- Introduction to Statistical Inference
- Statistical Estimation
- Types of Estimation
  - Point Estimation
  - Interval Estimation
- Confidence Intervals
  - Requirements for Confidence Interval Estimation
- Confidence Intervals for Population Mean
  - When Population Variance is Known
  - When Population Variance is Unknown (Small Sample)
  - When Population Variance is Unknown (Large Sample)
- Factors Affecting Confidence Intervals
- Interpretation of Confidence Intervals
- Prediction Intervals

#### 5. [Correlation Analysis](statistics/correlation_analysis.md)
- Introduction to Correlation
- Correlation Definition
- Types of Correlation Coefficients
- Karl Pearson's Coefficient of Correlation
  - Assumptions
  - Formula
  - Properties
- Interpretation of Correlation Coefficient
- Examples
- Limitations of Correlation
- Spearman Rank Correlation
- Correlation vs. Causation
- Applications of Correlation Analysis

#### 6. [Regression Analysis](statistics/regression_analysis.md)
- Introduction to Regression Analysis
- Regression Equation
- Methods of Obtaining Regression Line
  - Scatter Diagram Method
  - Method of Least Squares
- Classical Assumptions of Linear Regression
- Regression Validation
  - Residual Plots
- R-squared (Coefficient of Determination)
- Case Study Example
- Applications of Regression Analysis
- Multiple Regression

#### 7. [Time Series Analysis](statistics/time_series_analysis.md)
- Introduction to Time Series
- Applications of Time Series Analysis
- Components of a Time Series
  - Trend
  - Seasonal Variations
  - Cyclical Variations
  - Irregular Variations
- Time Series Models
  - Additive Model
  - Multiplicative Model
- Analysis Procedure
- Time Series Forecasting Methods
  - Moving Averages
  - Exponential Smoothing
  - ARIMA Models
  - Seasonal Decomposition
- Example: Time Series for Monthly Income
- Challenges in Time Series Analysis
- Importance in Computing

### Computer System Architecture
**Instructor:** Prof. Dr. Computer Architecture

#### 1. [Computer Architecture Fundamentals](computer-system-architecture/computer_architecture_fundamentals.md)
- Introduction to Computer Architecture
- Computer System Components
- Performance Metrics and Evaluation
- Instruction Set Architecture (ISA)
- Computer Organization Levels

#### 2. [Processor Architecture](computer-system-architecture/processor_architecture.md)
- CPU Components and Organization
- Instruction Cycle
- Pipelining Concepts
- Hazards and Solutions
- Superscalar Architectures
- RISC vs CISC Architectures

#### 3. [Memory Systems](computer-system-architecture/memory_systems.md)
- Memory Hierarchy
- Cache Memory
  - Cache Organization
  - Cache Mapping Techniques
  - Replacement Policies
  - Write Policies
- Virtual Memory
  - Paging and Segmentation
  - Address Translation
  - Page Replacement Algorithms
- Memory Management Units

#### 4. [Input/Output Systems](computer-system-architecture/io_systems.md)
- I/O Architecture
- I/O Techniques
  - Programmed I/O
  - Interrupt-Driven I/O
  - Direct Memory Access (DMA)
- I/O Interfaces and Buses
- Storage Systems
  - RAID Configurations
  - Storage Technologies

#### 5. [Parallel Processing](computer-system-architecture/parallel_processing.md)
- Parallel Computer Models
- Multiprocessor Systems
  - Symmetric Multiprocessing (SMP)
  - Distributed Memory Systems
- Interconnection Networks
- Parallel Programming Models
- Performance Considerations

#### 6. [Advanced Architectures](computer-system-architecture/advanced_architectures.md)
- GPU Architecture
- Quantum Computing Basics
- Neuromorphic Computing
- Edge Computing Architecture
- Domain-Specific Architectures

## Getting Started

For an introduction to using markdown for notes, see the [Getting Started Guide](statistics/getting_started.md).

## How to Use These Notes

1. Choose the subject you want to study: [Statistics](statistics/README.md) or [Computer System Architecture](computer-system-architecture/README.md)
2. Start with the fundamentals if you're new to the subject
3. Each topic builds on previous concepts, so it's recommended to follow the order of the table of contents
4. Use the links to navigate directly to specific topics of interest
5. Refer to the original lecture notes for more detailed explanations

## Additional Resources

### Statistics Resources
- The course textbook: "Fundamentals of Descriptive Statistics using MINITAB" (2020), R.M. Kapila Tharanga Rathnayaka
- Other recommended texts:
  - "Statistics for Earth Science, Data" by G. Borradaile
  - "The Statistical Analysis of Experimental Data" by John Mandel
  - "Statistical Analysis of Experimental Data: Springer Handbook of Experimental Solid Mechanics"

### Computer Architecture Resources
- "Computer Architecture: A Quantitative Approach" by John L. Hennessy and David A. Patterson
- "Computer Organization and Design: The Hardware/Software Interface" by David A. Patterson and John L. Hennessy
- "Modern Processor Design: Fundamentals of Superscalar Processors" by John Paul Shen and Mikko H. Lipasti 