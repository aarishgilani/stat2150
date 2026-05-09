# Part 1: R Programming Fundamentals — Study Plan

> **Target**: 6 days × 75 min/day ≈ 7.5 hours total  
> **Goal**: Fluency in R data handling, wrangling, control flow, and functions — enough to breeze through assignments  
> **Prerequisites**: R and RStudio installed  

---

## Day 1 — Vectors, Matrices & Basic Data Types (~75 min)

**Objective:** Understand R's atomic data types and create/manipulate vectors and matrices.

- [ ] Read: [R Programming for Data Science — Ch. 4: R Nuts and Bolts](https://bookdown.org/rdpeng/rprogdatascience/r-nuts-and-bolts.html) (sections on data types, vectors, matrices)
- [ ] Read: [R-Tutor: Numeric, Character, Logical](https://www.r-tutor.com/r-introduction/basic-data-types) (skim for quick examples)
- [ ] Skim: [CRAN R Reference Card](https://cran.r-project.org/doc/contrib/Short-refcard.pdf) — page 1 (operators, assignment, basic functions)

### Exercises

**Exercise 1.1 — Create and inspect vectors**
```r
# Create a numeric vector of the first 10 positive even numbers
evens <- seq(2, 20, by = 2)
evens
# Expected: [1]  2  4  6  8 10 12 14 16 18 20

# What's the length?
length(evens)
# Expected: [1] 10

# What's the 7th element?
evens[7]
# Expected: [1] 14

# What's the sum?
sum(evens)
# Expected: [1] 110
```

**Exercise 1.2 — Vector types and coercion**
```r
# Create a character vector
fruits <- c("apple", "banana", "cherry")
class(fruits)
# Expected: [1] "character"

# What happens when you mix types?
mixed <- c(1, "two", 3)
mixed
# Expected: [1] "1"   "two" "3"
class(mixed)
# Expected: [1] "character"
# WHY: R coerces everything to the most flexible type (character > numeric > logical)

# Logical vector
flags <- c(TRUE, FALSE, TRUE, TRUE)
sum(flags)
# Expected: [1] 3  (TRUE = 1, FALSE = 0)
mean(flags)
# Expected: [1] 0.75  (proportion of TRUEs)
```

**Exercise 1.3 — Vectorized operations**
```r
x <- c(10, 20, 30, 40, 50)
y <- c(1, 2, 3, 4, 5)

# Element-wise operations — no loops needed
x + y
# Expected: [1] 11 22 33 44 55

x * y
# Expected: [1]  10  40  90 160 250

x > 25
# Expected: [1] FALSE FALSE  TRUE  TRUE  TRUE
```

**Exercise 1.4 — Matrices**
```r
# Create a 3×4 matrix filled by column (default)
m <- matrix(1:12, nrow = 3, ncol = 4)
m
# Expected:
#      [,1] [,2] [,3] [,4]
# [1,]    1    4    7   10
# [2,]    2    5    8   11
# [3,]    3    6    9   12

# Dimensions
dim(m)
# Expected: [1] 3 4

nrow(m)
# Expected: [1] 3

# Access element at row 2, col 3
m[2, 3]
# Expected: [1] 8

# Access entire row 1
m[1, ]
# Expected: [1]  1  4  7 10

# Access entire column 4
m[, 4]
# Expected: [1] 10 11 12

# Column means
colMeans(m)
# Expected: [1]  2  5  8 11

# Row sums
rowSums(m)
# Expected: [1] 22 26 30
```

### Checkpoint Quiz

<details>
<summary>Q1: What does <code>c(TRUE, 3, "hello")</code> produce and why?</summary>

```r
c(TRUE, 3, "hello")
# [1] "TRUE"  "3"     "hello"
```
All elements coerced to character — the most flexible type in the hierarchy: logical → numeric → character.
</details>

<details>
<summary>Q2: Given <code>v <- c(5, 10, 15, 20, 25)</code>, what does <code>v[c(2, 4)]</code> return?</summary>

```r
v[c(2, 4)]
# [1] 10 20
```
Positional indexing: selects elements at positions 2 and 4.
</details>

<details>
<summary>Q3: What's the difference between <code>matrix(1:6, nrow=2)</code> and <code>matrix(1:6, nrow=2, byrow=TRUE)</code>?</summary>

```r
matrix(1:6, nrow = 2)
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

matrix(1:6, nrow = 2, byrow = TRUE)
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
```
Default fills by column. `byrow = TRUE` fills by row.
</details>

---

## Day 2 — Data Frames, Lists & Reading Data (~75 min)

**Objective:** Create and explore data frames and lists; read data from CSV files.

- [ ] Read: [R Programming for Data Science — Ch. 4 (continued)](https://bookdown.org/rdpeng/rprogdatascience/r-nuts-and-bolts.html) — sections on data frames and lists
- [ ] Read: [R Programming for Data Science — Ch. 7: Getting Data In and Out of R](https://bookdown.org/rdpeng/rprogdatascience/getting-data-in-and-out-of-r.html)
- [ ] Read: [R-Tutor: Data Frame](https://www.r-tutor.com/r-introduction/data-frame)

### Exercises

**Exercise 2.1 — Create and explore a data frame**
```r
students <- data.frame(
  name   = c("Alice", "Bob", "Carla", "Dan", "Eva"),
  grade  = c(85, 92, 78, 90, 88),
  passed = c(TRUE, TRUE, TRUE, TRUE, TRUE)
)

# Inspect it four ways
str(students)
# Expected: 'data.frame': 5 obs. of 3 variables

summary(students)
# Shows min/max/mean for numeric, counts for logical

head(students, 3)
# Expected: first 3 rows

dim(students)
# Expected: [1] 5 3
```

**Exercise 2.2 — Accessing data frame columns**
```r
# Three equivalent ways to get the "grade" column
students$grade
# Expected: [1] 85 92 78 90 88

students[, "grade"]
# Expected: [1] 85 92 78 90 88

students[, 2]
# Expected: [1] 85 92 78 90 88

# Add a new column
students$letter <- ifelse(students$grade >= 90, "A", "B")
students$letter
# Expected: [1] "B" "A" "B" "A" "B"
```

**Exercise 2.3 — Lists (the Swiss Army knife)**
```r
# Lists can hold anything — different types, different lengths
my_list <- list(
  name     = "experiment_1",
  scores   = c(88, 92, 75),
  passed   = TRUE,
  metadata = data.frame(trial = 1:3, result = c("A", "B", "A"))
)

# Access by name (double bracket returns the element itself)
my_list[["name"]]
# Expected: [1] "experiment_1"

my_list$scores
# Expected: [1] 88 92 75

# Single bracket returns a sub-list
class(my_list["name"])
# Expected: [1] "list"

class(my_list[["name"]])
# Expected: [1] "character"

# Access nested data frame
my_list$metadata$result
# Expected: [1] "A" "B" "A"
```

**Exercise 2.4 — Reading and writing CSV**
```r
# Create a sample CSV to read back
write.csv(students, "students.csv", row.names = FALSE)

# Read it
df <- read.csv("students.csv")
str(df)
head(df)

# Check: are they the same?
all.equal(students, df)

# Reading with stringsAsFactors (important for older R)
df2 <- read.csv("students.csv", stringsAsFactors = FALSE)
class(df2$name)
# Expected: [1] "character"

# Clean up
file.remove("students.csv")
```

**Exercise 2.5 — Built-in datasets (quick exploration)**
```r
# Use mtcars — always available in R
head(mtcars, 5)
dim(mtcars)
# Expected: [1] 32 11

names(mtcars)
# Expected: [1] "mpg"  "cyl"  "disp" "hp" ...

str(mtcars)
summary(mtcars$mpg)
# Expected: Min. 1st Qu. Median Mean 3rd Qu. Max.
#           10.40  15.43  19.20 20.09  22.80 33.90
```

### Checkpoint Quiz

<details>
<summary>Q1: What's the difference between <code>my_list["scores"]</code> and <code>my_list[["scores"]]</code>?</summary>

Single bracket `[` returns a **list** containing the element. Double bracket `[[` returns the **element itself**.

Think of it as: `[` returns a train car (still a train), `[[` opens the car and pulls out what's inside.
</details>

<details>
<summary>Q2: You read a CSV and character columns show up as factors. How do you prevent this?</summary>

```r
df <- read.csv("file.csv", stringsAsFactors = FALSE)
```
In R ≥ 4.0, `stringsAsFactors = FALSE` is the default, so this is mostly an issue with older R.
</details>

<details>
<summary>Q3: Given a data frame <code>df</code>, what's the difference between <code>df[1]</code> and <code>df[1,]</code>?</summary>

- `df[1]` → returns the **first column** (as a data frame)
- `df[1,]` → returns the **first row** (as a data frame)

The comma matters: `[row, col]`. Missing row = all rows. Missing col = all cols.
</details>

---

## Day 3 — Subsetting, Indexing & Filtering (~75 min)

**Objective:** Master the three types of subsetting (positional, logical, name-based) and filter data frames.

- [ ] Read: [R Programming for Data Science — Ch. 9: Subsetting R Objects](https://bookdown.org/rdpeng/rprogdatascience/subsetting-r-objects.html)
- [ ] Read: [R Coding Basics — Gastón Sánchez](https://www.gastonsanchez.com/R-coding-basics) — subsetting section
- [ ] Practice: Work through each exercise below in the R console

### Exercises

**Exercise 3.1 — Three ways to subset a vector**
```r
x <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)

# 1. Positional: elements at positions 3, 5, 7
x[c(3, 5, 7)]
# Expected: [1] 30 50 70

# 2. Negative indexing: everything EXCEPT positions 1 and 2
x[-c(1, 2)]
# Expected: [1]  30  40  50  60  70  80  90 100

# 3. Logical: elements greater than 50
x[x > 50]
# Expected: [1]  60  70  80  90 100

# Combine conditions with & (AND) and | (OR)
x[x > 30 & x < 80]
# Expected: [1] 40 50 60 70
```

**Exercise 3.2 — Subsetting data frames (exam favorite)**
```r
# Using mtcars
# Get all cars with mpg > 25
efficient <- mtcars[mtcars$mpg > 25, ]
efficient
# Should show: Fiat 128, Honda Civic, Toyota Corolla, Fiat X1-9, etc.

nrow(efficient)
# Expected: [1] 6

# Get mpg and hp columns for 4-cylinder cars
four_cyl <- mtcars[mtcars$cyl == 4, c("mpg", "hp")]
head(four_cyl)

# Using subset() — cleaner syntax
subset(mtcars, mpg > 30, select = c(mpg, cyl, wt))
# Expected:
#                 mpg cyl    wt
# Fiat 128       32.4   4 2.200
# Honda Civic    30.4   4 1.615
# Toyota Corolla 33.9   4 1.835
# Lotus Europa   30.4   4 1.513
```

**Exercise 3.3 — Sorting data frames**
```r
# Sort mtcars by mpg (ascending)
sorted_asc <- mtcars[order(mtcars$mpg), ]
head(sorted_asc, 3)
# Expected: Cadillac Fleetwood (10.4), Lincoln Continental (10.4), Camaro Z28 (13.3)

# Sort by mpg descending
sorted_desc <- mtcars[order(-mtcars$mpg), ]
head(sorted_desc, 3)
# Expected: Toyota Corolla (33.9), Fiat 128 (32.4), Honda Civic (30.4)

# Sort by cyl ascending, then mpg descending within each cyl group
sorted_multi <- mtcars[order(mtcars$cyl, -mtcars$mpg), ]
head(sorted_multi, 5)
```

**Exercise 3.4 — Handling missing values**
```r
# Create data with NAs
temps <- c(22.1, NA, 24.5, 23.0, NA, 25.2, 21.8)

# Detect NAs
is.na(temps)
# Expected: [1] FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE

sum(is.na(temps))
# Expected: [1] 2

# Mean fails with NAs!
mean(temps)
# Expected: [1] NA

# Fix: remove NAs
mean(temps, na.rm = TRUE)
# Expected: [1] 23.32

# Remove NA values from vector
clean_temps <- temps[!is.na(temps)]
clean_temps
# Expected: [1] 22.1 24.5 23.0 25.2 21.8

# In a data frame
df <- data.frame(x = c(1, 2, NA, 4), y = c(NA, 5, 6, 7))
complete.cases(df)
# Expected: [1] FALSE  TRUE FALSE  TRUE

# Keep only complete rows
df[complete.cases(df), ]
# Expected:
#   x y
# 2 2 5
# 4 4 7
```

**Exercise 3.5 — Merging data frames**
```r
# Two data frames with a common key
info <- data.frame(
  id   = c(1, 2, 3, 4),
  name = c("Alice", "Bob", "Carla", "Dan")
)
scores <- data.frame(
  id    = c(1, 2, 3, 5),
  score = c(88, 92, 75, 95)
)

# Inner join (only matching IDs)
merge(info, scores, by = "id")
# Expected: ids 1, 2, 3 (not 4 or 5)

# Left join (keep all from info)
merge(info, scores, by = "id", all.x = TRUE)
# Expected: ids 1, 2, 3, 4 — Dan gets NA for score

# Full outer join
merge(info, scores, by = "id", all = TRUE)
# Expected: ids 1, 2, 3, 4, 5 — both NAs where no match
```

### Checkpoint Quiz

<details>
<summary>Q1: What does <code>mtcars[mtcars$cyl == 6, ]$mpg</code> return?</summary>

The mpg values for all 6-cylinder cars:
```r
# [1] 21.0 21.0 21.4 18.1 19.2 17.8 19.7
```
First filter rows where cyl == 6, then extract the mpg column.
</details>

<details>
<summary>Q2: You run <code>mean(x)</code> and get <code>NA</code>. What's the most likely cause and fix?</summary>

The vector `x` contains `NA` values. Fix:
```r
mean(x, na.rm = TRUE)
```
**Exam tip:** This comes up constantly. Always check for NAs when a function returns NA unexpectedly.
</details>

<details>
<summary>Q3: What's the difference between <code>merge(a, b, by="id")</code> and <code>merge(a, b, by="id", all.x=TRUE)</code>?</summary>

- `merge(a, b, by="id")` → **inner join** — only rows where id exists in both
- `merge(a, b, by="id", all.x=TRUE)` → **left join** — keeps all rows from `a`, fills NA where no match in `b`
</details>

---

## Day 4 — Transformations & Variable Manipulation (~75 min)

**Objective:** Transform variables (log, scale, factor conversion) and restructure data for analysis.

- [ ] Read: [R Programming for Data Science — Ch. 4](https://bookdown.org/rdpeng/rprogdatascience/r-nuts-and-bolts.html) — factor section
- [ ] Read: [R-Tutor: Factor](https://www.r-tutor.com/r-introduction/factor)
- [ ] Reference: [Posit Base R Cheat Sheet](https://opensource.posit.co/resources/cheatsheets/) — transformations section

### Exercises

**Exercise 4.1 — Factors (categorical variables in R)**
```r
# Create a factor
sizes <- factor(c("S", "M", "L", "M", "S", "L", "L"))
sizes
# Expected: [1] S M L M S L L
# Levels: L M S  (alphabetical by default)

# Check levels
levels(sizes)
# Expected: [1] "L" "M" "S"

# Set custom order (ordinal)
sizes_ord <- factor(sizes, levels = c("S", "M", "L"), ordered = TRUE)
sizes_ord
# Expected: Levels: S < M < L

# Comparison now works
sizes_ord[1] < sizes_ord[3]
# Expected: [1] TRUE  (S < L)

# Frequency table
table(sizes)
# Expected:
# L M S
# 3 2 2
```

**Exercise 4.2 — Numeric to factor and back**
```r
# Binning a continuous variable
ages <- c(22, 35, 28, 45, 19, 55, 33, 41)

# Cut into groups
age_group <- cut(ages, breaks = c(0, 25, 40, 60),
                 labels = c("Young", "Middle", "Senior"))
age_group
# Expected: [1] Young  Middle Middle Senior Young  Senior Middle Senior

table(age_group)
# Expected:
# Young Middle Senior
#     2      3      3

# DANGER: Converting factor to numeric
f <- factor(c("10", "20", "30"))
as.numeric(f)
# Expected: [1] 1 2 3  — WRONG! These are level indices, not values

# Correct way:
as.numeric(as.character(f))
# Expected: [1] 10 20 30
```

**Exercise 4.3 — Log and scale transformations**
```r
# Right-skewed data
income <- c(25000, 32000, 28000, 150000, 45000, 38000, 500000)

mean(income)
# Expected: [1] 116857.1

median(income)
# Expected: [1] 38000
# Big gap between mean and median → skewed

# Log transform
log_income <- log(income)
log_income
# Expected: [1]  10.12663  10.37340  10.24010  11.91839  10.71442  10.54536  13.12236

# Now compare
mean(log_income)
# Expected: [1] 11.00581

median(log_income)
# Expected: [1] 10.54536
# Much closer → log reduces skew

# Standardize (z-score): (x - mean) / sd
z_income <- scale(income)
z_income[, 1]
# Mean of z-scores is ~0, SD is 1
round(mean(z_income), 10)
# Expected: [1] 0

round(sd(z_income), 10)
# Expected: [1] 1
```

**Exercise 4.4 — String manipulation (useful for data cleaning)**
```r
names <- c("  Alice ", "BOB", "carla", "  Dan")

# Trim whitespace
trimws(names)
# Expected: [1] "Alice" "BOB"   "carla" " Dan" — wait, only leading/trailing
trimws(names)
# Expected: [1] "Alice" "BOB"   "carla" "Dan"

# Case conversion
toupper(trimws(names))
# Expected: [1] "ALICE" "BOB"   "CARLA" "DAN"

tolower(trimws(names))
# Expected: [1] "alice" "bob"   "carla" "dan"

# Paste / concatenate
paste("Student", 1:4, sep = "_")
# Expected: [1] "Student_1" "Student_2" "Student_3" "Student_4"

paste0("x", 1:3)
# Expected: [1] "x1" "x2" "x3"
```

### Checkpoint Quiz

<details>
<summary>Q1: You have <code>f <- factor(c("5", "10", "15"))</code>. What does <code>as.numeric(f)</code> return and why is it wrong?</summary>

```r
as.numeric(f)
# [1] 1 2 3
```
It returns the **internal level codes**, not the actual numbers. Fix: `as.numeric(as.character(f))` → `[1] 5 10 15`.

**Exam trap:** This is a classic R gotcha.
</details>

<details>
<summary>Q2: When would you use <code>log()</code> on a variable before analysis?</summary>

When the data is **right-skewed** (long right tail, e.g., income, population). Log transform pulls in extreme values and makes the distribution more symmetric. Common in regression when residuals are non-normal due to skew.
</details>

<details>
<summary>Q3: What does <code>cut(c(15, 25, 35), breaks = c(0, 20, 30, 40))</code> return?</summary>

```r
cut(c(15, 25, 35), breaks = c(0, 20, 30, 40))
# [1] (0,20]  (20,30] (30,40]
# Levels: (0,20] (20,30] (30,40]
```
Each value is placed in the interval that contains it. Intervals are `(lower, upper]` (open left, closed right) by default.
</details>

---

## Day 5 — Control Flow: Loops & Conditionals (~75 min)

**Objective:** Write `for`/`while` loops, `if`/`else` blocks, and understand when to use (and avoid) loops.

- [ ] Read: [R Programming for Data Science — Ch. 13: Control Structures](https://bookdown.org/rdpeng/rprogdatascience/control-structures.html)
- [ ] Read: [R Coding Basics — Gastón Sánchez](https://www.gastonsanchez.com/R-coding-basics) — loops section
- [ ] Skim: [Princeton Rodríguez — Introducing R](https://grodri.github.io/R/) — programming section

### Exercises

**Exercise 5.1 — if/else**
```r
# Basic conditional
score <- 75

if (score >= 90) {
  grade <- "A"
} else if (score >= 80) {
  grade <- "B"
} else if (score >= 70) {
  grade <- "C"
} else {
  grade <- "F"
}
grade
# Expected: [1] "C"

# Vectorized version for a whole column: ifelse()
scores <- c(95, 82, 67, 73, 91)
result <- ifelse(scores >= 70, "Pass", "Fail")
result
# Expected: [1] "Pass" "Pass" "Fail" "Pass" "Pass"
```

**Exercise 5.2 — for loops**
```r
# Print squares of 1 through 5
for (i in 1:5) {
  cat("Square of", i, "is", i^2, "\n")
}
# Expected:
# Square of 1 is 1
# Square of 2 is 4
# Square of 3 is 9
# Square of 4 is 16
# Square of 5 is 25

# Accumulating results in a vector (pre-allocate!)
n <- 10
result <- numeric(n)  # pre-allocate, don't grow in a loop
for (i in 1:n) {
  result[i] <- i^2 + 2*i
}
result
# Expected: [1]  3  8 15 24 35 48 63 80 99 120

# Looping over elements (not just indices)
fruits <- c("apple", "banana", "cherry")
for (fruit in fruits) {
  cat("I like", fruit, "\n")
}
```

**Exercise 5.3 — while loops**
```r
# Find the smallest n where sum(1:n) > 100
n <- 1
while (sum(1:n) <= 100) {
  n <- n + 1
}
cat("n =", n, "and sum =", sum(1:n), "\n")
# Expected: n = 14 and sum = 105

# Simulation: flip a coin until you get 5 heads
set.seed(42)
heads <- 0
flips <- 0
while (heads < 5) {
  flip <- sample(c("H", "T"), 1)
  flips <- flips + 1
  if (flip == "H") heads <- heads + 1
}
cat("Got 5 heads in", flips, "flips\n")
# Expected: Got 5 heads in 8 flips (with seed 42)
```

**Exercise 5.4 — Nested loops (matrix operations)**
```r
# Create a multiplication table
mult_table <- matrix(0, nrow = 5, ncol = 5)
for (i in 1:5) {
  for (j in 1:5) {
    mult_table[i, j] <- i * j
  }
}
mult_table
# Expected:
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    2    3    4    5
# [2,]    2    4    6    8   10
# [3,]    3    6    9   12   15
# [4,]    4    8   12   16   20
# [5,]    5   10   15   20   25

# But in R, you'd actually do:
outer(1:5, 1:5, "*")
# Same result — no loops needed!
```

### Checkpoint Quiz

<details>
<summary>Q1: What's wrong with this code? <code>result <- c(); for (i in 1:10000) result <- c(result, i^2)</code></summary>

**Growing a vector inside a loop** is very slow in R because R copies the entire vector each iteration → O(n²) time. Fix: **pre-allocate** the vector:
```r
result <- numeric(10000)
for (i in 1:10000) result[i] <- i^2
```
Or better yet: `result <- (1:10000)^2` (vectorized).
</details>

<details>
<summary>Q2: What's the difference between <code>if()</code> and <code>ifelse()</code>?</summary>

- `if()` — tests a **single** logical condition, used for control flow
- `ifelse()` — **vectorized**, applies the test to each element of a vector and returns a vector

```r
# if() works on one value
if (5 > 3) "yes" else "no"   # [1] "yes"

# ifelse() works on vectors
ifelse(c(5, 2, 8) > 3, "yes", "no")  # [1] "yes" "no"  "yes"
```
</details>

<details>
<summary>Q3: Write a <code>while</code> loop that finds the first power of 2 greater than 1000.</summary>

```r
x <- 1
while (x <= 1000) {
  x <- x * 2
}
x
# [1] 1024
```
</details>

---

## Day 6 — Functions & the apply() Family (~75 min)

**Objective:** Write reusable R functions and replace loops with `apply()`, `sapply()`, `lapply()`, `tapply()`.

- [ ] Read: [R Programming for Data Science — Ch. 14: Functions](https://bookdown.org/rdpeng/rprogdatascience/functions.html)
- [ ] Read: [R Programming for Data Science — Ch. 18: Loop Functions](https://bookdown.org/rdpeng/rprogdatascience/loop-functions.html)
- [ ] Reference: [CRAN R Reference Card](https://cran.r-project.org/doc/contrib/Short-refcard.pdf) — apply section

### Exercises

**Exercise 6.1 — Writing basic functions**
```r
# Function with one argument
celsius_to_fahrenheit <- function(c) {
  f <- (c * 9/5) + 32
  return(f)
}
celsius_to_fahrenheit(0)
# Expected: [1] 32
celsius_to_fahrenheit(100)
# Expected: [1] 212
celsius_to_fahrenheit(c(-40, 0, 20, 37, 100))
# Expected: [1] -40  32  68  98.6 212
```

**Exercise 6.2 — Default arguments and multiple returns**
```r
# Function with default argument
describe <- function(x, digits = 2) {
  result <- list(
    mean   = round(mean(x, na.rm = TRUE), digits),
    sd     = round(sd(x, na.rm = TRUE), digits),
    n      = length(x),
    n_miss = sum(is.na(x))
  )
  return(result)
}

describe(c(10, 20, 30, NA, 50))
# Expected:
# $mean  [1] 27.5
# $sd    [1] 16.58
# $n     [1] 5
# $n_miss [1] 1

describe(mtcars$mpg, digits = 1)
# Expected:
# $mean  [1] 20.1
# $sd    [1] 6
# $n     [1] 32
# $n_miss [1] 0
```

**Exercise 6.3 — apply() on matrices**
```r
m <- matrix(1:12, nrow = 3)
m
#      [,1] [,2] [,3] [,4]
# [1,]    1    4    7   10
# [2,]    2    5    8   11
# [3,]    3    6    9   12

# apply(X, MARGIN, FUN)
# MARGIN = 1 → rows, MARGIN = 2 → columns

# Row means
apply(m, 1, mean)
# Expected: [1] 5.5 6.5 7.5

# Column sums
apply(m, 2, sum)
# Expected: [1]  6 15 24 33

# Custom function: range of each column
apply(m, 2, function(col) max(col) - min(col))
# Expected: [1] 2 2 2 2
```

**Exercise 6.4 — sapply() and lapply()**
```r
# sapply returns a vector (simplified)
sapply(1:5, function(x) x^2 + 1)
# Expected: [1]  2  5 10 17 26

# lapply returns a list (always)
lapply(1:5, function(x) x^2 + 1)
# Expected: list of 5 elements, each a single number

# Practical: get class of each column in mtcars
sapply(mtcars, class)
# Expected: all "numeric"

# Practical: summary stats for selected columns
sapply(mtcars[, c("mpg", "hp", "wt")], function(col) {
  c(mean = mean(col), sd = sd(col), median = median(col))
})
# Expected: 3×3 matrix with mean/sd/median for each column
```

**Exercise 6.5 — tapply() (split-apply-combine)**
```r
# tapply: apply a function to groups
# Mean mpg by number of cylinders
tapply(mtcars$mpg, mtcars$cyl, mean)
# Expected:
#        4        6        8
# 26.66364 19.74286 15.10000

# SD of hp by cyl
tapply(mtcars$hp, mtcars$cyl, sd)

# Count per group
tapply(mtcars$mpg, mtcars$cyl, length)
# Expected:
#  4  6  8
# 11  7 14

# Multiple grouping with aggregate()
aggregate(mpg ~ cyl + am, data = mtcars, FUN = mean)
# Expected: mean mpg for each cyl × am combination
```

**Exercise 6.6 — Replace a loop with sapply**
```r
# BAD: loop version
results_loop <- numeric(100)
for (i in 1:100) {
  results_loop[i] <- sum(1:i)
}

# GOOD: sapply version (one line)
results_sapply <- sapply(1:100, function(i) sum(1:i))

# Verify they're identical
identical(results_loop, results_sapply)
# Expected: [1] TRUE
```

### Checkpoint Quiz

<details>
<summary>Q1: What does <code>apply(m, 1, sum)</code> do vs <code>apply(m, 2, sum)</code>?</summary>

- `apply(m, 1, sum)` → applies `sum` across each **row** (MARGIN = 1)
- `apply(m, 2, sum)` → applies `sum` down each **column** (MARGIN = 2)

**Remember:** 1 = rows, 2 = columns. Think "1D = row, 2D = column."
</details>

<details>
<summary>Q2: What's the difference between <code>sapply()</code> and <code>lapply()</code>?</summary>

Both apply a function over a list/vector. The difference is the return type:
- `lapply()` **always** returns a **list**
- `sapply()` tries to **simplify** to a vector or matrix

Use `lapply` when you need a list; use `sapply` when you want a clean vector/matrix.
</details>

<details>
<summary>Q3: Write a function that takes a numeric vector and returns a named vector with min, max, and range.</summary>

```r
my_range <- function(x) {
  c(min = min(x, na.rm = TRUE),
    max = max(x, na.rm = TRUE),
    range = max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}
my_range(c(3, 7, 1, 9, 4))
# min max range
#   1   9     8
```
</details>

---

## Part 1 Final Assessment

> Complete these 15 challenges without looking at previous notes. Time yourself — aim for under 60 minutes.  
> If you can do all of these, you're ready for assignments.

- [ ] **Challenge completed**

### Challenges

**1.** Create a vector of the numbers 1 to 50. Extract only the values divisible by 7.

**2.** Create a 4×3 matrix of random integers between 1 and 100 (use `set.seed(123)` then `sample()`). Find the column means.

**3.** Build a data frame with columns: `city` (5 city names), `population` (5 numbers), `country` (5 country names). Display only cities with population > 1,000,000.

**4.** Read the built-in `airquality` dataset. How many rows have missing values? Remove them and store in a new data frame.

**5.** Sort `mtcars` by `hp` in descending order. Show the top 5 most powerful cars (name, hp, mpg).

**6.** Merge these two data frames by `id` and keep all rows from both:
```r
df1 <- data.frame(id = 1:4, name = c("A","B","C","D"))
df2 <- data.frame(id = c(2,4,5), score = c(88, 92, 77))
```

**7.** Convert the `cyl` column in `mtcars` to a factor with levels `"4"`, `"6"`, `"8"`. Create a frequency table.

**8.** Write an `if/else` chain that classifies a BMI value: < 18.5 → "Underweight", 18.5–24.9 → "Normal", 25–29.9 → "Overweight", ≥ 30 → "Obese". Test with BMI = 27.3.

**9.** Write a `for` loop that computes the cumulative sum of `1:20` and stores results in a pre-allocated vector. Verify against `cumsum(1:20)`.

**10.** Write a `while` loop that generates random numbers from Uniform(0,1) until the sum exceeds 10. Report how many numbers were generated.

**11.** Write a function `cv(x)` that computes the coefficient of variation (SD / mean × 100) of a numeric vector, handling NAs. Test on `c(10, 20, 30, NA, 50)`.

**12.** Use `apply()` to compute the standard deviation of each column of `matrix(rnorm(30), nrow = 5)` (set seed 99).

**13.** Use `sapply()` to compute `log2()` of every element in the list `list(a = 4, b = 16, c = 64, d = 256)`.

**14.** Use `tapply()` to find the median `Sepal.Length` for each `Species` in the `iris` dataset.

**15.** Write a function `summarize_df(df)` that takes any data frame and returns a data frame with columns: `col_name`, `type`, `n_missing`, `n_unique`. Test it on `airquality`.

<details>
<summary><strong>Solutions</strong> (click to reveal)</summary>

```r
# --- Challenge 1 ---
v <- 1:50
v[v %% 7 == 0]
# [1]  7 14 21 28 35 42 49

# --- Challenge 2 ---
set.seed(123)
m <- matrix(sample(1:100, 12), nrow = 4, ncol = 3)
colMeans(m)

# --- Challenge 3 ---
cities <- data.frame(
  city       = c("Tokyo", "Lima", "Toronto", "Lagos", "Oslo"),
  population = c(14000000, 10000000, 2900000, 15000000, 700000),
  country    = c("Japan", "Peru", "Canada", "Nigeria", "Norway")
)
cities[cities$population > 1000000, ]

# --- Challenge 4 ---
aq <- airquality
sum(!complete.cases(aq))  # 42 rows with NAs
aq_clean <- aq[complete.cases(aq), ]
nrow(aq_clean)  # 111

# --- Challenge 5 ---
top5 <- mtcars[order(-mtcars$hp), ][1:5, c("hp", "mpg")]
top5
# Maserati Bora (335, 15.0), Ford Pantera L (264, 15.8), ...

# --- Challenge 6 ---
df1 <- data.frame(id = 1:4, name = c("A","B","C","D"))
df2 <- data.frame(id = c(2,4,5), score = c(88, 92, 77))
merge(df1, df2, by = "id", all = TRUE)

# --- Challenge 7 ---
mtcars$cyl_f <- factor(mtcars$cyl, levels = c(4, 6, 8))
table(mtcars$cyl_f)
#  4  6  8
# 11  7 14

# --- Challenge 8 ---
bmi <- 27.3
if (bmi < 18.5) {
  cat("Underweight\n")
} else if (bmi < 25) {
  cat("Normal\n")
} else if (bmi < 30) {
  cat("Overweight\n")
} else {
  cat("Obese\n")
}
# Overweight

# --- Challenge 9 ---
cs <- numeric(20)
for (i in 1:20) {
  cs[i] <- sum(1:i)
}
identical(cs, as.numeric(cumsum(1:20)))
# [1] TRUE

# --- Challenge 10 ---
set.seed(42)
total <- 0
count <- 0
while (total <= 10) {
  total <- total + runif(1)
  count <- count + 1
}
cat("Generated", count, "numbers, sum =", total, "\n")

# --- Challenge 11 ---
cv <- function(x) {
  sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE) * 100
}
cv(c(10, 20, 30, NA, 50))
# [1] 58.18 (approximately)

# --- Challenge 12 ---
set.seed(99)
m <- matrix(rnorm(30), nrow = 5)
apply(m, 2, sd)

# --- Challenge 13 ---
sapply(list(a = 4, b = 16, c = 64, d = 256), log2)
#   a   b   c   d
#   2   4   6   8

# --- Challenge 14 ---
tapply(iris$Sepal.Length, iris$Species, median)
#     setosa versicolor  virginica
#       5.0        5.55       6.5  (approximately)

# --- Challenge 15 ---
summarize_df <- function(df) {
  data.frame(
    col_name  = names(df),
    type      = sapply(df, class),
    n_missing = sapply(df, function(x) sum(is.na(x))),
    n_unique  = sapply(df, function(x) length(unique(x))),
    row.names = NULL
  )
}
summarize_df(airquality)
```
</details>

---

## Progress Tracker

| Day | Topic | Status |
|-----|-------|--------|
| 1 | Vectors, matrices, basic types | ⬜ Not started |
| 2 | Data frames, lists, reading data | ⬜ Not started |
| 3 | Subsetting, indexing, filtering | ⬜ Not started |
| 4 | Transformations & factors | ⬜ Not started |
| 5 | Control flow: loops & conditionals | ⬜ Not started |
| 6 | Functions & apply() family | ⬜ Not started |
| — | Final assessment | ⬜ Not started |

**Estimated total time:** ~7.5 hours (6 days × 75 min + 60 min assessment)

---

## Key Takeaways to Remember

1. **Vectorize first, loop second.** If you can avoid a loop, do it — R is built for vectorized operations.
2. **Pre-allocate vectors** before a `for` loop. Never grow with `c()`.
3. **`na.rm = TRUE`** is your friend. Every aggregate function needs it when NAs exist.
4. **`[` vs `[[`**: Single bracket keeps the container type; double bracket extracts the element.
5. **`sapply` = simplified output, `lapply` = list output, `tapply` = grouped output, `apply` = matrix rows/cols.**
6. **Factor gotcha:** `as.numeric(factor_var)` gives level codes, not values. Use `as.numeric(as.character(factor_var))`.
