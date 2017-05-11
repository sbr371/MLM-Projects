use "classroom.dta"
gen math1st = mathkind + mathgain
*FIT ALL MODELS WITH REML (not default in STATA)
*Compute the UMM with random intercepts for schools and classrooms
*report ICC
*WRITE OUT THIS MODEL in the notation given to you in class
*ADD School level preds & report if justifed
*report change in sigma^2_zeta
*ADD Class level preds & report if justifed
*report change in sigma^2_eta
*report change in sigma^2_epsilon
*Can you give an hypothesis as to why sigma^2_epsilon is reduced, but not sigma^2_eta?

*ADD student level predictors (but not mathgain or mathkind, as these are outcomes in this context) 
*  & report if justifed statistically
*report change in variance components for all levels; why did the school level variance component drop?

*WRITE OUT THIS MODEL in the usual, composite notation 

*try to add a random slope for each teacher level predictor at the school level (one by one - not all together)
*why is it a bad idea to include a random slope on the housepov effect?

*retry the above, allowing the slopes to be correlated with the random intercepts.
*report anything unusual about the variance components (changes that are in a direction you didn't expect) 
* & any potential explanation for why those changes occured (hint: what did you add to the model?) 

*try to add a random slope for each student level predictor at the classroom level (one by one - not all together)
*why is it a bad idea to include a class-level variable with random slopes at the classroom level?
*retry the above, allowing the slopes to be correlated with the random intercepts.

*try to add a random slope for each student level predictor at the school level (one by one - not all together)
*retry the above, allowing the slopes to be correlated with the random intercepts.
*report anything unusual about the variance components (changes gthat are unexpected)

*take the two predictors that had "signif." random slopes, in the forms in which they worked (indep. or correlated) 
*and add both to the model, and test for need of one conditional on needing the other
*is the more complex model (with both random slopes in it) justified?

*WRITE OUT THIS MODEL in the notation given to you in class

*next:

*for UCM, write down: V_C, V_S, V_E for the three variance components (simply the estimates).  
*Think of them as possibly varying with a covariate, though.
*for the most complicated (all fixed effects) random INTERCEPTS ONLY model, what are: V_C, V_S, V_E ?  
*by what fraction did these each decrease with the new predictors in the model?

*now consider the model with a random slope in ses.  
*what are: V_C, V_S(ses=0), V_E ?   We need to list 'ses=0' here, or we don't know how to use the slope variance
*what are: V_S(ses=-0.50), V_S(ses=+0.5) ?   

*now consider the model with a random slope in minority.  
*what are: V_C, V_S(minority=0), V_E ?   We need to list 'minority=0' here, or we don't know how to use the slope variance
*what are: V_S(minority=0.25), V_S(minority=+0.50), V_S(minority=+0.75) ?   

*now consider the model with a random slope in ses & minority.
*what are: V_C, V_S(minority=0,ses=0), V_E ?   We need to list 'ses=0, minority=0' here, or we don't know how to use the slope variance
*what are: V_S(ses=0,minority=0.50), V_S(ses=0.50,minority=0), V_S(ses= 0.50, minority= 0.50) ? 

*In the last model, what is a "likely" (+/- 1 sd) range for \eta_{0jk}
*Can we make a similar statement about \zeta_{0k}?  
*If you had a large value for \eta_{0jk}, would you expect a large or small or "any" value for:
*   the two random slope terms, \zeta_{1k} and \zeta_{2k} for ses and minority?
*If you had a large value for \zeta_{0k}, would you expect a large or small or "any" value for:
*   the two random slope terms, \zeta_{1k} and \zeta_{2k} for ses and minority (discuss each separately)?

