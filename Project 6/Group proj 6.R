require(foreign)
require(lme4)
require(lattice)
library(lmerTest)
library(aod)#for wald test
library(reshape) # for wide to long reshape

#use "classroom.dta"

dat<-read.csv("/Users/sarahrosenbach/Dropbox/Documents/Coursework/Spring 2017/MLM/Datasets/classroom.csv")
attach(dat)

#make a person-period file
#gen math0 = mathkind
#gen math1 = mathkind+mathgain

dat$math0 <- mathkind
dat$math1 <- mathkind + mathgain

#reshape long math, i(childid) j(year) to save as "class_pp", replace

class_pp <- reshape(dat, varying = c("math0", "math1"), v.names = "math", timevar = "year",
                    times = c(0, 1), direction = "long")

attach(class_pp)

##we ignore classrooms in this analysis, but keep it in the notation
##fit a model with math as outcome, and fixed effect for time trend (year), and random intercepts for schools
fit6.1 <- lmer(math ~ year + (1|schoolid), data = class_pp)
summary(fit6.1)

##write down model

##add random intercepts for child

fit6.2 <- lmer(math ~ year + (1 | schoolid) + (1 | childid), data = class_pp)
print(summary(fit6.2))

##write down model

##report original and new variance estimates for zeta0 (between schools) and epsilon (within schools)
#fit6.1
#zeta0 = 348.7
#epsilon = 1268.4

#fit6.2
#zeta0 = 307.5
#epsilon = 599.1

##compute a pseudo R^2 relating the between school variation and ignoring between students in the same school.  
##In other words, what fraction of the total variance in the first model is 'explained' by the addition of a student random effect?
#(348.7 - 307.5) / 348.7 = 0.11815314

##does the total variation stay about the same (adding between children within schools variance as well, to the second model results)?

#Model 1
#348.7 + 1268.4 = 1617.1

##Model 2  
#702.0 + 307.5 + 599.1 = 1608.6

#yes, the total variation stay about the same

##add a random slope (zeta1) for time trend (year) within schools (uncorrelated with level (zeta0))

fit6.3 <- lmer(math ~ year + (year || schoolid) + (1 | childid), data = class_pp)
print(summary(fit6.3))

##generate the BLUPs for the random effects and and examine whether the independence between zeta0 and zeta1 is REFLECTED in a scatterplot of these two sets of effects.
ranefs <- ranef(fit6.3)
zetaM3 <- ranefs$schoolid[, 1]
deltaM3 <- ranefs$childid[, 1]

##match rows
idx.sch <- match(class_pp$schoolid, sort(unique(class_pp$schoolid))) #locations of the unique indices
idx.child <- match(class_pp$childid, sort(unique(class_pp$childid))) #locations of the unique indices

class_pp$zetaM3 <- zetaM3[idx.sch]
class_pp$deltaM3 <- deltaM3[idx.child]

plot(class_pp$zetaM3,class_pp$deltaM3)
#They are very slightly correlated

##compute V_S(year=0) and V_S(year=1).  Since there are only two years, this is a form of heteroscedasticity in the random effects.
##V_S (zeta_0 + zeta_1*TIME)
##V_S(year=0) = 324.79
##V_S(year=1) = 324.79 + 88.67 = 413.46

#in which year is there more between school variation, net of all else (year==0 or year==1)?
##Year == 1

#if you ran the model separately BY YEAR, and removed the year trend from the model, would you get the same #estimates for the variance between schools?  TRY IT

fit6.4 <- lmer(math ~ (1 | schoolid), data=class_pp0)
print(summary(fit6.4))

fit6.5 <- lmer(math ~ (1 | schoolid), data=class_pp1)
print(summary(fit6.5))

##V_S(year=0) = 324.79 and V_S(year=1) = 413.46
##They are not the same

##Rerun the last nested longitudinal model, allowing correlation between intercept and slope.  Is the correl. signif.?

fit6.6 <- lmer(math ~ year + (year | schoolid) + (1 | childid), data = class_pp)
print(summary(fit6.6))
anova(fit6.3,fit6.6)

#lrt test says it's significant.

#compute V_S(year=0) and V_S(year=1) for this new model.  Is this more consistent with the separate grade analysis?
#You are implicitly testing model fit here.
###V_S(year=0) = 370.6 (vs. 364.3)
##V_S(year=1) = 324.79 + 109.17 + (2 * 19.25 * 10.44 * -0.45) = 253.087 (vs. 306.8)

##more consistent