# Statistics Fundamentals Summary

**Source:** Note-01.pdf  
**Course:** Statistics for Computing (CSC 502)  
**Instructor:** Prof. (Dr.) R.M. Kapila Rathnayaka

## Navigation

[Table of Contents](../README.md) | 
[Statistics Home](README.md) | 
**Statistics Fundamentals** | 
[Measures of Central Tendency](measures_of_central_tendency.md) | 
[Random Variables and Probability Distributions](random_variables_and_probability_distributions.md) | 
[Statistical Inference and Estimation](statistical_inference_and_estimation.md) | 
[Correlation Analysis](correlation_analysis.md) | 
[Regression Analysis](regression_analysis.md) | 
[Time Series Analysis](time_series_analysis.md)

---

## Introduction to Statistics

Statistics is a scientific method concerned with:
- Designing experiments and data collection
- Summarizing information to aid understanding
- Drawing conclusions from data
- Estimating the present or predicting the future

> "Statistics is a way to get information from data" - It's a tool for creating new understanding from a set of numbers.

## Importance of Statistics

Statistics has become an important tool in many academic disciplines:
- Medicine
- Psychology and Sociology
- Engineering
- Physics and Chemistry
- Business, industry, and government

## Data Types and Classification

### Sources of Data

1. **Primary Data**
   - Data collected directly from first-hand experience
   - Methods include questionnaires, interviews, diaries, and portfolios
   - You create the data yourself

2. **Secondary Data**
   - Published data collected in the past or by other parties
   - Examples include newspapers, magazines, dictionaries, encyclopedias, organizational records, and censuses

### Data Classification

1. **Quantitative (Numerical) Data**
   - **Continuous Variables**: Values obtained by measuring
     - Examples: height, weight, time, distance
   - **Discrete Variables**: Values obtained by counting
     - Examples: number of students, number of items, grade levels

2. **Qualitative (Categorical) Data**
   - **Nominal Variables**: Categories with no hierarchy
     - Example: Eye color (blue, green, brown)
   - **Ordinal Variables**: Categories with a natural order
     - Example: Survey responses (strongly disagree to strongly agree)

## Basic Statistical Concepts

### Types of Statistics

1. **Descriptive Statistics**
   - Summarizes and organizes data
   
2. **Inferential Statistics**
   - Makes predictions or inferences about a population based on a sample

### Population and Sample

1. **Population**
   - The entire group of individuals, items, or measurements of interest
   - Examples: All IT job advertisements in Sri Lanka, all undergraduate students in a university
   - Can be finite (fixed number) or infinite (endless succession)

2. **Sample**
   - A subset of the population
   - Used when studying the entire population is impractical

### Reasons for Sampling

- **Necessity**: Sometimes impossible to study the whole population
- **Practicality**: Easier and more efficient to collect data from a sample
- **Cost-effectiveness**: Fewer costs involved
- **Manageability**: Easier to store and analyze smaller datasets

### Sample Size Considerations

- Minimum sample size for meaningful results is typically 100
- A good maximum sample size is usually 10% of the population (not exceeding 1000)
- Sample size can be calculated based on:
  - Population size
  - Confidence level
  - Margin of error
  - Standard deviation

#### Sample Size Formula

For a known population size:

$$n = \frac{N \times z^2 \times p \times (1-p)}{e^2 \times (N-1) + z^2 \times p \times (1-p)}$$

**Explanation:**
- **n**: Sample size (the number of respondents needed)
- **N**: Population size (the total number of people in the target population)
- **z**: Z-score (the number of standard deviations a given proportion is away from the mean)
  - For 90% confidence level: z = 1.645
  - For 95% confidence level: z = 1.96
  - For 99% confidence level: z = 2.576
- **p**: Standard deviation (usually 0.5 when unknown, which gives the maximum sample size)
- **e**: Margin of error (the amount of error you're willing to accept)
- **N-1**: Population correction factor for finite populations

For example, with a population of 425, 99% confidence level (z=2.58), standard deviation of 0.5, and margin of error of 0.05, the calculation would be:

$$n = \frac{425 \times 2.58^2 \times 0.5 \times (1-0.5)}{0.05^2 \times (425-1) + 2.58^2 \times 0.5 \times (1-0.5)}$$

## Sampling Techniques

### Probability Sampling

Methods where each sample has a known probability of being selected:

1. **Simple Random Sampling (SRS)**
   - Every element in the population has an equal opportunity of being included
   - Pure random selection

2. **Stratified Sampling**
   - Population divided into distinct subgroups (strata)
   - Samples taken from each stratum proportionally
   - Example: Sampling students from different academic streams (science, arts, commerce)
   
   **Formula for Stratified Sample Size per Stratum:**
   
   $$n_h = n \times \frac{N_h}{N}$$
   
   **Explanation:**
   - **n_h**: Sample size for stratum h (the number of items to be sampled from each group)
   - **n**: Total sample size (the total number of items to be sampled)
   - **N_h**: Population size for stratum h (the number of items in each group)
   - **N**: Total population size (the total number of items in the population)
   - The formula ensures that each stratum is represented proportionally to its size in the population

3. **Systematic Sampling**
   - Select elements at regular intervals
   - Start with a random point, then select every kth element
   
   **Formula for Sampling Interval (k):**
   
   $$k = \frac{N}{n}$$
   
   **Explanation:**
   - **k**: Sampling interval (how many items to skip between selections)
   - **N**: Population size (total number of items)
   - **n**: Sample size (number of items to be selected)
   - After calculating k, select a random starting point between 1 and k, then select every kth item

4. **Cluster Sampling**
   - Population divided into similar subgroups (clusters)
   - Randomly select entire clusters

5. **Multistage Sampling**
   - Combination of different sampling methods in stages

### Non-probability Sampling

Methods where samples don't have a known probability of being selected:
- Convenience sampling
- Voluntary response sampling

## Descriptive Statistics Formulas

### Measures of Central Tendency

1. **Arithmetic Mean (Average)**
   
   $$\bar{x} = \frac{\sum_{i=1}^{n} x_i}{n}$$
   
   **Explanation:**
   - **x̄**: Mean (the average value)
   - **Σx_i**: Sum of all values in the dataset
   - **n**: Number of values in the dataset
   - The formula calculates the sum of all values divided by the number of values

2. **Median**
   - Middle value when data is arranged in order
   - For odd number of observations: middle value
   - For even number of observations: average of two middle values

3. **Mode**
   - Value that occurs most frequently

### Measures of Dispersion

1. **Range**
   
   $$\text{Range} = \text{Maximum value} - \text{Minimum value}$$
   
   **Explanation:**
   - The range measures the spread between the highest and lowest values in a dataset
   - It provides a simple measure of dispersion but is sensitive to outliers

2. **Variance**
   
   **Population Variance:**
   $$\sigma^2 = \frac{\sum_{i=1}^{N} (x_i - \mu)^2}{N}$$
   
   **Sample Variance:**
   $$s^2 = \frac{\sum_{i=1}^{n} (x_i - \bar{x})^2}{n-1}$$
   
   **Explanation:**
   - **σ²**: Population variance
   - **s²**: Sample variance
   - **x_i**: Each data point in the dataset
   - **μ**: Population mean
   - **x̄**: Sample mean
   - **N**: Population size
   - **n**: Sample size
   - **(x_i - μ)²** or **(x_i - x̄)²**: Squared deviation from the mean
   - **n-1**: Degrees of freedom (used for sample variance to provide an unbiased estimate)
   - Variance measures the average squared deviation from the mean

3. **Standard Deviation**
   
   **Population Standard Deviation:**
   $$\sigma = \sqrt{\frac{\sum_{i=1}^{N} (x_i - \mu)^2}{N}}$$
   
   **Explanation:**
   - **σ**: Population standard deviation
   - **x_i**: Each data point in the dataset
   - **μ**: Population mean (average of all data points)
   - **(x_i - μ)**: The difference between each data point and the mean
   - **(x_i - μ)²**: Squaring each difference to remove negative values
   - **Σ(x_i - μ)²**: Summing up all the squared differences
   - **N**: Total number of data points in the population
   - **Divide by N**: This gives the variance (σ²), which represents the average squared deviation from the mean
   - **Square root (√)**: This gives us the standard deviation (σ), which brings the measure back to the original unit
   
   **Sample Standard Deviation:**
   $$s = \sqrt{\frac{\sum_{i=1}^{n} (x_i - \bar{x})^2}{n-1}}$$
   
   **Explanation:**
   - **s**: Sample standard deviation
   - **x_i**: Each data point in the sample
   - **x̄**: Sample mean
   - **(x_i - x̄)**: The difference between each data point and the sample mean
   - **(x_i - x̄)²**: Squaring each difference
   - **Σ(x_i - x̄)²**: Sum of squared differences
   - **n-1**: Degrees of freedom (used instead of n to provide an unbiased estimate)
   - **Square root (√)**: Brings the measure back to the original unit

4. **Coefficient of Variation**
   
   $$CV = \frac{s}{\bar{x}} \times 100\%$$
   
   **Explanation:**
   - **CV**: Coefficient of variation
   - **s**: Sample standard deviation
   - **x̄**: Sample mean
   - The formula expresses the standard deviation as a percentage of the mean
   - Useful for comparing the relative variability of different datasets with different units or scales

## Acceptance Sampling

- Uses statistical sampling to determine whether to accept or reject a production lot
- Usually done as products leave the factory
- More practical, quick, and economical than 100% inspection

### Advantages of Sample Inspection

- Lower cost and time requirements
- Requires smaller inspection staff
- Less damage to products due to reduced handling
- Faster lot disposition for better scheduling and delivery

## Practical Examples

1. **Political Attitudes Study**
   - Population: 30,000 undergraduate students in Sri Lankan Universities
   - Sample: 300 undergraduate volunteers from three universities
   - Method: Online survey

2. **Quality Control**
   - Instead of inspecting all products (100% inspection)
   - Sample inspection is more practical and economical

## Probability Concepts

### Basic Probability Formula

$$P(A) = \frac{\text{Number of favorable outcomes}}{\text{Total number of possible outcomes}}$$

**Explanation:**
- **P(A)**: Probability of event A occurring
- **Favorable outcomes**: Number of ways event A can occur
- **Total possible outcomes**: Total number of all possible outcomes in the sample space
- The formula gives a value between 0 and 1, where 0 means impossible and 1 means certain

### Conditional Probability

$$P(A|B) = \frac{P(A \cap B)}{P(B)}$$

**Explanation:**
- **P(A|B)**: Probability of event A occurring given that event B has occurred
- **P(A ∩ B)**: Probability of both events A and B occurring (joint probability)
- **P(B)**: Probability of event B occurring
- The formula calculates the probability of A occurring in the reduced sample space where B has occurred

### Bayes' Theorem

$$P(A|B) = \frac{P(B|A) \times P(A)}{P(B)}$$

**Explanation:**
- **P(A|B)**: Probability of event A given event B has occurred
- **P(B|A)**: Probability of event B given event A has occurred
- **P(A)**: Prior probability of event A (initial belief)
- **P(B)**: Probability of event B
- The formula allows updating probabilities based on new evidence
- Used for calculating posterior probabilities from prior probabilities and likelihood 