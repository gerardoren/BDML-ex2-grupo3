
# Fill here the code to estimate the linear_model2 from the notebook
features<- c("ofic_ingLab", "nmenores",  "H_Head",  "age",  "gender" )

db_int<- db_int %>% drop_na(any_of(features))



## Regression
linear_model<- lm(totalHoursWorked ~ ofic_ingLab + nmenores  + 
                    nmenores*gender + H_Head + age + gender, data=db_int  )
summary(linear_model)

## leverage 
db_int<- db_int %>% mutate(leverage = hatvalues(linear_model))


## residuals
db_int<- db_int %>% mutate(residuals= linear_model$residuals)

N <- nrow(db_int)

db_int$id<- seq(1 , N)

a<- ggplot(db_int , aes(y = leverage , x = id , color= ofic_ingLab, shape= as.factor(gender) )) +
  geom_point() + # add points
  theme_bw() + #black and white theme
  labs(x = "Observations",  
       y = "Leverage",
       title = "") # labels


b<- ggplot(db_int , aes(y = leverage , x = residuals  )) +
  geom_point() + # add points
  theme_bw() + #black and white theme
  labs(x = "Residuals",  
       y = "Leverage",
       title = "") # labels


# Arrange the ggplot2 plots side by side using grid.arrange()
grid.arrange(a, b, ncol = 2)

p <- mean(db_int$leverage)
p

cutt <- 3*p
cutt

db_int2 <-  db_int %>% 
  dplyr:: filter(leverage<= cutt)

linear_model2<- lm(totalHoursWorked ~ ofic_ingLab + nmenores  +  nmenores*gender + H_Head + age + gender, data=db_int2  )


stargazer(linear_model, linear_model2, type="text",
          covariate.labels=c("Mean Ocu Income","N under 18","Male",
                             "Hausehold Head","Age", "N under 18 x Male" ))
