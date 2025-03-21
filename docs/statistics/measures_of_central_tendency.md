# Measures of Central Tendency

**Source:** Note-02.pdf  
**Course:** Statistics for Computing (CSC 502)  
**Instructor:** Prof. (Dr.) R.M. Kapila Rathnayaka

## Navigation

[Table of Contents](README.md) | 
[Statistics Fundamentals](statistics_fundamentals_summary.md) | 
**Measures of Central Tendency** | 
[Random Variables and Probability Distributions](random_variables_and_probability_distributions.md) | 
[Statistical Inference and Estimation](statistical_inference_and_estimation.md) | 
[Correlation Analysis](correlation_analysis.md) | 
[Regression Analysis](regression_analysis.md) | 
[Time Series Analysis](time_series_analysis.md)

---

## Introduction to Central Tendency

A measure of central tendency is a single value that attempts to describe a set of data by identifying the central position within that set of data. These measures are also called:
- Measures of central location
- Summary statistics

In statistics, a central tendency (or measure of central tendency) represents a central or typical value for a probability distribution. It may also be called a center or location of the distribution.

## Types of Measures of Central Tendency

Central tendency measures can be classified into two main categories:

### Mathematical Averages
1. Arithmetic Mean
2. Geometric Mean
3. Harmonic Mean

### Positional Averages
1. Median
2. Mode

## Arithmetic Mean

The arithmetic mean is the most widely used measure of central tendency. It is calculated by dividing the sum of all observations by the total number of observations.

### Formula

For a sample with observations $x_1, x_2, \ldots, x_n$, the sample mean is:

$$\bar{x} = \frac{x_1 + x_2 + \ldots + x_n}{n} = \frac{\sum_{i=1}^{n} x_i}{n}$$

### Example 1
For the data set: 5, 6, 2, 4, 7, 8, 3, 5, 6, 6

$$\bar{x} = \frac{5 + 6 + 2 + 4 + 7 + 8 + 3 + 5 + 6 + 6}{10} = \frac{52}{10} = 5.2$$

### Example 2
Monthly salary ($) of 10 employees:
2500, 2700, 2400, 2300, 2550, 2650, 2750, 2450, 2600, 2400

$$\bar{x} = \frac{2500 + 2700 + 2400 + 2300 + 2550 + 2650 + 2750 + 2450 + 2600 + 2400}{10} = \frac{24900}{10} = 2490$$

### Limitation
The arithmetic mean does not provide a good measure when the sample contains a few extreme values (outliers).

## Median

The median is the middle value when data is arranged in ascending or descending order.

### Calculation Method
1. Arrange the data in ascending order
2. If n is odd, the median is the middle value
3. If n is even, the median is the average of the two middle values

### Formula
For data arranged in ascending order:

If n is odd:
$$\text{Median} = \text{value at position } \frac{n+1}{2}$$

If n is even:
$$\text{Median} = \frac{\text{value at position } \frac{n}{2} + \text{value at position } (\frac{n}{2}+1)}{2}$$

### Example 1
For the data set: 3, 4, 4, 5, 6, 8, 8, 8, 10

Since n = 9 (odd), the median is the value at position (9+1)/2 = 5th position, which is 6.

### Example 2
For the data set: 5, 5, 7, 9, 11, 12, 15, 28

Since n = 8 (even), the median is the average of values at positions 8/2 = 4 and 8/2+1 = 5, which is (9+11)/2 = 10.

## Quartiles

Quartiles are points that divide the ordered data into four equal parts.

### First Quartile (Q1)
The first quartile is the median of the lower half of the data.

### Second Quartile (Q2)
The second quartile is the median of the entire data set.

### Third Quartile (Q3)
The third quartile is the median of the upper half of the data.

## Mode

The mode is the value that occurs most frequently in a data set.

### Types of Mode
- **Unimodal**: Data with one mode
- **Bimodal**: Data with two modes
- **Multimodal**: Data with more than two modes
- **No Mode**: When all values occur with the same frequency

### Example
For the data set: 2, 3, 3, 4, 5, 5, 5, 6, 6, 7

The mode is 5 as it appears three times, which is more than any other value.

## Geometric Mean

The geometric mean is the nth root of the product of n observations.

### Formula
For a sample with observations $x_1, x_2, \ldots, x_n$, the geometric mean is:

$$GM = \sqrt[n]{x_1 \times x_2 \times \ldots \times x_n} = \left(\prod_{i=1}^{n} x_i\right)^{1/n}$$

### Logarithmic Form
$$\log(GM) = \frac{1}{n}\sum_{i=1}^{n}\log(x_i)$$

### Applications
- Calculating average rates of change
- Finding average ratios
- Computing average returns in finance

## Harmonic Mean

The harmonic mean is the reciprocal of the arithmetic mean of the reciprocals of the observations.

### Formula
For a sample with observations $x_1, x_2, \ldots, x_n$, the harmonic mean is:

$$HM = \frac{n}{\frac{1}{x_1} + \frac{1}{x_2} + \ldots + \frac{1}{x_n}} = \frac{n}{\sum_{i=1}^{n} \frac{1}{x_i}}$$

### Applications
- Calculating average speeds
- Finding average rates when quantities are fixed

## Choosing the Appropriate Measure

The choice of which measure of central tendency to use depends on:

1. **Type of Data**:
   - Nominal data: Mode
   - Ordinal data: Median
   - Interval/Ratio data: Mean, Median, or Mode

2. **Distribution Shape**:
   - Symmetric distribution: Mean
   - Skewed distribution: Median
   - Categorical data: Mode

3. **Presence of Outliers**:
   - With outliers: Median
   - Without outliers: Mean

4. **Purpose of Analysis**:
   - Need for further mathematical calculations: Mean
   - Need for a representative middle value: Median
   - Need for most common category: Mode 