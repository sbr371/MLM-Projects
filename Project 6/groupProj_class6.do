use "classroom.dta"
*intro to nested longitudinal data
*make a person-period file
gen math0 = mathkind
gen math1 = mathkind+mathgain
reshape long math, i(childid) j(year)
save "class_pp", replace

*we ignore classrooms in this analysis, but keep it in the notation
*fit a model with math as outcome, and fixed effect for time trend (year), and random intercepts for schools
*write down model
*add random intercepts for child
*write down model
*report original and new variance estimates for zeta0 (between schools) and epsilon (within schools)
*compute a pseudo R^2 relating the between school variation and ignoring between students in the same school.  
* In other words, what fraction of the total variance in the first model is 'explained' by the addition of a student random effect?
*does the total variation stay about the same (adding between children within schools variance as well, to the second model results)?
*add a random slope (zeta1) for time trend (year) within schools (uncorrelated with level (zeta0))
*generate the BLUPs for the random effects and examine whether the independence between zeta0 and zeta1 is justified.
*compute V_S(year=0) and V_S(year=1).  Since there are only two years, this is a form of heteroscedasticity in the random effects.
*in which year is there more between school variation, net of all else?
* if you ran the model separately BY YEAR, and removed the year trend from the model, would you get the same estimates 
* for the variance between schools?  TRY IT
*Rerun the last nested longitudinal model, allowing correlation between intercept and slope.  Is the correl. signif.?
*compute V_S(year=0) and V_S(year=1) for this new model.  Is this more consistent with the separate grade analysis?
