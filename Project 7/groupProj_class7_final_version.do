use "classroom.dta"
*intro to nested longitudinal data
*make a person-period file
gen math0 = mathkind
gen math1 = mathkind+mathgain
reshape long math, i(childid) j(year)
save "class_pp", replace

*fit a baseline model (called unconditional growth) for this nested longitudinal data, ignoring classrooms:
mixed math year || schoolid: year, cov(un) || childid:
*write down this model

*add student, classroom and school-level fixed effects ; fit the model
*write down the model

*for year==0:
*what percent of between school differences were explained as you go from the baseline to the second model?
*what percent of between child differences were explained as you go from the baseline to the second model?

*for year==1:
*what percent of between school differences were explained as you go from the baseline to the second model?
*what percent of between child differences were explained as you go from the baseline to the second model?

*based on significance, 
*  what factors seem useful in describing ("explaining") differences between student outcomes? 
*    Point out the direction of the effect.

*add a random slope for ses, indep. of the year or intercept but that varies at the school-level 
*   (hint: in STATA, you are adding || schoolid: ses BEFORE THE OTHER || schoolid: year, cov(un) entry.

*is the estimated s.d. (square root of variance) of the random slope associated with SES large enough 
*  so that a value +/- 1 s.d. is sufficient to "cancel" (or flip the sign) the fixed effect for this predictor?


*compute residuals in this final model.  generate a qq plot and density (STATA: qnorm; kdensity ..., normal) 
*Is there any reason to question the normality assumption?

*compute BLUPs for all 4 random effects.  generate an all pairs scatter plot matrix (4x4) of these 
*  (STATA: graph matrix ...; R: pairs(...))
* note whether or not you identify any concerns from these scatterplots.
