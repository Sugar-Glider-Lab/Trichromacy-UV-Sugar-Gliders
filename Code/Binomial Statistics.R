
#Binomial test for individual performances
    binom.test([#"correct choices"], [#total runs], p=0.5, conf.level=0.95)
  #example- Glider 1's performance in red testing
    binom.test(29, 45, p=0.5, conf.level=0.95)
    
#Random effects with binomial link models for grouped performances (male, female, whole group)
  #prior to running the model, data for each test type was converted into binomial with two columns. Each row represented a run in the test. One column (outcome) had 1 representing choosing the "correct" color and 0 representing choosing the other "incorrect" side. The second column (glider) noted which individual completed the run.
  
  install.packages("lme4")
  install.packages("lmerTest")
  library(lme4)
  library(lmerTest)
  
  #glmer function fits the data to a binomial logistic regression model with random effects.The random effect here accounts for the variability of choices made by individual gliders.
  
  model <- glmer(outcome ~ 1 + (1 | glider), family = binomial, data = data)
  # outcome ~ 1 indicates that the model is showing the probability of choosing the "correct choice" while including an intercept which represents the overall population effect
  # (1 | glider) specifies a random intercept for each glider, capturing individual differences
  
  summary(model)
  #includes estimates of the fixed effects (population average) and the variance of the random effects (individual difference among gliders)
  #to test if the overall correct choice rate is significantly different from random (50%), the p-value shows the intercept. If it's significantly different from 0, it implies that the population effect is different from random choice.
