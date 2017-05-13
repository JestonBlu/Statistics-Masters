# Jan 2012

## I.
  1) **Explain how a reference plot is able to assess the fit of a model without specifying parameters? What are the other methods?**

  - You can use a general graphical procedure if the distribution you are fitting is from a location/scale family (Normal, Logistic, Exp, Weibull, Cauchy)

  - Q(U) represents the standard member of the family quantile function under a transformation so that it is a valid location scale function

  - Ui standardizes the Ys if the points line up with the quantile function of the standard normal then Ys parameters can be roughly estimate by using the Y intercept and slope of the regression lines through the points

  - The other methods are method of moments and maximum liklihood

  2) **Assess the fit of a model based on the AD Score**

  - From the table $G(z) = P[A_n^2 < z]$
  pvalue = $1 - G(z)$

  - Conclusion: With a high pvalue and straight looking reference plot, you can conclude that the weibull model fits the data well enough

  3) **Obtain the MLE for $\lambda, \beta$ from the weibull function**

  $$Weibuill = 1 - e^{-x^{\lambda}/\beta} \\
  SAS Weibull = 1 - e^{-(x/\alpha)^\lambda}$$

  |SAS Output     | x     |
  |---------------|-------|
  | Intercept     | 3.8667|
  | Scale         | .1065 |
  | Weibull Scale | 47.78 |
  | Weibull Shape | 9.38  |

  - Remember: Shape is the exponent, Scale is the divider
  - $1 - e^{-(x/47.78)^{9.38}}$
  - $\lambda = 9.38, \beta = 47.78^{9.38}$

  4) **Lower Bound 95% Confidence Limit**
  - $X +/- Z_{.05} * se$
  - $9.38 +/- 1.96 * 1.62$

  5) **Kaplan Meir Survival Estimate**
  - Estimates are likely to survive beyond a given percentile, starts at 100% and moves 0%

  **Parametric vs Non-parametric**
  - If data fits well to a parametric distribution then the estimates will have more power than it applying the same procedure using a distribution free method

## II.
  1) **Normality**: Check the Shapiro Wilks Test, pvalue > alpha suggests the distribution is normal... the higher the SW statistic the higher the pvalue.. AD, KS, CVM -> the lower the value of the statistic the higher the pvalue.  SW is considered superior to the other tests because of better detection in the tails of the distribution.

  **Equal Variance**: Check the Breslow Day test for equal variance, if the pvalue is less than alpha than reject and state that variance is not equal.
  **Independence**: Depends on the design of the experiment. Look at the randomization You have independence if the EU are randomly assigned to the treatments

  2) **Which main effects and interactions are significant?**
  - For a mixed model, use the mixed model output (GLM produces incorrect pvalues because all effects are assumed fixed and the error denominator is not correctly applied

  4) **Separate groups so that they are not significantly different. Use the experimentwise error rate of $\alpha = .05$**

  $EWER = 1 - (1 - \alpha_{pc})^c$ with C being the number of components. If the pvalues are less than the EWER than the 2 components are significantly different

  5) **Provide a 95% confidence interval**: $X \pm t_{(1-\alpha/2, df)} SE$

  6) **Identify Sum of Squares**

  $Y_{ijkl} =$ Level of Sausage, l = Sausage, i = Quality Grade, j = Manufacturer, k = run

  $\sum_{i=1}^3 \sum_{i=1}^3 \sum_{i=1}^3 \sum_{i=1}^2 (\bar{y}_{ijkl} - \bar{y}_{....})^2 = SS_{TOTAL}$

  $18 \sum_{i=1}^3 (\bar{y}_{i...} - \bar{y}_{....})^2 = SS_{QUALITY}$

  $6 \sum_{i=1}^3 \sum_{j=1}^3 (\bar{y}_{ij..} - \bar{y}_{i...} - \bar{y}_{.j..} - \bar{y}_{....}) = SS_{QUALITY*MANUFACTURER}$

  $6 \sum_{j=1}^3 \sum_{k=1}^3 (\bar{y}_{.jk.} - \bar{y}_{.j..})^2 = SS_{RUN(MANUFACTURER)}$


## III.

1) **Identify the distributions**
  a) $U = \chi_1^2 + \chi_3^2 + \chi_5^2 + \chi_6^2 + \chi_7^2$

  b) $W = X_7 / \sqrt{X_1^2 + X_2^2 + X_3^2 + X_4^2 + X_5^2 + X_6^2/6}$

  c) $Y = W^2 = 6 \chi_2^2 / [\chi_2^2 + \chi_3^2 + \chi_4^2 + \chi_5^2 + \chi_6^2 + \chi_7^2 + \chi_8^2]$

  d) $T = X_1/X_4$

  e) $S = 3(X_2^2 + X_4^2)/[2 (X_1^2 + X + 3^2 + X_5^2)]$

  a) $\chi_5^2$

  b) $t(6)$

  c) $F(1,6)$

  d) $Cauchy$

  e) $F(2,3)$

2) **$X = N(2, 8), Y = N(-3, 5)$**
  a)  $U = 2X + 3Y - 5, V = X - CY$ Identify the distribution of U and V

  b) What is the value of C that makes U and V independent?

  c) $W = C_1(X + C_2)^2 + C_3(Y + C_4)^2$. Find the values of C so that W have a $\chi^2$ distribution with $C_5$ degrees of freedom.

  d) $T = C_1(X + C_2)^{C_3} / (Y + C_4)^{C_5}$ Find the values of C so that T has a t distribution with $C_6$ degrees of freedom.

  e) $T = C_1(X + C_2)^{C_3} / (Y + C_4)^{C_5}$ Find the values of C so that T has an $F_{(C_6, C_7)}$ distribution

a)  Substitute the mean for X and Y and add up for means.  For variance subsitute X and Y for their variances, square the multipliers and drop the constants

b) ???

c) C2 = -2, C4 = 3, C1 = 1/8, C3 = 1/5

d) C2 = -2, C4 = 3, C1 = $\sqrt{5/8}$, C3 = C5 = C6 = 1

e) C2 = -2, C4 = 3, C1 = 5/8, C3 = C4 = 2, C6 = C7 = 1

## IV.

1) **What distribution is assumed for the error term of a regression model?**
$N(0,\sigma^2)$

2) **Is it correct to test Y for normality using a univariate test like Shapiro Wilk?**  No because Y is a linear combination of variables plus an error term

3) **How many parameters are thre**?  P+1 for the parameters and the intercept

4) $\hat{\beta} = (X'X)^{-1} X'Y$ derive the expectation and variance of B
$$
E(\hat{\beta}) = E((X'X)^{-1} X'Y) \\
               = (X'X)^{-1} X'E(Y) \\
               = (X'X)^{-1} X' E(XB + e) \\
               = (X'X)^{-1} X'XB + E(e) \\
               = (X'X)^{-1} X'XB \\
               = B \\
Var(\hat{\beta}) = Var((X'X)^{-1} X'Y) \\
                 = (X'X)^{-1} X'Var(Y) \\
                 = (X'X)^{-1} X'Var(XB + e) + X (X'X)^{-1} \\
                 = (X'X)^{-1} X'\sum X (X'X)^{-1} \\
                 = (X'X)^{-1} X' \sigma^2 I X (X'X)^{-1} \\
                 = (X'X)^{-1} \sigma^2 \\
$$

5) B is unbiased because the expectation of E is 0.

6) **A researcher has two models, one with Y and one with transformed Y, are there R2 comparable?**  No, because they are in different scales and so are not comparable.


# Aug 2012

## I
  $\hat{\beta}' = (37.5, -11.5, 1, -27.7), SE = (2.75, 3.89, 3.89, 3.89)$

  1) **Interpret the 4 regression parameters**
  - The intercept $B_0$ is the mean response for treatment A
  - $B_1$ is the mean response for the difference between treatment A and B
  - $B_2$ is the mean response for the difference between treatment A and C
  - $B_3$ is the mean response for the difference between treatment A and D

  2) **What assumptions are required for the regression model?**
  - *L*: Linear relationship between the predictor and response
  - *I*: Independence of errors
  - *N*: Normally distributed errors
  - *E*: Equal Variance

  3) **What is an approximate 95% confidence interval for the mean response in treatment B?**
  - $(37.5 - 11.5) \pm t(.975, 198) (3.89)$

  4) **95% confidence interval for the mean difference between treatment groups B and A?**
  - $(37.5 - 11.5) \pm t_{(.975,198)} (3.89 + 3.89)$

  5) **If another model were correctly fit from correlated data how would the 95% Confidence interval differ from the one above** If the data are correlated than the covariance is assumed larger therefore the standard error for the CI would be larger than the example above.

## II
  1) **Define Least Squares Criteria**: LS is the model that minimizes the variance between all actual values vs the predicted values of the model. $R(\beta_0, \beta_1) = \sum (y_i - [\beta_0 + \beta_1 x_i])^2$

  2) **Show the LS applied to the intercept only model**
  - $y_i = \beta_0 + e_i$
  $$
  \sum (y_i - [\beta_0 + e_i])^2 \\
  \frac{dR(\beta_0)}{d\beta_0} = -2 \sum (y_i - [\beta_0 + e_i]) \\
  0 = \sum y_i - n \beta_0 \\
  n \beta_0 = \sum y_i \\
  \beta_0 = y/n
  $$

  3) **What sum of squares in the regular regression model corresponds to the SSE of the intercept only model?** Sum of Squares Total

    Analysis of Variance Table
    Response: y
            Df Sum Sq Mean Sq F value Pr(>F)
    Residuals 99 90.727 0.91644

    Analysis of Variance Table

    Response: y
            Df Sum Sq Mean Sq F value Pr(>F)
    x1         1  2.437 2.43693  2.7049 0.1032
    Residuals 98 88.290 0.90092

4) **Explain why statisticians always "correct" the data when performing sums of squares**: The uncorrected SS includes variation in Y that is explained by its own underlying distribution. We want to be able to measure the amount of variation explained by independent variables so we want to determine how much variation is not explained by Y itself so we can determine how well the Xs explain the leftover variance.

## III

**Part 1**
1) **Based on the graph can you determine f the residuals are normally distributed?**
- You cant say with certainty from a single plot however the expectation of the graph for normally distributed residuals is a random pattern with a straight line through 0. There are 2 positive values at the tails of each graph which suggests that the errors are not normally distributed.

2) **Can you conclude that this is a valid model?**
- You cannot conclude this from a single graph however the model is suspect because it appears to not have normally distributed errors which is one of the assumptions of a valid linear model.

3) **Can you suggest a transformation for this model?**
- You cannot figure this out from a single graph, but based on the residual plot the error distribution looks like its skewed to the right so a log transformation or sqrt may improve the model

**Part 2**
| Gender | M    | F     |
|:-------|:-----|:------|
| P Y =1 | .001 | .0001 |

1) **What are the odds that a male will test positive?**
- $.001 / (1 - .001) = .001001$

2) **What are the odds that a female will test positive?**
- $.0001 / (1 - .0001) = .00010001$

3) **What is the odds ratio?**
- $.001001 / .00010001 = 10.01$

4) **Comment on that males are 10 times more likely to test positive**
- This statement ignores the fact the probability is already very low for both males and females.

**Part 3**
1) **Why should you not remove more than 1 variable at a time from a regression model?** You should not remove more than 1 variable from the model at a time because coefficients can change after a variable is removed. A variable that was showing as not being significant might actually be significant, but is not showing so due to undetected correlation between the predictor variables.


## IV

  1) **Do necessary conditions for hypothesis testing appear satisfied?**
  - **Normality**: Shapiro Wilk test and the univariate QQ plot support that the distribution of Ys are normal
  - **Equal Variance**: Brown Levene test do not support that there is equal variance among the groups so hypothesis testing is not appropriate
  - **Independence**: The EU are randomly assigned to the treatments so independence is satisfied.

  2) **Write a model $Y_{ijkl}$ for the level ecoli in the Lth meat sample from herd K of concentration I treated by method J**
  - $Y_{ijkl} = \mu + \alpha_j + \beta_i + (\alpha \beta)_{ji} + c_{k(i)} + d_{jk(i)} + e_{ijkl}$

  3) **What interactions and main effects are significant?**
  - Mixed models use the mixed model output, not the GLM output

  4) ???

  5) **Put the 3 methods into groups that are not significantly different from one another** Because the interaction is significant you have to create groups for level of concentration use the experimentwise error rate of .05. $1 - (1 - .05)^c$  need to figure out how to figure out the number of comparisons. pvalues < FWER are significantly different

  6) ???

  7) ???

# January 2013

## I

- x {1, 0}, 1 if gene is knocked out, otherwise 0
- g {1, 0}, 1 if gender is female, otherwise 0
- f continuous, standardized variable of food consumption

$$y_i = \beta_0 + \beta_1 x_i + \beta_2 g_i + \beta3 f_i + \beta_4 (x_i g_i) + e_i$$

1) **Interpret the coefficients in the model**
- $B_0$ The average response for a male field mouse
- $B_1$ The difference in average response between a male knockout gene mouse and a field mouse
- $B_2$ The difference in average response between a male and female field mouse
- $B_3$ The average increase in response from one additional unit of food consumption
- $B_4$ The difference in average response between a knockout gene female and a field mouse male

2) **Construct 95% confidence interval for $B_1 - B_4$**
```r
  > x
    [,1]  [,2]  [,3]  [,4]  [,5]
  [1,]  0.07 -0.07 -0.07 -0.01  0.07
  [2,] -0.07  0.14  0.07  0.01 -0.13
  [3,] -0.07  0.07  0.13  0.00 -0.13
  [4,] -0.01  0.01  0.00  0.05  0.00
  [5,]  0.07 -0.13 -0.13  0.00  0.27

  B = matrix(c(0,1,0,0,-1))

  > t(B) %*% x %*% B
       [,1]
  [1,] 0.67

  > sigma = 1.716
  > sigma * sqrt(.67)
  [1] 1.404607

  > (.8728 - .0586) + c(-1, 1) * qt(.975, 198) * 1.4046
  [1] -1.955696  3.584096

```
Conclude that since the interval includes 0, there is not sufficient evidence that B1 and B4 are significantly different

3) **How do you interpret pvalues after model reduction has take place**
- The pvalues cannot be used for hypothesis testing after model reduction because we have now fit a model to the data. If conducting hypothesis testing on the knockout gene results is desirable. A new test should be undertaken using the current model applied to the new data.

## II

Analysis of Variance
| n  | Mean | Std Dev | Min | Max |
|:---|:-----|:--------|:----|:----|
| 48 | 2.04 | 2.9532  | 0   | 13  |

1) **Explain why $\bar{X} \pm Z_{\alpha/2} \sqrt{\bar{X}/n}$** is a reasonable 1 - a confidence set for $\lambda$ the mean of the Poisson distribution. Assuming the data is a poisson distribution calculate the 95% confidence interval.
- In the poisson distribution mean and variance are equal so if the distribution is a poisson then the CI should fit reasonably well because n is large.

```r
> 2.04 + c(-1, 1) * qnorm(.975) * sqrt(2.04/48)
[1] 1.635943 2.444057
> qnorm(.975)
[1] 1.959964
```

2) **Is the assumption that the data follows a poisson distribution reasonable?**
- No because the variance is 2.95^2 which is much higher than the mean so a poisson fit is not appropriate.

3) **A chisquared test was run on x = 0,1,2,3,4+, the test statistic is 32.35. Based on this is the poisson distribution a good fit?**
  - Ho: poisson is a good fit, Ha: poisson is not a good fit
  - 32 is greater than the critical value of 13 so the pvalue is < .01
  - We conclude that the poisson distribution is not a good fit for this data

```r
> qchisq(.99, 4)
[1] 13.2767
```
4) **An SLR is fit to the data, based on the residual plots what is your conclusion on the appropriateness of the model?**
- There appears to not be a straight forward linear relationship between the number of tornadoes and killer tornadoes. There also appears to not be equal variance based on that residuals are increasing as the number of tornadoes increases. These are two basic assumptions that are needed for linear models so the model is not valid.


## III

Dummy Variable Model: $E(Y) = \alpha + \beta_1 x_1 + \beta_2 x_2 + \beta_3 x_1 x_2$

- x1 = {1 if High, 0 if Low}, x2 = (1 if High, 0 if Low)

Design Effects Model: $E(Y) = \alpha^* + \beta_1^* x_1^* + \beta_2^* x_2^* + \beta_3^* x_1^* x_2^*$
- x1 = {1 if High, -1  if Low}, x2 = (1 if High, -1 if Low)



1) **Express the null hypothesis of the following:**
- No interaction between A and B
- No effect due to A
- No effect due to B

- $Ho: \beta_3 = 0$
- $Ho: \beta_1 = \beta_3 = 0$
- $Ho: \beta_2 = \beta_3 = 0$

2) **What is the relationship between the coefficients in each model?**
  - $\alpha = \mu_{LL}$
  - $\beta_1 = \mu_{HL} - \mu_{LL}$
  - $\beta_2 = \mu_{LH} - \mu_{LL}$
  - $\beta_3 = \mu_{HH} + \mu_{LL} - \mu_{HL} - \mu_{LH}$

  - $\alpha^* = \mu$
  - $\beta_1^* = \mu_{H.} - \mu$
  - $\beta_2^* = \mu_{.H?} - \mu$$
  - $\beta_3^* = 1/2 (\mu_{HH} + \mu_{LL}) - \mu$

3) **With Dummy Variable Model, obtain the expression for the difference in: **
  - $A_{high}B_{high}$ and $A_{low}B_{low}$
  - $A_{high}B_{high}$ and $A_{high}B_{low}$
  - $A_{low}B_{high}$ and $A_{low}B_{low}$

  - $\beta_1 + \beta_2 + \beta_3$
  - $\beta_2 + \beta_3$
  - $\beta_2$

4) **With Effects model, obtain the expression for the difference in:**

  - $A_{high}B_{high}$ and $A_{low}B_{low}$
  - $A_{high}B_{high}$ and $A_{high}B_{low}$
  - $A_{low}B_{high}$ and $A_{low}B_{low}$

  - ??
  - ??
  - ??

5) ???

6) ???

## IV

1) **Do the necessary conditions for hypothesis testing and CI appear satisfied?**
- **Normality:**: The distribution plot and the shapiro wilk test both suppor that the data are normal

- **Equal Variance:**: The BFL test has a pvalue of .48 so we fail to reject that the variances across the groups is not equal.

- **Independence:**:  The randomization of the selected machines guarantees independence.

2) **Write a model for $y_{ijkl}$ the uniformity of windings on the Lth  coil wound by the Kth machine of type I using wire thickness J**

$$y_{ijkl} = \mu + \alpha_i + \beta_j + (\alpha\beta)_{ij} + c_{k(i)} + (\beta d)_{jk(i)} + e_{ijkl}$$

$$\alpha_3 = \beta_3 = (\alpha\beta)_{3j} = (\alpha\beta)_{i3} = 0$$

$$e_{ijkl} = N(0, \sigma_e^2), (\beta d)_{jk(i)} = N(0, \sigma^2_{Th*M(Ty)}), c_{k(i)} = N(0, \sigma^2_{M(Ty)})$$

3) **At the .05 level which main effects and interactions are significant?**
- We must use the mixed model output to obtain the correct pvalues and df

    | Source | DF1 | DF2 | FValue | Pvalue | Sig |
    |--------|-----|-----|--------|--------|-----|
    | Type   |  2  |  6  | 1.36   |  .325  |     |
    | Thick  |  2  |  12 | 82.58  |  .001  | *** |
    | Ty*Th  |  4  |  12 | 80.14  |  .001  | *** |


4) **Determine the variance between Thickness 1 and 3 for Type 3 machine**

$$y_{ijkl} = \mu + \alpha_i + \beta_j + (\alpha\beta)_{ij} + c_{k(i)} + (\beta d)_{jk(i)} + e_{ijkl}$$

Drop the fixed effects

$$c_{k(i)} + (\beta d)_{jk(i)} + e_{ijkl}$$

$$Var(\mu_{31} - \mu_{33}) = \\
= var[c_{.(3)} + (\beta d)_{1.(3)} + e_{31..}] - var[c_{.(3)} + (\beta d)_{3.(3)} + e_{33..}]$$

Drop the constants

$$var[(\beta d)_{1.(3)} + e_{31..}] - var[(\beta d)_{3.(3)} + e_{33..}]$$

$$\frac{2\sigma^2_{Th * M(Ty)}}{3} + \frac{2\sigma^2_e}{6}$$

$$\frac{1}{3} (2\sigma^2_{Th * M(Ty)} + \sigma^2_e)$$

Pull the MSE from the Sums of Squares Table
$$\sqrt{\frac{1}{3} (.0944)} = .177$$

5) **Place the 3 types of machines into groups so that they are not significantly different from one another. Use an EWER of .05**

- Need to check on this one. Figure out if there is a problem with using Tukey adjusted least squares means from the SAS GLM procedure.

- Thick 1:
- Thick 2:
- Thick 3:

6) **Provide a 95% confidence interval for thickness 2 on type 3**

```
> 12.696 + c(-1, 1) * qt(.975, 12) * (.2981)
[1] 12.0465 13.3455
```


7) ???


# August 2013


# January 2014
