#load library (in case you have installed it) 
library(caret)
library(tidyverse)

## caret
# Classification And REgression Tree

# simple ML pipeline
 # 0 Prep data / clean data
 # 1 split data => train test split
 # 2 Train model
 # 3 score model AKA. Prediction
 # 4 evaluate

mtcars
# sunbset only copumns we want aka. prepare data
full_df <- mtcars %>%
  select(mpg, hp, wt, am)

full_df
# check NA
full_df %>%
  complete.cases() %>% # check if any missing value 
  mean()

# Drop rows with NA

clean_df <- full_df %>% 
  drop_na()
  
clean_df
###  1. Split data 80:20

split_data <- function(df){
set.seed(42)
n <- nrow(df)
train_id <- sample(1:n, size = 0.8*n)
train_df <- df[train_id, ]
test_df <- df[-train_id, ]
return( list(training = train_df, 
             testing  = test_df))
}

split_data(clean_df)

prep_data <- split_data(clean_df)

prep_data # both training and testing
train_df <- prep_data[[1]] # only training
test_df  <- prep_data$testing # only testing

train_df
test_df

### 2. train model [ use trai_dfn model NOT prep_data ]

lm_model <- train(mpg ~ . , 
                     data = train_df, 
                     method = "lm") 
#[mpg is the function of all (.vars)in train_df]
#ML algorithm ["lm"/ "ranger"/ "glm" etc...]

lm_model


### 3. score model AKA. Prediction

p <- predict(lm_model, newdata = test_df)

### 4. Evaluate
# MAE mean absolute erro
mae <- mean(abs(p - test_df$mpg))
mae

# RMSE root mae square error

rmse <- sqrt(mean((p- test_df$mpg )**2))
rmse

# finish
# some more info 
lm_model$results
lm_model$finalModel
varImp(lm_model) # [ to know which vars is importance]



