# Day 01 (01/25/2023)
Get stuff on CUNY Academic Commons, LinkedIn,  (Github)
### What do data analyst do? 
They help enterprises succeed by deriving useful information from data.

# Day 02 (02/01/2023)
Make sure that you aren't loyal. You should be an integral part of the company, but never loyal (ready to lave at the drop of a hat).

## What do data analyst do? 
They help enterprises succeed by deriving useful information from data. They crate usable information that is derived that is derived from records to help businesses, governments, non-profits, projects by generating estimates of factual information To help advance a plan or goal

## Fact vs. value
I am 5'9" is a fact, value are more subjective (The Blue Jays are the best, I want to make lots of money because that's important). Numbers can't establish values, but can tell you what other people think about values. 
When a plan is on the plan, we use facts to determine which facts are true/false, which plan is the best. Kids love grape gum. Your job is to ask, "how do you know/where's the data?" 

## What is scientific reasoning?
A method of reasoning that abides by these principles:
1. Fact-Focused: Does not engage in moral contemplation or suasion, but rather the contemplation and clarification of facts.
2. Skepticism: Doubting factual statements until underwritten by proof.
3. Objectivity: prioritizing truth (even when it's 'bad')
4. Transparency: Make it easy to review your work, prove you wrong
5. Empiricism: Demand observable evidence. If you can't observe it, it's philosophy.

## Steps in a Data Analysis Job
1. What is the question: What is the Question? Who is my client, what information do they want, and can I answer it using my tools? Why do they want this information, how do they plan to use it, and do I want to be part of this project?
2. What Am I Supposed to Be Examining? What are my objects of analysis? Which qualities, behaviors, or outcomes am I assessing? Why?
3. Assess Sampling and Measurement. Does my data adequately capture a reasonably representative pictures of the general category of phenomena that I’m trying to assess? Are my measurements valid and reliable?
4. Acquire, Clean, and Prepare Data. Secure data, correct errors, refine measurements, assess missingness, and identify possible outliers.
5. Implement Analytical Operations.Implement analytical procedures designed to extract specific types of information from data.
6. Interpret Analytical Operations.  Convert statistical results into natural-language explanation, and assess implications to client’s thought processes.
7. Communication.  Finding ways to convey information in a way that resonates with client

## Communications: Parts of an Analytical Report
* Executive Report: A one-paragraph summary of the study, its findings, and implications. Will be only thing read by many readers.
* Practical Question, Research Question & Background: Helps readers understand and independently assess the purpose to which analysis is being put.
* Data & Methods: Information that allows the reader to assess and replicate the study.
* Findings: Summary of important findings that lead to your conclusions.
* Interpretation: Explanation of how these findings should affect reader’s view of question/problem and its solutions.

# Day 03 (02/08/2023)

## Describing Data Distributions
* Our cognitive ability and communicative capacity are too limited to meaningfully process many discrete pieces of information
* When discussing data, we talk about distributions,descriptions that characterize a large set of data values, like:
	* Discussing "typical" scores
	* Talking about whether scores tend to be highly variable or clustered near typical scores
	* Describing the range of possible data scores

### Ways to Use Descriptive Statistics
We describe data to build descriptions or tell stories about the world based on data, instead of pure imagination
To get a sense of
* What is "normal"
* What constitutes "high" or "typical"
* Where concrete examples lie in comparison to others
* To get a sense of what is "prevalent" and what is "rare"

### Numerical Descriptors
* Univariate discrete
* Univariate continuous
	* Central tendency (mean, median, mode) and dispersion (range, standard deviation, percentile scores)
* Two discrete
	* Cross tabs
* One discrete, one continuous
	* Table of summary statistics
	* `aggregate(<continuous>~ <discrete>, data = <data object>, <metric>)`
* Two continuous
	* Correlation

### Static Visualization
Checklist:
* Title
* Accompanying text that explains its content and key insights
* Labeled axes (if applicable)
* Legends
* Info on data source

# Day 04 (02/15/2023)

## Data Wrangling
***Wrangling*** involves transforming raw data into a clean and usable format for analysis.

###Getting your data prepared for analysis:
1. Understanding Your Data: Getting a clear idea of the data with which you are working
2. Importing: Reading the data into a software environment, like R
3. Tidying: Reorganizing data into a standard format for efficient use with off-the-shelf tools
4. .Verifying and Cleaning: Identifying and correcting for errors in data
5. Generating Derivative Variables: Creating new variables from the data to generate new insights or vantage points
6. Trimming/Subsetting: Isolating useful cases
7. Exporting: Saving wrangled data

#### Step 1: Understand Your Set
All jobs begin by reviewing data documentation
* Data documentation:Documents that should describe a data set and the process by which it was collected.  Avoid using undocumented data
Goals:
* Judging Data Quality
* Identifying Important Information for Wrangling and Analysis

##### Judging Data Quality
Assume undocumented data is garbage.
Are you being given information to:
* Replicate the primary data?
* Verify secondary data?

###### Examples
* Can you look up secondary data sources?
* Are you given detailed information on sampling?  Measurement?
* Are you clear on the circumstances under which data was collected?
* Can you read the actual questions or see the actual forms?
* Can you access the raw data?
* Are the formulation of the weights clearly explained?

##### Questions to Ask from Documentation
1. Units of Analysis:What do these variables describe?
2. Context of Collection:  Where and when was this data collected?
3. Sampling Method:  How were units selected for inclusion in the data set
4. Variable names: The names of the variables in the set
5. Variable meanings: The meaning attributed to the variables
6. Variable measurement: Exactly how were each variable’s numbers determined?


#### Import Your Data
Locally stored, API, Web Scraping.

##### Tidying Data
First normal form.

##### Labeling
Changing variable names.

##### Merging
Same as SQL

##### Data Verification and Cleaning
1. Checking data types: This involves checking that each variable in the dataset is of the correct data type, such as numeric, character, or factor.
2. Outlier detection: This involves identifying and potentially removing extreme values that may be inaccurate or represent errors in the data.
3. Missing data: This involves identifying and potentially imputing missing values in the dataset.
4. Data validation: This involves checking that the data meets certain criteria or constraints, such as ensuring that dates are in the correct format or that values are within a certain range. 
5. Identifying duplicate data: This involves identifying and potentially removing duplicate records in the dataset.

###### Recoding: Based on Logical Tests
* To recode missing values, such as weight below 80 to NA
* Remove invalid inputs (unexpected characters)
* Rescaling (e.g. inch to cm)
* Extricating Footnotes
```
sales <- read.csv("sales_data.csv")
sales$Profit <- as.numeric(gsub("F", "", as.character(sales$Proft)))
```

###### Creating Derivative Variables
* Is value above/below threshold, or is a function of other variable(s)
* Creating ordinal variables from one continuous one
	* `measures$weightstatus <- cut(measures$bmi, c(0,1,2,99),labes=c(<labels>))`

###### Subsetting
Reducing the data by dropping columns or rows.

# Day 05 (02/22/2023)

## Inferencial Statistics

### Making Statistical Inferences
**Inference** Developing a belief or idea based on evidence at hand
**Statistical Inference** Using data to make inferences about populations from samples.
**Data Analysis** More general task of making inferences from data

#### Tests to Make Rigorous Inferences
* Hypothesis: A guess about what is true
* Hypothesis Test: A test to see if our guess is true
* Involves
	* Null hypothesis: Our hypothesis is disproven
	* Alternative hypothesis: Our theory is not disproven
* Principle of *skepticism*: Assume we are wrong until it becomes hard to deny we are correct.

#### We Test Hypotheses Through Experiments
**Experiments**
* Compare *treatment* and *control* groups with respect to an outcome
* If differences are undeniable, then we might infer the postulated effect
But what counts as, "undeniable?"

##### Going Deeper than Simple Comparisons
We have to go deeper than simply looking at the means (like spread)

### Significance Tests
Estimates of our results likelihood, if we were to assume that there is no effect. If the null hypothesis is true, how likely are we to see our results?

#### But How do the Tests Work?
Four Keys
1. Normal Distribution
2. Standardization
	* A method for converting different scales to a standardized one, denominated in standard deviations away from the mean.
	* Allows us to test variables on different scales.
3. Standard Error
	* Standard error captures variability in our sample statistic estimates from population parameter value.
4. Central Limit Theorem

#### One-Sample T-Test
A t-test of sample means.  Results include the following:
* The probability of obtaining this results if the population mean were zero 
* 95% confidence interval 
	* in 95 of 100 samples, we expect to get these values for sample means
* Sample mean
* Test for a particular value/is true mean above/below some number?
	* Assume average American has a "feeling thermometer of 50 for the rich", what is the probability of attaining these results?

#### Two-Sample T-Test
Comparing two variables' means (before was just 1 variable's mean).


## Modeling

### Relationships
Relationships occur when two things coincide, or appear together
Relationships are the building blocks of many endeavors for which we use statistics:
* *Classification*: sorting people or things into categories
* *Prediction*: guessing what will happen in the future
* *Explanation*: developing explanations of why things happen as they do


### Statistical Models (Estimators)
Models use mathematical equations to develop formal expressions of relationships. Models:
* Press us to express our beliefs about relationships explicitly
* Allow us to test the quality of these beliefs against empirical data
* Offer a basis for explanation or prediction
* Allow us to use data to develop new or better models

### Basic Linear Model: Terminology
![alt text](/home/seth/Documents/Masters/data712/images/basic_linear_model_terminology.png)

#### Error
The **Model Error** is the difference between the predicted value and the actual value. Conventionally, models are fit by finding coefficients that *minimize error* when fit to a data set.

### All Models are Fallible
All models have error-they partly failed to explain whatever their trying to explain.
Why do models fail?
* Measurement Error
* Omitted Predictors
* Chance Events
* Free Will

### Developing Good Models
Anyone can make a model. Good analysts are able tocreate good models.
What makes a model "good"?
* Simplicity/comprehensibility
* Predictive/explanatory power - low error
* Unbiasedness
* Precision

### Ordinary Least Square (OLS)
Estimate α and β by drawing a line that minimizes sum of all ε’s (squared).
* **Squaring allows us to sum both positive and negative errors (ε)**.
* α is the intercept
* β is the slope

Can use OLS when:
* Dependent variable (Y) is continuous
* Certain other criteria are met

#### OLS: Key Assumptions
OLS Regression rests on a few key assumptions, which we will examine in the next module:
* Linearity
* Independent Observations
* Mean Zero Errors
* Homoskedeastic Errors
* No Multicollinearity
* No Overly-Influential Observations
* No Omitted Variable Bias

### Multiple Regression
* Multiple regression uses several independent variables to model dependent variable's predicted value.
* In these models, each predictor's effect is net of other variables in the model.
	* In this example, the effects of studying are held to be net of the student's intelligence level, and the effect of his or her intelligence is net of study effort.
* This feature makes regressions a useful method for parsing out a particular outcome‘s multiple causes
* You can use many predictors.  More predictors allow for a more nuanced explanation, but models can break down if there are too many predictors.

#### Regressions with Discrete Predictors
Dummy variables.


# Day 06 (03/01/2023)
No class (cancelled)

# Day 07 (03/08/2023)
* Only include graphs that are relevant.
* All tables and figures should be sandwiched between 2 paragraphs:
	* First paragraph is how to read the table
	* Second paragraph highlights the key points from the table or figure that are germane to the analyst's main point.

Intercept: predicted value of Y when all X values equal 0 (a theoretical value)
Size, shape, significance, sign -> what the hell does this mean in reality (yes, positive and significant, but is it meaningful).

R^2: this predictor(s) is explaining X about of the difference. Adjusted R^2 penalizes by adding variables.

# Day 08 (03/15/2023)

## Interpreting Regression Results
* Coefficient significance
* Coefficient sign
* Coefficient size
* Model fit

## Regression Diagnostics
**Diagnostics** try to detect problems that can distort regression results.
There are assumptions that need to be met.

### 5 Assumptions
1. Normally-distributed, mean zero errors
2. Homoskedasticity
	* A precision of error that is equal across all values
3. No Collinearity
4. No Outliers
5. Linearity

#### Normally Distributed, Mean Zero Errors
**Errors**: Observation's deviation from regression line.
Errors should have:
* Mean of zero
* Normal distribution

##### Testing Error Distribution
Steps:
1. Generate studentized residuals
	```{r}
	library(MASS)
	resid.1 = studres(MODEL.1)
	```
2. Check that the mean is close to zero
	```{r}
	summary(resid.1)
	```
3. Check the distribution of error approximates a normal distribution
	```{r}
	hist(resid.1)
	qqnorm(resid.1)
	qqline(resid.1)
	```
##### Redressing Violations

###### Transforming Variables
* Rescaling (e.g. log). Useful for variables with serious skews.

###### Model Re-specification
* Add/remove predictors

###### Robust Standard Errors
* Models that can account for uncertainty in error distribution


#### Homoskedasticity
Distribution of errors constant across regression line.  
* Errors' distribution does not change over predicted values
* OLS assumes homoscedastic errors.  Violation may lead to distorted significance estimates.

##### Graphical Test
```{r}
# Calculate predicted values
p.1 <- predict(MODEL.1)

#Standardized predicted values
std.p.1 <- (p.1 - mean(p.1))/sd(p.1)

#Calculate residuals
r.1 <- resid(MODEL.1)

#Standardize Residuals
std.r.1 <- (r.1 - mean(r.1))/sd(r.1)

# Plot the two as a scatterplot with an additional like along y (residuals) = 0
plot(std.p.1,std.r.1,xlab="Standardized Predicted Values",ylab="Standarized Residuals")abline(0,0)
```

##### Numerical Test
```{r}
library(lmtest)
bptest(MODEL.1)
```
Reject if hypothesis test *is* significant

##### Correcting for Heteroskedasticity
* Re-sepcify model
* Transform variables
* Robust standard errors
* Weighted least squares

#### Collinearity
* Effect of two or more predictors' having highly correlated partial relationship with outcome
* Threat when predictors are highly correlated
* OLS cannot discern independent effects well
* Can create deceptive results, including highly-significant results 

##### Diagnosing Collinearity
```{r}
pred.1 <- MODEL.1$model[-1,1]
library(usdm)
vif (pred.1)
```
VIF < 4 -- Usually okay
VIF > 10 - Likely bad

##### Addressing Collinearity
* Check effects of using one vs. other collinear predictor
* Consider consolidating collinear predictors into index
	* Collinear variables may be touching upon broader concept that you can operationalize using multiple indicators.

#### Outliers
* Extreme measures
* Can "pull" regression line by exerting inordinate effects on OLS estimates
* May not be useful because outliers could be atypical case, the exception to which your general model does not apply.
* OLS works by minimizing squared residuals
* An outlier creates a massive residual that has to be minimized
* Has the effect of "pulling" the regression line.
* Outliers tend to be observations with extreme values, but not all extreme values affect regression estimates.

##### Looking for Outliers
* Graphical: Leverage vs. Squared Residual Plot
	* `library(car)` `leveragePlots(MODEL.1)`
* Numeric: Cook’s Distance

After regression: `car::outlierTest()`
* Will create `<var>` with observation's Cook's Distance score.
* Cutoff: Cook's Distance > 4/N where N is the number of observations in the model.

#### Check for Linearity
* OLS assumes relationships are linear
* `crPlots(MODEL.1)`

##### Non-Linearity: Redresses
* Variable Transformation
* Re-specification
* Non-linear outcome models
* Quadratic predictors

### Refining Your Models

#### Transforming Variables: Predictor is Heavily Skewed
Take the log

#### Interpreting Logged Coefficients
Predictors and outcomes can be logged.
Your interpretation of the coefficients depends on what is logged in the model.

##### Predictor Logged, Outcome Not
Example: $$ nchildren = \alpha + \beta * log(income) + \epsilon $$
Interpretation:
* $\beta$ = effect on $nchildren$ if $log(income+1)$
* Problem: Hard to make concrete sense of adding +1 to a logged variable.
	* We want to make sense of adding +1 (or whatever) to income, not it's log.
* The problem is that the effect of a logged variable is non-linear.
	* +1 to a log does not imply a constant rise in $X$

Solution: Explain the predicted effects between two X values of your choosing.
Assume $/beta=0.5$, then the predicted difference between a family earning $50k and $100k is:
$$	\beta * [log(X_1)-log(X_2)] $$
$$ 0.5*[log(100,000)-log(50,000)] $$
$$ 0.5*[log(100,000/50,000)] $$
$$ 0.5*log(2)$$
$$=0.34 children $$

##### Outcome Logged, Predictor Not
Example: $$log(income) = \alpha + \beta * children + \epsilon$$
Interpretation:
* $\beta=$ effect on log income if children  + 1
* $(β* 100)$ can be interpreted as % change in income with children + 1
 
Example:
* $\beta= 0.07$ predicts a +7% change income with each additional child
* $\beta= 1.01$ predicts a +101% change in income with each additional child

##### Logged Outcome and Predictor
Example: $$log(income) = \alpha + \beta * log(yearsOfEducation)+\epsilon$$
Interpretation:
* $\beta = $ % change in Y with a +1% change in $X$
* $\beta = 0.005$ --> income will rise 0.5% as years of schooling rises by +1%


#### Estimating Non-Linear Effects
To test: add a quadratic term to the regression (or use a library that can handle these cases). 
Be careful: these types of regressions are vulnerable to collinearity. If collinearity is a problem, subtract the mean of X before squaring.


# Day 09 (03/22/2023)

## Interpret Logged Coefficients
When ...
A 1% increase in the predictior is expected to result in a /Beta /100 unit effect on the outcome.


# Day 10 (03/29/2023)

