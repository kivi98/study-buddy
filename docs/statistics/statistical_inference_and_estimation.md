# Statistical Inference and Estimation

**Source:** Note-04.pdf  
**Course:** Statistics for Computing (CSC 502)  
**Instructor:** Prof. (Dr.) R.M. Kapila Rathnayaka

## Navigation

[Table of Contents](README.md) | 
[Statistics Fundamentals](statistics_fundamentals_summary.md) | 
[Measures of Central Tendency](measures_of_central_tendency.md) | 
[Random Variables and Probability Distributions](random_variables_and_probability_distributions.md) | 
**Statistical Inference and Estimation** | 
[Correlation Analysis](correlation_analysis.md) | 
[Regression Analysis](regression_analysis.md) | 
[Time Series Analysis](time_series_analysis.md)

---

## Introduction to Statistical Inference

Statistical inference is the process of making an estimate, prediction, or decision about a population based on a sample. It involves using sample statistics to draw conclusions or inferences about characteristics of populations.

The process flows from:
- Population (with parameters) → Sample (with statistics) → Inference

## Statistical Estimation

Statisticians use sample statistics to estimate population parameters. For example:
- Sample means are used to estimate population means
- Sample proportions are used to estimate population proportions

## Types of Estimation

### 1. Point Estimation

A point estimate of a population parameter is a single value of a statistic.

**Examples:**
- The sample mean (x̄) is a point estimate of the population mean (μ)
- The sample variance (s²) is a point estimate of the population variance (σ²)
- The sample proportion (p) is a point estimate of the population proportion (P)

### 2. Interval Estimation

An interval estimate is defined by two numbers, between which a population parameter is said to lie. For example, a < μ < b is an interval estimate of the population mean μ.

## Confidence Intervals

Confidence intervals provide an upper and lower limit around a sample mean, within which we can be confident we have captured the population mean. They are calculated from an estimate of how far away our sample mean is from the actual population mean.

**Key points:**
- The lower and upper limits tell us the range of values our true population mean is likely to lie within
- Higher confidence levels (e.g., 99% vs. 90%) require wider intervals
- Confidence intervals account for sampling error

## Requirements for Confidence Interval Estimation

The approach for constructing confidence intervals is valid when:
1. The sampling method is simple random sampling
2. The sampling distribution is approximately normally distributed

The sampling distribution will be approximately normally distributed if any of these conditions apply:
- The population distribution is normal
- The sampling distribution is symmetric, unimodal, without outliers, and the sample size is 30 or less
- The sample size is greater than 30, without outliers

## Confidence Intervals for Population Mean

### Case 1: When Population Variance (σ²) is Known

For a random sample of size n from a normal distribution with mean μ and known variance σ²:

**Formula:**
$$\bar{x} - z_{\alpha/2} \frac{\sigma}{\sqrt{n}} < \mu < \bar{x} + z_{\alpha/2} \frac{\sigma}{\sqrt{n}}$$

Or more compactly:
$$\bar{x} \pm z_{\alpha/2} \frac{\sigma}{\sqrt{n}}$$

**Explanation:**
- **x̄**: Sample mean (the average of the sample data)
- **μ**: Population mean (the parameter we're estimating)
- **σ**: Population standard deviation (assumed to be known)
- **n**: Sample size (number of observations)
- **√n**: Square root of the sample size
- **σ/√n**: Standard error of the mean (standard deviation of the sampling distribution)
- **z_α/2**: Critical value from the standard normal distribution for the desired confidence level
- **z_α/2 · (σ/√n)**: Margin of error
- The formula creates an interval centered at the sample mean with a width determined by the margin of error
- The confidence level determines how wide the interval needs to be to capture the true parameter

**Common z-values for confidence levels:**
- 68% confidence: z<sub>0.16</sub> = 1.00
- 90% confidence: z<sub>0.05</sub> = 1.645
- 95% confidence: z<sub>0.025</sub> = 1.96
- 99% confidence: z<sub>0.005</sub> = 2.576

### Example 1:
According to a random sample of 30 students, the average reading speed is 80 words per minute with a population standard deviation of 6.8 words per minute.

For a 95% confidence interval:
$$80 \pm 1.96 \times \frac{6.8}{\sqrt{30}} = 80 \pm 2.43 = [77.57, 82.43]$$

We are 95% confident that the true mean reading speed of students is between 77.57 and 82.43 words per minute.

### Case 2: When Population Variance (σ²) is Unknown and Sample Size is Small (n ≤ 30)

For a random sample of size n from a normal distribution with mean μ and unknown variance:

**Formula:**
$$\bar{x} \pm t_{\alpha/2, n-1} \frac{s}{\sqrt{n}}$$

**Explanation:**
- **x̄**: Sample mean
- **s**: Sample standard deviation (used to estimate the unknown population standard deviation)
- **n**: Sample size
- **√n**: Square root of the sample size
- **s/√n**: Estimated standard error of the mean
- **t_α/2, n-1**: Critical value from the t-distribution with n-1 degrees of freedom
- **n-1**: Degrees of freedom (accounts for the fact that we're estimating σ with s)
- The t-distribution has heavier tails than the normal distribution, resulting in wider intervals
- As sample size increases, the t-distribution approaches the normal distribution
- This formula is used when we don't know the population standard deviation and have a small sample

### Example 2:
The weights (in grams) of 10 snack packs of candies are:
55.54, 56.54, 57.58, 55.13, 57.48, 56.06, 59.93, 58.30, 52.57, 58.46

Sample mean (x̄) = 56.76
Sample standard deviation (s) = 2.12

For a 95% confidence interval with 9 degrees of freedom:
$$56.76 \pm 2.262 \times \frac{2.12}{\sqrt{10}} = 56.76 \pm 1.52 = [55.24, 58.28]$$

We are 95% confident that the true mean weight of the snack packs is between 55.24 and 58.28 grams.

### Case 3: When Population Variance (σ²) is Unknown and Sample Size is Large (n > 30)

For a random sample of size n from a normal distribution with mean μ and unknown variance, when n > 30:

**Formula:**
$$\bar{x} \pm z_{\alpha/2} \frac{s}{\sqrt{n}}$$

**Explanation:**
- **x̄**: Sample mean
- **s**: Sample standard deviation
- **n**: Sample size (greater than 30)
- **√n**: Square root of the sample size
- **s/√n**: Estimated standard error of the mean
- **z_α/2**: Critical value from the standard normal distribution
- When the sample size is large (n > 30), the t-distribution is very close to the normal distribution
- Therefore, we can use z-values instead of t-values for large samples
- This simplifies calculations while still providing accurate confidence intervals

**Note:** When n > 30, the t-distribution approaches the normal distribution, so we can use z-values instead of t-values.

## Factors Affecting the Width of Confidence Intervals

1. **Confidence Level**: Higher confidence levels result in wider intervals
   - 99% confidence interval is wider than a 95% confidence interval
   - This is because higher confidence requires capturing a larger proportion of possible sample means

2. **Sample Size**: Larger sample sizes result in narrower intervals
   - The standard error (σ/√n or s/√n) decreases as n increases
   - Larger samples provide more information about the population, reducing uncertainty

3. **Population Variability**: Greater population variability results in wider intervals
   - Larger values of σ or s result in wider intervals
   - More variable populations require wider intervals to capture the true parameter with the same confidence

## Interpretation of Confidence Intervals

A 95% confidence interval means that if we were to take 100 different samples and compute a 95% confidence interval for each sample, then approximately 95 of the 100 confidence intervals would contain the true population parameter.

**Important note:** The confidence level does not tell us the probability that the specific interval we calculated contains the true parameter. Once we calculate an interval, the true parameter either is or is not in that interval.

## Prediction Intervals

While confidence intervals estimate population parameters, prediction intervals predict the value of a future observation.

**Formula for a prediction interval for a future observation:**
$$\bar{x} \pm t_{\alpha/2, n-1} \times s \times \sqrt{1 + \frac{1}{n}}$$

**Explanation:**
- **x̄**: Sample mean
- **s**: Sample standard deviation
- **n**: Sample size
- **t_α/2, n-1**: Critical value from the t-distribution with n-1 degrees of freedom
- **√(1 + 1/n)**: Accounts for both the uncertainty in estimating the mean and the variability of individual observations
- The prediction interval is always wider than the corresponding confidence interval
- This is because predicting an individual value involves more uncertainty than estimating a population mean

### Example:
For a mortgage loan example with x̄ = $257,300, σ = $25,000, and n = 25:

For a 95% prediction interval:
$$257,300 \pm 1.96 \times 25,000 \times \sqrt{1 + \frac{1}{25}} = 257,300 \pm 50,990 = [$206,310, $308,290]$$

We are 95% confident that the next customer's loan amount will be between $206,310 and $308,290. 