# Regression Analysis

**Source:** Note-06.pdf  
**Course:** Statistics for Computing (CSC 502)  
**Instructor:** Prof. (Dr.) R.M. Kapila Rathnayaka

## Navigation

[Table of Contents](README.md) | 
[Statistics Fundamentals](statistics_fundamentals_summary.md) | 
[Measures of Central Tendency](measures_of_central_tendency.md) | 
[Random Variables and Probability Distributions](random_variables_and_probability_distributions.md) | 
[Statistical Inference and Estimation](statistical_inference_and_estimation.md) | 
[Correlation Analysis](correlation_analysis.md) | 
**Regression Analysis** | 
[Time Series Analysis](time_series_analysis.md)

---

## Introduction to Regression Analysis

Regression analysis is a powerful statistical method that examines the relationship between two or more variables of interest. It generates an equation to:
- Describe the statistical relationship between predictors and response variables
- Predict new observations
- Determine the probable change in one variable for a given amount of change in another

## Regression Equation

The regression equation is the algebraic expression of the regression line:

$$Y = a + bX$$

**Explanation:**
- **Y**: Dependent variable (the outcome or response variable you're trying to predict)
- **X**: Independent variable (the predictor or explanatory variable)
- **a**: Y-intercept (the value of Y when X = 0)
- **b**: Slope coefficient (the change in Y for a one-unit change in X)
- The equation represents a straight line in a two-dimensional space
- It allows us to predict the value of Y for any given value of X
- The equation minimizes the sum of squared differences between observed and predicted values

## Methods of Obtaining Regression Line

There are two primary methods for obtaining a regression line:

### 1. The Scatter Diagram Method

- Scatter diagram is the simplest method for representing data
- For n pairs of values (x₁, y₁), (x₂, y₂), ..., (xₙ, yₙ):
  - Plot the independent variable (X) on the horizontal axis
  - Plot the dependent variable (Y) on the vertical axis
- Calculate the mean point (X̄, Ȳ)
- Draw a line through the mean point that best represents the data

### 2. Method of Least Squares

The method of ordinary least squares (OLS) regression calculates the equation by minimizing the sum of squared distances between the sample's data points and the values predicted by the equation.

#### Formulas for Least Squares Estimation

For a simple linear regression model Y = a + bX:

The slope (b) is calculated as:

$$b = \frac{\sum(x_i - \bar{x})(y_i - \bar{y})}{\sum(x_i - \bar{x})^2} = \frac{n\sum x_i y_i - \sum x_i \sum y_i}{n\sum x_i^2 - (\sum x_i)^2}$$

**Explanation:**
- **b**: Slope coefficient (change in Y for a one-unit change in X)
- **x_i** and **y_i**: Individual data points
- **x̄** and **ȳ**: Means of X and Y variables
- **(x_i - x̄)** and **(y_i - ȳ)**: Deviations from the respective means
- **Σ(x_i - x̄)(y_i - ȳ)**: Sum of the products of deviations (covariance × n)
- **Σ(x_i - x̄)²**: Sum of squared deviations for X (variance × n)
- **n**: Number of data points
- **Σx_i y_i**: Sum of the products of X and Y values
- **Σx_i** and **Σy_i**: Sums of X and Y values
- **Σx_i²**: Sum of squared X values
- The formula finds the slope that minimizes the sum of squared residuals
- The first form of the equation is conceptual, while the second form is computationally more efficient

The intercept (a) is calculated as:

$$a = \bar{y} - b\bar{x}$$

**Explanation:**
- **a**: Y-intercept (value of Y when X = 0)
- **ȳ**: Mean of Y values
- **b**: Slope coefficient (already calculated)
- **x̄**: Mean of X values
- The formula ensures that the regression line passes through the point (x̄, ȳ)
- This is a direct result of the least squares method
- It positions the line to balance the positive and negative residuals

## The Classical Assumptions of Linear Regression

For the linear regression model to be valid, several assumptions must be met:

1. **Linearity**: The relationship between X and Y is linear
2. **Independence**: Observations are independent of each other
3. **Homoscedasticity**: The variance of residuals is constant across all levels of X
4. **Normality**: For any fixed value of X, Y is normally distributed
5. **No multicollinearity**: Independent variables are not highly correlated with each other (for multiple regression)

## Regression Validation

Model validation is a crucial step in the model building process. While there are many statistical tools for model validation, the primary tool for most process modeling applications is graphical residual analysis.

### Residual Plots

A residual plot shows the residuals (differences between observed and predicted values) on the vertical axis and the independent variable on the horizontal axis.

**Formula for Residuals:**
$$e_i = y_i - \hat{y}_i = y_i - (a + bx_i)$$

**Explanation:**
- **e_i**: Residual for the ith observation
- **y_i**: Observed value of Y
- **ŷ_i**: Predicted value of Y
- **a + bx_i**: Regression equation applied to the ith value of X
- Residuals represent the unexplained variation in the data
- They should be randomly distributed around zero if the model is appropriate

Interpretation of residual plots:
- **Random pattern around horizontal axis**: Linear regression model is appropriate
- **Non-random pattern (U-shaped or inverted U)**: Non-linear model may be more appropriate
- **Funnel shape**: Indicates heteroscedasticity (non-constant variance)
- **Outliers**: Points far from the main cluster may have high influence on the model

## R-squared (Coefficient of Determination)

R-squared is a statistical measure of how close the data points are to the fitted regression line.

### Definition and Interpretation

- R-squared is the percentage of the response variable variation explained by the linear model
- R-squared is always between 0% and 100%:
  - 0%: Model explains none of the variability of the response data around its mean
  - 100%: Model explains all the variability of the response data around its mean
- Generally, the higher the R-squared, the better the model fits the data

### Formula

$$R^2 = 1 - \frac{SS_{res}}{SS_{tot}} = 1 - \frac{\sum(y_i - \hat{y}_i)^2}{\sum(y_i - \bar{y})^2}$$

**Explanation:**
- **R²**: Coefficient of determination
- **SS_res**: Sum of squares of residuals (unexplained variation)
- **SS_tot**: Total sum of squares (total variation)
- **y_i**: Observed values
- **ŷ_i**: Predicted values from the regression
- **ȳ**: Mean of observed values
- **(y_i - ŷ_i)²**: Squared residuals (differences between observed and predicted values)
- **(y_i - ȳ)²**: Squared deviations from the mean
- **Σ(y_i - ŷ_i)²**: Sum of squared residuals
- **Σ(y_i - ȳ)²**: Total sum of squares
- The formula represents the proportion of variance in Y that is explained by X
- It compares the fitted model to a horizontal line at ȳ (the simplest possible model)
- A value close to 1 indicates that the model explains most of the variation in the data

### Adjusted R-squared

For multiple regression, adjusted R-squared accounts for the number of predictors:

$$R^2_{adj} = 1 - \frac{(1-R^2)(n-1)}{n-p-1}$$

**Explanation:**
- **R²_adj**: Adjusted R-squared
- **R²**: Regular R-squared
- **n**: Number of observations
- **p**: Number of predictors (excluding the intercept)
- The formula penalizes the addition of predictors that don't improve the model much
- It helps prevent overfitting when comparing models with different numbers of predictors

## Case Study Example

The following data shows the age (in years) and systolic blood pressure of 20 apparently healthy adults:

| B.P (y) | Age (x) | B.P (y) | Age (x) |
|---------|---------|---------|---------|
| 128     | 46      | 120     | 20      |
| 136     | 53      | 128     | 43      |
| 146     | 60      | 141     | 63      |
| 124     | 20      | 126     | 26      |
| 143     | 63      | 134     | 53      |
| 130     | 43      | 128     | 31      |
| 124     | 26      | 136     | 58      |
| 121     | 19      | 132     | 46      |
| 126     | 31      | 140     | 58      |
| 123     | 23      | 144     | 70      |

Tasks:
1. Find the correlation between age and blood pressure
2. Find the regression equation
3. Calculate R-squared and comment on the model fit
4. Predict the blood pressure for a 25-year-old man

## Applications of Regression Analysis

Regression analysis can be applied in various fields:

1. **Business and Economics**:
   - Forecasting sales based on advertising expenditure
   - Predicting stock prices based on market indicators
   - Estimating production costs based on volume

2. **Health Sciences**:
   - Predicting disease risk based on patient characteristics
   - Analyzing the relationship between treatment dosage and response
   - Studying the effect of lifestyle factors on health outcomes

3. **Social Sciences**:
   - Examining the relationship between education and income
   - Analyzing factors affecting student performance
   - Studying demographic trends

4. **Engineering and Computer Science**:
   - Predicting system performance based on specifications
   - Analyzing factors affecting software reliability
   - Optimizing processes based on input parameters

## Multiple Regression

While simple linear regression involves one independent variable, multiple regression involves two or more independent variables:

$$Y = a + b_1X_1 + b_2X_2 + ... + b_nX_n$$

**Explanation:**
- **Y**: Dependent variable
- **X₁, X₂, ..., Xₙ**: Independent variables
- **a**: Intercept (value of Y when all X variables are 0)
- **b₁, b₂, ..., bₙ**: Regression coefficients (partial slopes)
- Each coefficient represents the change in Y for a one-unit change in the corresponding X variable, holding all other variables constant
- The equation allows for modeling complex relationships with multiple predictors
- It helps identify which factors have the strongest influence on the outcome

Multiple regression allows for more complex analysis of relationships between variables and can provide more accurate predictions when multiple factors influence the outcome. 