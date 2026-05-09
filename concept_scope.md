# STAT 2150 — Concept Scope to Master

> Derived from the Fall 2018 course outline (Prof. Saman Muthukumarana, U of M).  
> Organized by topic → subtopic → specific skills. Use for study planning and progress tracking.

---

## 1. Exploratory Data Analysis (EDA)

### 1.1 Summarizing Data
- [ ] Categorical data summaries (frequency tables, bar charts, mode)
- [ ] Numerical data summaries (mean, median, variance, SD, range, IQR)
- [ ] Bi-variate data summaries (cross-tabulations, scatter plots, correlation)
- [ ] Time series data summaries (trend, seasonality, basic plots)

### 1.2 Quantiles & Distribution Shape
- [ ] Quantiles and percentiles (calculation, interpretation)
- [ ] Normal quantile plots (Q-Q plots) — construction and interpretation
- [ ] Skewness — definition, formula, interpreting sign
- [ ] Kurtosis — definition, formula, interpreting value

### 1.3 Advanced Visualization
- [ ] Contour plots
- [ ] 3D surface plots
- [ ] Matrix plots (pairs/scatterplot matrices)
- [ ] Parallel coordinates plots
- [ ] Multidimensional scaling (MDS)
- [ ] Pivot tables
- [ ] Slice and dice (subsetting/faceting data)

---

## 2. R Programming Fundamentals

### 2.1 Data Handling
- [ ] Reading data from files (CSV, text, other sources)
- [ ] Writing data to files
- [ ] Data exploration functions (`str()`, `summary()`, `head()`, `dim()`)
- [ ] Data representation (vectors, matrices, data frames, lists)

### 2.2 Data Wrangling
- [ ] Subsetting and indexing (logical, positional, by name)
- [ ] Filtering, sorting, merging data frames
- [ ] Handling missing values (`NA`)
- [ ] Transforming variables (log, scale, factor)

### 2.3 Control Flow & Functions
- [ ] `for` loops
- [ ] `while` loops
- [ ] `if` / `else if` / `else` statements
- [ ] Writing custom R functions (arguments, return values, defaults)
- [ ] `apply()` family (`apply`, `sapply`, `lapply`, `tapply`)

---

## 3. Random Variables & Probability Distributions

### 3.1 Probability Foundations
- [ ] Conditional probability (definition, calculation)
- [ ] Bayes' theorem (basic applications)
- [ ] Independence

### 3.2 Discrete Random Variables
- [ ] PMF (probability mass function)
- [ ] CDF (cumulative distribution function)
- [ ] Key distributions: Binomial, Poisson, Geometric, Hypergeometric
- [ ] Expectation E(X) — definition and calculation
- [ ] Variance Var(X) — definition and calculation
- [ ] R functions: `dbinom()`, `pbinom()`, `qbinom()`, `rbinom()` (and equivalents)

### 3.3 Continuous Random Variables
- [ ] PDF (probability density function)
- [ ] CDF and quantile function
- [ ] Key distributions: Normal, Exponential, Uniform, Gamma, Chi-squared, t, F
- [ ] Expectation and variance for continuous RVs
- [ ] R functions: `dnorm()`, `pnorm()`, `qnorm()`, `rnorm()` (and equivalents)

---

## 4. Estimation

### 4.1 Point Estimation
- [ ] Method of moments
- [ ] Maximum likelihood estimation (concept, simple cases)
- [ ] Properties of estimators: unbiasedness, consistency, efficiency

### 4.2 Interval Estimation
- [ ] Confidence intervals — construction and interpretation
- [ ] CI for mean (known σ, unknown σ)
- [ ] CI for proportion
- [ ] Pivotal quantity method
- [ ] Interpreting confidence level correctly

---

## 5. Hypothesis Testing

### 5.1 Framework
- [ ] Null vs. alternative hypotheses (one-sided, two-sided)
- [ ] Test statistic construction
- [ ] p-value calculation and interpretation
- [ ] Type I error (α) and Type II error (β)
- [ ] Power of a test (1 − β)
- [ ] Significance level and decision rules

### 5.2 Specific Tests
- [ ] z-test for means
- [ ] t-test for means (one-sample, two-sample, paired)
- [ ] Test for proportions
- [ ] Cross-tabulations and tests of association (χ² test of independence)
- [ ] Goodness-of-fit tests (χ² goodness-of-fit)

---

## 6. Data Simulation & Resampling Methods

### 6.1 Generating Random Data
- [ ] `set.seed()` for reproducibility
- [ ] Generating from known distributions (`rnorm`, `runif`, `rbinom`, etc.)
- [ ] Inverse transform method
- [ ] Accept-reject method (conceptual)

### 6.2 Monte Carlo Methods
- [ ] Monte Carlo estimation of probabilities
- [ ] Monte Carlo estimation of integrals
- [ ] Evaluating statistical procedures via simulation
- [ ] Understanding large-sample results through simulation (LLN, CLT demos)

### 6.3 Resampling
- [ ] Permutation tests — logic and implementation
- [ ] Bootstrap — nonparametric bootstrap procedure
- [ ] Bootstrap confidence intervals (percentile method, basic, BCa)
- [ ] Bootstrap hypothesis tests
- [ ] Cross-validation (concept and basic implementation)

---

## 7. Regression & ANOVA

### 7.1 Simple Linear Regression
- [ ] Model: Y = β₀ + β₁X + ε
- [ ] Least squares estimation of β₀, β₁
- [ ] Inference for slope and intercept (t-tests, CIs)
- [ ] R² and interpretation
- [ ] Residual analysis and assumptions (linearity, normality, homoscedasticity)
- [ ] Prediction vs. confidence intervals
- [ ] R: `lm()`, `summary()`, `plot()`, `predict()`

### 7.2 ANOVA (Analysis of Variance)
- [ ] One-way ANOVA setup and hypotheses
- [ ] Building the ANOVA table (SS_between, SS_within, MS, F-statistic)
- [ ] Assumptions: normality, equal variances, independence
- [ ] Assessing assumptions and diagnostics (residual plots, Levene's test, Shapiro-Wilk)
- [ ] Post-hoc comparisons (Tukey HSD — conceptual)
- [ ] R: `aov()`, `anova()`, `TukeyHSD()`

---

## 8. R Markdown

- [ ] Basic structure (YAML header, chunks, text)
- [ ] Code chunks — options (`echo`, `eval`, `results`)
- [ ] Inline R code
- [ ] Rendering reports (HTML, PDF)
- [ ] Including plots and tables in reports

---

## Priority Matrix (by exam weight)

| Priority | Topic | Why |
|----------|-------|-----|
| ★★★ | Sections 3–7 (RV, Estimation, Testing, Simulation, Regression) | Core theory — dominates midterm & final |
| ★★☆ | Section 1 (EDA) | Foundation for everything; tested via interpretation questions |
| ★★☆ | Section 2 (R Programming) | Needed for assignments, labs, and code-on-paper exam questions |
| ★☆☆ | Section 8 (R Markdown) | Assignments only; not directly tested on exams |

---

## Study Order Suggestion (time-efficient path)

1. **R basics** (Section 2) — get fluent early so assignments are fast
2. **EDA** (Section 1) — quick wins, visual intuition
3. **Random Variables & Distributions** (Section 3) — foundation for everything after
4. **Estimation** (Section 4) — builds on Section 3
5. **Hypothesis Testing** (Section 5) — builds on Section 4
6. **Simulation & Resampling** (Section 6) — ties together Sections 2–5
7. **Regression & ANOVA** (Section 7) — capstone topic
8. **R Markdown** (Section 8) — learn just enough for assignment submission
