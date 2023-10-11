### insert the file [House_Price_India] before run


library(tidyverse)
library(caret)

new <- House_Price_India %>% 
  select(Price, `living area`, `Number of schools nearby`)

new_clean <- new %>%
  drop_na()


prep_new <- function(df){
set.seed
n <- nrow(df)
id <- sample(1:n, size = 0.8*n)
train <- df[id, ]
test <- df[-id, ]
return(list( new_train = train,
             new_test = test))
}

prep_new2 <- prep_new(new_clean)

new_train1 <- prep_new2$new_train
new_test1 <- prep_new2$new_test


lm_model3 <- train( Price ~ . ,
       data = new_train1,
       method= "lm")
lm_model3

new_score <- predict(lm_model3, newdata = new_test1)
new_score

mae3 <- mean(abs(new_score - new_test1$Price))
mae3

rmse3 <- sqrt(mean((new_score - new_test1$Price)**2))
rmse3


# more details
lm_model3$results
lm_model3$finalModel
varImp(lm_model3)
