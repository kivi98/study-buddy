# Time Series Analysis

**Source:** Note-07.pdf  
**Course:** Statistics for Computing (CSC 502)  
**Instructor:** Prof. (Dr.) R.M. Kapila Rathnayaka

## Navigation

[Table of Contents](README.md) | 
[Statistics Fundamentals](statistics_fundamentals_summary.md) | 
[Measures of Central Tendency](measures_of_central_tendency.md) | 
[Random Variables and Probability Distributions](random_variables_and_probability_distributions.md) | 
[Statistical Inference and Estimation](statistical_inference_and_estimation.md) | 
[Correlation Analysis](correlation_analysis.md) | 
[Regression Analysis](regression_analysis.md) | 
**Time Series Analysis**

---

## Introduction to Time Series

A time series is a sequence of measurements done over time, usually obtained at equally spaced intervals, such as:
- Daily
- Monthly
- Quarterly
- Yearly

Time series analysis differs from other statistical methods because the order of observations is crucial. While multiple regression analyzes the relationship between a dependent variable and multiple independent variables at the same time point, time series analysis examines how a variable changes over time and may depend on its own previous values.

## Applications of Time Series Analysis

Time Series Analysis is used for many applications such as:

1. **Economic and Financial Time Series (Economic Forecasting)**
   - Inflation rates
   - GDP growth
   - Unemployment rates
   - Stock prices

2. **Physical Time Series**
   - Rainfall measurements
   - Temperature readings
   - Climate data

3. **Marketing Time Series (Sales Forecasting)**
   - Product demand
   - Sales figures
   - Market trends

4. **Demographic Time Series**
   - Annual population rates
   - Birth rates
   - Migration patterns

## Components of a Time Series

The major components or patterns that are analyzed through time series are:

### 1. Trend

- Trend is the long-term increase or decrease in the series over a period of time
- It measures the average change in the variable per unit time
- This trend may show growth or decline in a time series over a long period
- Typically represented by a straight line or smooth curve

### 2. Seasonal Variations

- Short-term movements occurring in data due to seasonal factors
- Periodic variations that recur with some degree of regularity within a year or shorter period
- Examples:
  - Ice cream sales are higher during summer months and lower during winter
  - Sales of greeting cards and fireworks increase during holidays like Valentine's Day, Christmas, and New Year

### 3. Cyclical Variations

- Ups and downs recurring after a period from time to time
- These oscillations are mostly observed in economic data
- The periods of such oscillations generally extend from five to twelve years or more
- Associated with business cycles (or economic cycles or boom-bust cycles)
- Unlike seasonal variations, cyclical variations have longer and variable duration

### 4. Irregular Variations / Random Variations

- Sudden changes occurring in a time series which are unlikely to be repeated
- The component of a time series which cannot be explained by trend, seasonal, or cyclic movements
- Examples:
  - Natural disasters (floods, fires, earthquakes)
  - Political events (revolutions, strikes)
  - Epidemics
  - Other unpredictable events

## Time Series Models

Time series data can be modeled using different approaches:

### Additive Model

In an additive model, the components of the time series are added together:

$$Y_t = T_t + S_t + C_t + I_t$$

**Explanation:**
- **Y_t**: Value of the time series at time t
- **T_t**: Trend component at time t
- **S_t**: Seasonal component at time t
- **C_t**: Cyclical component at time t
- **I_t**: Irregular component at time t
- The components are expressed in the same units as the original data
- The effects of each component are assumed to be independent and constant over time
- The additive model is appropriate when the seasonal variations are relatively constant over time
- It works well when the magnitude of seasonal fluctuations doesn't change as the level of the series changes

### Multiplicative Model

In a multiplicative model, the components of the time series are multiplied:

$$Y_t = T_t \times S_t \times C_t \times I_t$$

**Explanation:**
- **Y_t**: Value of the time series at time t
- **T_t**: Trend component at time t
- **S_t**: Seasonal component at time t
- **C_t**: Cyclical component at time t
- **I_t**: Irregular component at time t
- The seasonal and irregular components are expressed as percentages or ratios
- The trend and cyclical components are in the same units as the original data
- The multiplicative model is appropriate when the seasonal variations increase or decrease proportionally with the level of the series
- It works well when the magnitude of seasonal fluctuations changes as the level of the series changes

## Analysis Procedure

The procedure for describing a time series typically consists of three stages:

1. **Deseasonalizing the time series**
   - Removing seasonal effects to better observe the underlying trend and cyclical variations

2. **Developing the trend line**
   - Identifying and modeling the long-term movement in the data

3. **Finding the cyclical variation around the trend line**
   - Analyzing the oscillations that occur around the trend

## Time Series Forecasting Methods

Several methods are used for time series forecasting:

### 1. Moving Averages

A simple method that uses the average of a fixed number of the most recent observations to forecast the next value.

**Formula for Simple Moving Average (SMA):**

$$SMA_t = \frac{Y_{t-1} + Y_{t-2} + ... + Y_{t-n}}{n} = \frac{\sum_{i=1}^{n} Y_{t-i}}{n}$$

**Explanation:**
- **SMA_t**: Simple moving average for period t
- **Y_{t-1}, Y_{t-2}, ..., Y_{t-n}**: Observed values in previous periods
- **n**: Number of periods in the moving average
- **Σ Y_{t-i}**: Sum of the n most recent observations
- The formula calculates the arithmetic mean of the n most recent observations
- Each observation is given equal weight (1/n)
- The moving average "smooths" the time series by averaging out short-term fluctuations
- As new data becomes available, the oldest data point is dropped and the newest is added
- Larger values of n result in smoother averages but less responsiveness to recent changes

### 2. Exponential Smoothing

A weighted average method that gives more weight to recent observations and less weight to older observations.

**Formula for Simple Exponential Smoothing:**

$$F_{t+1} = \alpha Y_t + (1-\alpha) F_t$$

**Explanation:**
- **F_{t+1}**: Forecast for the next period
- **Y_t**: Actual value in the current period
- **F_t**: Forecast for the current period
- **α**: Smoothing constant (0 < α < 1)
- The formula is a weighted average of the current observation and the previous forecast
- α determines the weight given to the most recent observation
- (1-α) determines the weight given to the previous forecast
- Higher values of α give more weight to recent observations (more responsive)
- Lower values of α give more weight to past observations (more stable)
- The formula can be expanded to show that all past observations influence the forecast, with weights decreasing exponentially

### 3. Autoregressive Integrated Moving Average (ARIMA) Models

ARIMA models combine autoregressive (AR) and moving average (MA) components after differencing the series to make it stationary.

**Components of ARIMA(p,d,q):**
- p = Order of the autoregressive part
- d = Degree of differencing
- q = Order of the moving average part

**Autoregressive (AR) Component:**
$$Y_t = c + \phi_1 Y_{t-1} + \phi_2 Y_{t-2} + ... + \phi_p Y_{t-p} + \varepsilon_t$$

**Explanation:**
- **Y_t**: Value at time t
- **c**: Constant
- **φ_1, φ_2, ..., φ_p**: Parameters of the autoregressive model
- **Y_{t-1}, Y_{t-2}, ..., Y_{t-p}**: Previous values in the series
- **ε_t**: Error term
- The AR component models the value as a linear combination of its previous values
- The order p determines how many lagged values are included

**Moving Average (MA) Component:**
$$Y_t = \mu + \varepsilon_t + \theta_1 \varepsilon_{t-1} + \theta_2 \varepsilon_{t-2} + ... + \theta_q \varepsilon_{t-q}$$

**Explanation:**
- **Y_t**: Value at time t
- **μ**: Mean of the series
- **ε_t**: Error term at time t
- **θ_1, θ_2, ..., θ_q**: Parameters of the moving average model
- **ε_{t-1}, ε_{t-2}, ..., ε_{t-q}**: Previous error terms
- The MA component models the value as a linear combination of error terms
- The order q determines how many lagged error terms are included

**Differencing:**
$$\nabla Y_t = Y_t - Y_{t-1}$$

**Explanation:**
- **∇Y_t**: First difference of Y at time t
- **Y_t**: Value at time t
- **Y_{t-1}**: Value at time t-1
- Differencing helps make a non-stationary series stationary
- The degree of differencing (d) indicates how many times the series is differenced
- First differencing (d=1) removes linear trends
- Second differencing (d=2) removes quadratic trends

### 4. Seasonal Decomposition

Breaking down the time series into its components (trend, seasonal, cyclical, and irregular) to understand the patterns and make forecasts.

**Process:**
1. Estimate the trend component (T_t)
2. Detrend the series by dividing (multiplicative) or subtracting (additive) the trend
3. Estimate the seasonal component (S_t) by averaging the detrended values for each season
4. Remove the seasonal component to get the cyclical and irregular components
5. Smooth the result to separate the cyclical component (C_t) from the irregular component (I_t)

## Example: Time Series for Monthly Income ($)

| Year | Quarter I | Quarter II | Quarter III | Quarter IV |
|------|-----------|------------|-------------|------------|
| 1991 | 1861      | 2203       | 2415        | 1908       |
| 1992 | 1921      | 2343       | 2514        | 1986       |
| 1993 | 1834      | 2154       | 2098        | 1799       |
| 1994 | 1837      | 2025       | 2304        | 1965       |
| 1995 | 2073      | 2414       | 2339        | 1967       |

This example shows quarterly income data over five years, which can be analyzed for trend, seasonal patterns (higher income in certain quarters), possible cyclical variations, and irregular fluctuations.

## Challenges in Time Series Analysis

1. **Stationarity**: Many time series methods assume that the data is stationary (statistical properties like mean and variance don't change over time)

2. **Seasonality**: Identifying and adjusting for seasonal patterns can be complex

3. **Outliers**: Extreme values can significantly affect forecasts

4. **Model Selection**: Choosing the appropriate forecasting method for a specific time series

5. **Evaluation**: Determining the accuracy and reliability of forecasts

## Importance in Computing

Time series analysis is particularly important in computing for:

1. **Predictive Maintenance**: Forecasting when equipment might fail based on performance metrics

2. **Network Traffic Analysis**: Predicting peak usage times and potential bottlenecks

3. **Resource Allocation**: Optimizing computing resources based on predicted demand

4. **Anomaly Detection**: Identifying unusual patterns that might indicate security breaches or system failures

5. **User Behavior Prediction**: Anticipating user actions to improve user experience 