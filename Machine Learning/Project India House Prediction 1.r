House_Price_India

india_df <- House_Price_India %>%
  select(Price, `Built Year`, `number of floors`,`number of bedrooms`, `grade of the house`)

head(india_df)

india_df %>%
  complete.cases() %>%
mean()

clean_df <- india_df %>%
  drop_na()

## log 
clean_df$Price <- log(clean_df$Price+1)

hist(clean_df$Price)
hist(clean_df$`number of bedrooms`)
hist(clean_df$`Built Year`)
hist(clean_df$`number of floors`)
hist(clean_df$`grade of the house`)

## split data
split_df <- function(df){
  set.seed(42)
n <- nrow(df)
train_id <- sample(1:n, size = 0.8*n)
train_df <- df[train_id, ]
test_df <- df[-train_id, ] 
return( list(training_df = train_df,
             testing_df = test_df))
}
  
  
prep_data <- split_df(clean_df)

train_data <- prep_data[[1]]
test_data <- prep_data$testing_df

lm_model <- train( Price ~ . ,
       data = train_data,
       method = "lm")
 
lm_model



p <- predict(lm_model, newdata = test_data)
p
 
mae <- mean(abs(p - test_data$Price))

mae

rmse <- sqrt(mean((p - test_data$Price)**2))

rmse
