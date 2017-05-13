STAT_630 Final Notes
-----------------------

**LR Test:**  
$LR = \frac{p_1(x)}{p_0(x)}$  

**Most Powerful Test**  
- Given MP size $\alpha$  
- Rejection region is max(LR)  
- $LR \ge \frac{max(LR)}{\alpha}$  
- Power of the test = $p_1(max(LR))$  

**Method of Moments**  
- Given that, $X_1...X_n = \theta + \theta + 1$  
- Find $E(x)$, set $\bar{x} = E(x)$  
- Solve for $\theta$  

**MSE**  
- Var(x) * parameters, square the parameters  
- Take the derivative of the function at 0 and solve for the parameter to minimize MSE  

**MLE**  
- take the log likelihood of the function  
- take the first derivative of the log likelihood, non-parameters are constants  
- set derivative to zero and solve for parameter  
- take second derivative, if parameter is > 0, it maximizes MLE  

**Fisher's Information**  
- using 2nd derivative of the function  
- $-E(\frac{d^2 f_0(\theta)}{d \theta}$  
- Replace x with E(x)  

**Solving for $C_1, C_2, C_3, C_4, C_5$**  
For $C_1 (X + C_2)^2 + C_3(Y + C_4)^2 = C_5$  
and $X ~ N(2, 4), Y ~ N(-3, 5)$    
$C_2, C_3$ make value in parenthesis 0  
$C_1, C_4 = \frac{1}{C_1}, \frac{1}{C_4}$  
$C_5 = 2$  

**Determine size or level of Hypothesis Test**  
$H_0: \theta = 1, H_a: \theta = 2$  
Reject $H_0$ when V > .9, then  
$\alpha = P[V > .9, \theta = 1] = \int_{.9}^1 1, dv = v|_{.9}^1 = .1$  

**Determine Power Test**  
Same as above with $H_a$ instead  
$\beta = P[V > .9, \theta = 1] = \int_{.9}^1 2v, dv = v^2|_{.9}^1 = .19$  

**Moment Generating Functions**  
- 1st Derivative with s = 0, = $E(x)$  
- 2nd Derivative with s = 0, = $E(x^2)$  
- Var = $E(x^2) - E(x)^2$  

**Posterior Distribution**  
- Find Likelihood of $f(x|\theta)$ by removing x, so for...  
$f(x|\theta) = 3 \theta x^2 e^{-\theta x^{-3}}$  
$L(f_0(x)) = \theta^n e^{-\theta \sum_{i=1}^n x^{-3}}$  

