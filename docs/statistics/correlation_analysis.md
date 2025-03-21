# Correlation Analysis

**Source:** Note-05.pdf  
**Course:** Statistics for Computing (CSC 502)  
**Instructor:** Prof. (Dr.) R.M. Kapila Rathnayaka

## Navigation

[Table of Contents](README.md) | 
[Statistics Fundamentals](statistics_fundamentals_summary.md) | 
[Measures of Central Tendency](measures_of_central_tendency.md) | 
[Random Variables and Probability Distributions](random_variables_and_probability_distributions.md) | 
[Statistical Inference and Estimation](statistical_inference_and_estimation.md) | 
**Correlation Analysis** | 
[Regression Analysis](regression_analysis.md) | 
[Time Series Analysis](time_series_analysis.md)

---

## Introduction to Correlation and Regression

Correlation and regression are the two most commonly used techniques for investigating relationships between quantitative variables:
- **Correlation** is used to measure the relationship between variables
- **Regression** uses an equation to express this relationship

This summary focuses on correlation analysis, which quantifies the association between two continuous variables.

## Correlation Definition

Correlation can be defined as a measurement used to quantify the relationship between variables.

- **Direct (Positive) Correlation**: If an increase (or decrease) in one variable causes a corresponding increase (or decrease) in another
- **Indirect (Negative) Correlation**: If an increase in one variable causes a decrease in another or vice versa
- **No Correlation**: If a change in an independent variable does not cause a change in the dependent variable

## Types of Correlation Coefficients

Several methods exist to measure correlation:
1. Karl Pearson's Coefficient of Correlation
2. Spearman Rank Correlation
3. Kendall Rank Correlation

## Karl Pearson's Coefficient of Correlation

Karl Pearson's Coefficient of Correlation is a widely used mathematical method to calculate the degree and direction of the relationship between linearly related variables.

### Assumptions

For the Pearson correlation coefficient:
- Both variables should be normally distributed (bell-shaped curve)
- The relationship should be linear
- Homoscedasticity (equal variances) is assumed

### Formula

The coefficient of correlation is denoted by symbol 'r':

$$r = \frac{\sum(x_i - \bar{x})(y_i - \bar{y})}{\sqrt{\sum(x_i - \bar{x})^2 \sum(y_i - \bar{y})^2}}$$

**Explanation:**
- **r**: Pearson correlation coefficient (ranges from -1 to +1)
- **x_i** and **y_i**: Individual data points for variables X and Y
- **x̄** and **ȳ**: Means of the X and Y variables
- **(x_i - x̄)** and **(y_i - ȳ)**: Deviations of each data point from their respective means
- **(x_i - x̄)(y_i - ȳ)**: Product of the deviations for each pair of observations
- **Σ(x_i - x̄)(y_i - ȳ)**: Sum of the products of deviations (covariance × n)
- **Σ(x_i - x̄)²**: Sum of squared deviations for X (variance × n)
- **Σ(y_i - ȳ)²**: Sum of squared deviations for Y (variance × n)
- **√[Σ(x_i - x̄)² × Σ(y_i - ȳ)²]**: Product of the standard deviations × n
- The formula measures how changes in one variable are associated with changes in another variable
- Positive r indicates that variables increase or decrease together
- Negative r indicates that as one variable increases, the other decreases

### Alternative Computational Formula

$$r = \frac{n\sum x_i y_i - \sum x_i \sum y_i}{\sqrt{[n\sum x_i^2 - (\sum x_i)^2][n\sum y_i^2 - (\sum y_i)^2]}}$$

**Explanation:**
- **n**: Number of pairs of data
- **Σx_i y_i**: Sum of the products of each pair of observations
- **Σx_i**: Sum of all X values
- **Σy_i**: Sum of all Y values
- **Σx_i²**: Sum of squared X values
- **Σy_i²**: Sum of squared Y values
- **(Σx_i)²**: Square of the sum of X values
- **(Σy_i)²**: Square of the sum of Y values
- This formula is algebraically equivalent to the first formula but is often easier to compute
- It's particularly useful when working with raw data rather than deviations

## Properties of Coefficient of Correlation

1. The value of the coefficient of correlation (r) always lies between -1 and +1
   - r = +1: Perfect positive correlation
   - r = -1: Perfect negative correlation
   - r = 0: No correlation

2. The coefficient of correlation is independent of the change of origin and scale

3. The coefficient of correlation is a pure number (no units)

4. The coefficient of correlation is symmetric (rxy = ryx)

## Interpretation of Correlation Coefficient

The strength of correlation can be interpreted as follows:

| Correlation Coefficient Value | Interpretation |
|-------------------------------|----------------|
| 0.00 to 0.19 | Very weak correlation |
| 0.20 to 0.39 | Weak correlation |
| 0.40 to 0.59 | Moderate correlation |
| 0.60 to 0.79 | Strong correlation |
| 0.80 to 1.00 | Very strong correlation |

The sign indicates the direction of the relationship:
- Positive: As one variable increases, the other tends to increase
- Negative: As one variable increases, the other tends to decrease

## Examples

### Example 1
Calculate the coefficient of correlation between X and Y from the following data:

| X | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
|---|---|---|---|---|---|---|---|
| Y | 2 | 4 | 5 | 3 | 8 | 6 | 7 |

Using the formula, we get r = 0.79, which indicates a strong positive correlation.

### Example 2
A sample of 6 children was selected, and data about their age in years and weight in kilograms was recorded:

| Serial No. | Age (years) | Weight (Kg) |
|------------|-------------|-------------|
| 1          | 7           | 12          |
| 2          | 6           | 8           |
| 3          | 8           | 12          |
| 4          | 5           | 10          |
| 5          | 6           | 11          |
| 6          | 9           | 13          |

The correlation coefficient is r = 0.759, indicating a strong direct correlation between age and weight.

## Limitations of Correlation

1. Correlation does not imply causation
   - A high correlation between two variables does not necessarily mean that one causes the other

2. Correlation measures only linear relationships
   - It may not detect non-linear relationships between variables

3. Correlation is sensitive to outliers
   - Extreme values can significantly affect the correlation coefficient

4. Correlation does not provide information about the slope of the relationship
   - For this, regression analysis is needed

## Spearman Rank Correlation

Spearman rank correlation evaluates the monotonic relationship between two continuous or ordinal variables. It is used when:
- Data does not follow a normal distribution
- The relationship between variables is not linear but monotonic
- Data is ordinal (ranked)

### Formula

$$r_s = 1 - \frac{6\sum d_i^2}{n(n^2-1)}$$

**Explanation:**
- **r_s**: Spearman rank correlation coefficient
- **d_i**: Difference between the ranks of corresponding values (R(x_i) - R(y_i))
- **d_i²**: Squared difference in ranks
- **Σd_i²**: Sum of squared differences in ranks
- **n**: Number of pairs of values
- **n(n²-1)**: Normalization factor
- **6**: Constant in the formula
- The formula measures the strength and direction of monotonic relationships
- A monotonic relationship is one where variables tend to change together, but not necessarily at a constant rate
- The formula is based on the ranks of the data rather than the actual values
- This makes it resistant to outliers and applicable to ordinal data

### Alternative Formula When There Are No Tied Ranks

$$r_s = \frac{\sum(R(x_i) - \bar{R}_x)(R(y_i) - \bar{R}_y)}{\sqrt{\sum(R(x_i) - \bar{R}_x)^2 \sum(R(y_i) - \bar{R}_y)^2}}$$

**Explanation:**
- **R(x_i)** and **R(y_i)**: Ranks of the x and y values
- **R̄_x** and **R̄_y**: Mean ranks
- This formula is the Pearson correlation applied to the ranks of the data
- It gives the same result as the first formula when there are no tied ranks

## Correlation vs. Causation

It's important to remember that correlation does not imply causation:
- Two variables may be correlated because they are both caused by a third variable
- The correlation may be coincidental
- The direction of causality may be opposite to what is assumed

## Applications of Correlation Analysis

1. **Business and Economics**:
   - Relationship between advertising expenditure and sales
   - Correlation between interest rates and stock prices

2. **Health Sciences**:
   - Correlation between diet and disease
   - Relationship between exercise and blood pressure

3. **Social Sciences**:
   - Correlation between education level and income
   - Relationship between study time and test scores

4. **Computer Science**:
   - Correlation between processing power and performance
   - Relationship between network traffic and response time 