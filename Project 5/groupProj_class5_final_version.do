use "classroom.dta"
*we have two models to consider, but we first focus on the simpler one:
gen math1st = mathkind + mathgain
mixed math1st housepov yearstea mathprep mathknow ses sex minority || schoolid: || classid:, reml 
est store M1

*manually construct the residual that removes only the 'fixed effects'
*hint: predict yhat, xb will generate the prediction for the outcome based on the fixed effects only
* then subtract it from the outcome; call this residual: resFE

*show that this residual is not independent within schools in some manner.  Hint: boxplot?

*construct the residual that utilizes the BLUPs for the random effects.  Do it in these stages:
* i) predict and save zeta0 
* ii) predit and save eta0
* iii) generate a new residual, called resFE_RE which subtracts yhat, zeta0 and eta0 from the outcome
*note: there is an easier way to get the residuals in this case, predict ..., residuals, but we need to do it manually.

* show that these new residuals, resFE_RE are MUCH LESS (if not completely un-) correlated within school 
* using the same method as before (boxplot?)

*examine the two sets of BLUPs (for random effects zeta0 and eta0) for normality
*first 'tag' a single value from each grouping (e.g., school or classroom) so that you only have 
* as many BLUPs as the grouping factor (should be less of an issue in R)

*if In a simpler setting, with no classroom level, if H0: \sigma^2_{\zeta_0}=0 were true, 
* and you sampled 100 schools of size 10, what would be a potential expected estimate of \sigma_{\zeta_0} 
* if you know that \sigma_{\epsilon}=1 ?  HINT: the Central Limit Theorem applies.  Simulate to find out.

*now reload the data and fit a slightly more complicated model:
use "classroom.dta"
gen math1st = mathkind + mathgain

mixed math1st housepov yearstea mathprep mathknow ses sex minority |||schoolid: minority, cov(un) || classid:, reml 
est store M2

*manually construct the residual that removes only the 'fixed effects', call this residual: resFE

*show that this residual is not independent within schools in some manner.  Hint: boxplot?

*construct the residual that utilizes the BLUPs for the random effects.  Do it in these stages:
* i) predict and save zeta0 AND zeta1 (you need to give them in reverse order in STATA - ask me why if you want)
* ii) predit and save eta0
* iii) generate a new residual, called resFE_RE which subtracts yhat, zeta0, MINORITY*zeta1 and eta0 
*      from the outcome

* show that these new residuals, resFE_RE are MUCH LESS (if not completely un-) correlated within school 
* using the same method as before (boxplot?)

*examine the three sets of BLUPs (for random effects zeta0 and eta0) for normality
*first 'tag' a single value from each grouping (e.g., school or classroom) so that you only have 
* as many BLUPs as the grouping factor (should be less of an issue in R)

*plot zeta0 vs. zeta1 to see whether the estimated correlation is consistent with the observed. 
* Use tag to subset as before

*track down those odd points in the scatterplot.  What schools are they?


