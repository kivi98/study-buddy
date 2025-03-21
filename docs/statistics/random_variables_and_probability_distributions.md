# Random Variables and Probability Distributions

**Source:** Note-03.pdf  
**Course:** Statistics for Computing (CSC 502)  
**Instructor:** Prof. (Dr.) R.M. Kapila Rathnayaka

## Navigation

[Table of Contents](README.md) | 
[Statistics Fundamentals](statistics_fundamentals_summary.md) | 
[Measures of Central Tendency](measures_of_central_tendency.md) | 
**Random Variables and Probability Distributions** | 
[Statistical Inference and Estimation](statistical_inference_and_estimation.md) | 
[Correlation Analysis](correlation_analysis.md) | 
[Regression Analysis](regression_analysis.md) | 
[Time Series Analysis](time_series_analysis.md)

---

## Random Variables

### Definition
A random variable is a function that assigns unique numerical values to all possible outcomes of a random experiment under fixed conditions. Usually written as X, it represents numerical outcomes of a random phenomenon.

### Mathematical Definition
For a given probability space (Ω, ℱ, P(Ω)), a random variable, denoted by X or X(ω), is a function with domain Ω and co-domain the real line.

### Example
Consider the experiment of tossing a single coin. Let the random variable X denote the number of heads.
- Domain: Ω = {Head, Tail}
- Co-domain: X(Head) = 1, X(Tail) = 0

### Types of Random Variables

#### 1. Discrete Random Variable
A random variable is called discrete if its set of possible outcomes is countable.

**Examples:**
- Number of heads when flipping a coin (X = 0, 1, 2, ...)
- Number of calls per minute in a phone exchange (X = 0, 1, 2, 3, ...)

#### 2. Continuous Random Variable
Continuous random variables can take on any value within a range of values.

**Examples:**
- Height of students in a class
- Weight of students in a class
- Time it takes to get to school
- Distance traveled between classes

## Probability Distributions

A probability distribution is a table or an equation that links each possible value that a random variable can assume with its probability of occurrence.

### Types of Probability Distributions
1. Discrete Probability Distributions
2. Continuous Probability Distributions

## Discrete Probability Distributions

### Definition
The probability distribution of a discrete random variable can always be represented by a table.

### Properties of Probability Mass Function (PMF)
For a discrete random variable X with possible values x₁, x₂, ..., xₙ and corresponding probabilities p₁, p₂, ..., pₙ:

1. 0 ≤ P(X = xᵢ) = pᵢ ≤ 1 for all i
2. ∑P(X = xᵢ) = ∑pᵢ = 1

### Example 1
Suppose you flip a coin two times. The random variable X represents the number of heads that result from the coin flips.

| Number of heads (X) | Probability, P(X=x) |
|---------------------|---------------------|
| 0                   | 0.25                |
| 1                   | 0.50                |
| 2                   | 0.25                |

### Example 2
Consider the experiment of tossing a die. Let X denote the value that appears on the upper face.

| X     | 1   | 2   | 3   | 4   | 5   | 6   |
|-------|-----|-----|-----|-----|-----|-----|
| P(X=x)| 1/6 | 1/6 | 1/6 | 1/6 | 1/6 | 1/6 |

This can be expressed as:

$$P(X = x) = 
\begin{cases} 
\frac{1}{6} & \text{if } x = 1, 2, ..., 6 \\
0 & \text{otherwise}
\end{cases}$$

## Continuous Probability Distributions

### Definition
If a random variable is continuous, its probability distribution is called a continuous probability distribution. Unlike discrete distributions, continuous distributions cannot be expressed in tabular form and require an equation or formula.

### Probability Density Function (PDF)

The function f(x) is a probability density function for the continuous random variable X, defined over the set of real numbers R, if it satisfies:

1. f(x) ≥ 0 for all x ∈ R
2. ∫₋∞^∞ f(x)dx = 1

The probability that X assumes a value between a and b is equal to the area under the density function between x=a and x=b:

$$P(a \leq X \leq b) = \int_a^b f(x)dx$$

**Explanation:**
- **f(x)**: Probability density function
- **f(x) ≥ 0**: The density function must be non-negative for all values
- **∫₋∞^∞ f(x)dx = 1**: The total area under the curve must equal 1
- **P(a ≤ X ≤ b)**: Probability that X takes a value between a and b
- **∫_a^b f(x)dx**: The area under the curve between points a and b
- Unlike discrete distributions where probabilities are assigned to specific values, continuous distributions assign probabilities to intervals

### Example
Suppose that the error in the reaction temperature (in °C) for a controlled laboratory experiment is a continuous random variable X having the probability density function:

$$f(x) = 
\begin{cases} 
\frac{1}{2}(1-x^2) & \text{if } -1 < x < 1 \\
0 & \text{otherwise}
\end{cases}$$

To verify condition 2:
$$\int_{-1}^{1} \frac{1}{2}(1-x^2)dx = \frac{1}{2}\left[x - \frac{x^3}{3}\right]_{-1}^{1} = \frac{1}{2}\left[(1 - \frac{1}{3}) - (-1 + \frac{1}{3})\right] = \frac{1}{2} \cdot \frac{4}{3} = \frac{2}{3}$$

## Mathematical Expectation

### Expected Value of a Discrete Random Variable

The expected value (or mean) of a discrete random variable X is:

$$E(X) = \sum_{i=1}^{n} x_i \cdot P(X = x_i)$$

**Explanation:**
- **E(X)**: Expected value or mean of the random variable X
- **x_i**: Possible values of the random variable
- **P(X = x_i)**: Probability of X taking the value x_i
- The formula calculates the weighted average of all possible values, where the weights are the probabilities
- It represents the long-run average value of the random variable over many repetitions of the experiment

### Example
For a random variable X with the following probability distribution:

| X     | 0   | 1   | 2   |
|-------|-----|-----|-----|
| P(X=x)| 1/4 | 1/2 | 1/4 |

The expected value is:
$$E(X) = 0 \cdot \frac{1}{4} + 1 \cdot \frac{1}{2} + 2 \cdot \frac{1}{4} = 0 + 0.5 + 0.5 = 1$$

### Expected Value of a Continuous Random Variable

The expected value of a continuous random variable X with probability density function f(x) is:

$$E(X) = \int_{-\infty}^{\infty} x \cdot f(x)dx$$

**Explanation:**
- **E(X)**: Expected value or mean of the random variable X
- **x**: Values of the random variable
- **f(x)**: Probability density function
- **x · f(x)**: Product of each value and its density
- **∫_{-∞}^{∞}**: Integration over the entire range of possible values
- The formula is the continuous analog of the weighted average formula for discrete random variables
- It calculates the center of mass of the probability distribution

### Properties of Expected Value

1. E(c) = c, where c is a constant
2. E(cX) = c·E(X)
3. E(X + Y) = E(X) + E(Y)
4. E(X - Y) = E(X) - E(Y)
5. If X and Y are independent, then E(XY) = E(X)·E(Y)

## Variance and Standard Deviation

### Variance of a Discrete Random Variable

The variance of a discrete random variable X is:

$$Var(X) = E[(X - E(X))^2] = \sum_{i=1}^{n} (x_i - E(X))^2 \cdot P(X = x_i)$$

Alternatively:
$$Var(X) = E(X^2) - [E(X)]^2 = \sum_{i=1}^{n} x_i^2 \cdot P(X = x_i) - [E(X)]^2$$

**Explanation:**
- **Var(X)**: Variance of the random variable X
- **E(X)**: Expected value or mean of X
- **(x_i - E(X))²**: Squared deviation of each value from the mean
- **P(X = x_i)**: Probability of X taking the value x_i
- **E[(X - E(X))²]**: Expected value of the squared deviations
- **E(X²)**: Expected value of X²
- **[E(X)]²**: Square of the expected value of X
- The formula measures the average squared deviation from the mean
- The alternative formula is computationally more efficient

### Variance of a Continuous Random Variable

The variance of a continuous random variable X with probability density function f(x) is:

$$Var(X) = \int_{-\infty}^{\infty} (x - E(X))^2 \cdot f(x)dx = \int_{-\infty}^{\infty} x^2 \cdot f(x)dx - [E(X)]^2$$

**Explanation:**
- **Var(X)**: Variance of the random variable X
- **E(X)**: Expected value or mean of X
- **(x - E(X))²**: Squared deviation of each value from the mean
- **f(x)**: Probability density function
- **∫_{-∞}^{∞}**: Integration over the entire range of possible values
- **∫_{-∞}^{∞} x² · f(x)dx**: Expected value of X²
- The formula is the continuous analog of the variance formula for discrete random variables

### Standard Deviation

The standard deviation of a random variable X is:

$$\sigma_X = \sqrt{Var(X)}$$

**Explanation:**
- **σ_X**: Standard deviation of the random variable X
- **Var(X)**: Variance of X
- **√**: Square root operation
- The standard deviation is the square root of the variance
- It measures the average deviation from the mean in the original units of the random variable
- It's more interpretable than variance because it's in the same units as the data

### Properties of Variance

1. Var(c) = 0, where c is a constant
2. Var(cX) = c²·Var(X)
3. Var(X + c) = Var(X)
4. Var(X + Y) = Var(X) + Var(Y) + 2·Cov(X,Y)
5. If X and Y are independent, then Var(X + Y) = Var(X) + Var(Y)

## Common Probability Distributions

### Discrete Distributions

1. **Bernoulli Distribution**
   - Models a single trial with two possible outcomes (success/failure)
   - PMF: P(X = x) = p^x · (1-p)^(1-x) for x ∈ {0, 1}
   - Mean: E(X) = p
   - Variance: Var(X) = p(1-p)
   
   **Explanation:**
   - **p**: Probability of success
   - **1-p**: Probability of failure
   - **x**: 0 (failure) or 1 (success)
   - **p^x**: Equals p when x=1, and 1 when x=0
   - **(1-p)^(1-x)**: Equals 1-p when x=0, and 1 when x=1
   - The distribution models a single trial with binary outcome

2. **Binomial Distribution**
   - Models the number of successes in n independent Bernoulli trials
   - PMF: P(X = x) = (n choose x) · p^x · (1-p)^(n-x) for x ∈ {0, 1, 2, ..., n}
   - Mean: E(X) = np
   - Variance: Var(X) = np(1-p)
   
   **Explanation:**
   - **n**: Number of trials
   - **x**: Number of successes (0 ≤ x ≤ n)
   - **p**: Probability of success on a single trial
   - **(n choose x)**: Binomial coefficient = n!/(x!(n-x)!)
   - **p^x**: Probability of x successes
   - **(1-p)^(n-x)**: Probability of (n-x) failures
   - The distribution models the count of successes in a fixed number of independent trials

3. **Poisson Distribution**
   - Models the number of events occurring in a fixed interval
   - PMF: P(X = x) = (λ^x · e^(-λ))/x! for x ∈ {0, 1, 2, ...}
   - Mean: E(X) = λ
   - Variance: Var(X) = λ
   
   **Explanation:**
   - **λ**: Average rate of occurrence (events per unit time/space)
   - **x**: Number of occurrences (0, 1, 2, ...)
   - **e**: Base of natural logarithm (≈ 2.71828)
   - **x!**: Factorial of x
   - **λ^x**: λ raised to the power of x
   - **e^(-λ)**: Exponential function of -λ
   - The distribution models rare events occurring in a fixed interval of time or space

### Continuous Distributions

1. **Uniform Distribution**
   - All values in a range are equally likely
   - PDF: f(x) = 1/(b-a) for a ≤ x ≤ b
   - Mean: E(X) = (a+b)/2
   - Variance: Var(X) = (b-a)²/12
   
   **Explanation:**
   - **a**: Lower bound of the range
   - **b**: Upper bound of the range
   - **b-a**: Width of the range
   - **1/(b-a)**: Height of the PDF (constant across the range)
   - The distribution models situations where any value in a range is equally likely
   - The PDF forms a rectangle with height 1/(b-a) and width (b-a)

2. **Normal Distribution**
   - Bell-shaped curve, symmetric around the mean
   - PDF: f(x) = (1/(σ√(2π))) · e^(-(x-μ)²/(2σ²)) for -∞ < x < ∞
   - Mean: E(X) = μ
   - Variance: Var(X) = σ²
   
   **Explanation:**
   - **μ**: Mean (center of the distribution)
   - **σ**: Standard deviation (spread of the distribution)
   - **σ²**: Variance
   - **π**: Mathematical constant pi (≈ 3.14159)
   - **e**: Base of natural logarithm (≈ 2.71828)
   - **(x-μ)²/(2σ²)**: Standardized squared distance from the mean
   - **e^(-(x-μ)²/(2σ²))**: Exponential function that creates the bell shape
   - **1/(σ√(2π))**: Normalizing constant that ensures the total area equals 1
   - The distribution models many natural phenomena and is the basis for much of statistical inference 