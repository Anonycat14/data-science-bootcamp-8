# load library

library(tidyverse)
library(ggplot2)
head(mtcars)
View(mtcars)

# my first chart
# one variable, continuous
ggplot(data = mtcars,
       mapping = aes(x = mpg)) +
  geom_histogram()

ggplot(data = mtcars,
       mapping = aes(x = mpg)) +
  geom_density()

ggplot(data = mtcars,
       mapping = aes(x = mpg)) +
  geom_boxplot()

## base layer
base <- ggplot(data = mtcars,
       mapping = aes(x = mpg))

base + geom_histogram(bins=8, fill="#03ab89")

base + geom_freqpoly(bins=8)

## one variable - discrete

student <- data.frame(id=1:5, 
                      gender=c("M","M","M","F","F"))

ggplot(data = student,
       mapping = aes(x = gender)) +
  geom_bar()

## two variables, both continuous

base2 <- ggplot(mtcars, aes(x=hp, y=mpg))

base2 +
  geom_point(size=5, col="red", alpha=0.4) 

base2 +
  # linear model lm
  geom_smooth(method = "lm",
              col = "black",
              fill = "gold") +
  geom_point() +
  theme_minimal()

## two variables, one discrete, 
## one continuous

ggplot(diamonds,
       aes(price)) +
  geom_boxplot() +
  coord_flip()

ggplot(diamonds,
       aes(x=cut, y=price)) +
  geom_boxplot()

ggplot(diamonds,
       aes(x=cut, y=price)) +
  geom_violin()

## summarize data => build geom_col

p1 <- diamonds %>%
  group_by(cut) %>%
  summarise(
    med_price = median(price)
  ) %>%
  ggplot(aes(cut, med_price)) +
  geom_col() +
  theme_minimal()

p1

## qplot => quick plot
## ggplot2

p1 <- qplot(x=price, 
      data=diamonds, 
      geom="histogram",
      bins=10)

# independent variable => x
# dependent variable => y
p2 <- qplot(x=carat,
      y=price,
      data=diamonds,
      geom="point")

p3 <- qplot(x=cut,
      data=diamonds,
      geom="bar")

## ggplot()
## overplotting
set.seed(95)

mini_diamonds <- sample_frac(diamonds, 
                             0.03)

ggplot(mini_diamonds, 
       aes(carat, price, col=cut)) + 
  geom_point(alpha=0.8) +
  theme_minimal() +
  scale_color_brewer(type="qual",
                     palette = 1)

ggplot(mini_diamonds, 
       aes(carat, price, col=price)) + 
  geom_point(alpha=0.8) +
  theme_minimal() +
  scale_color_gradient(low="gold",
                       high="blue")

## facet
## segment our charts into groups
ggplot(mini_diamonds, 
       aes(carat, price, col=price)) + 
  geom_point(alpha=0.8) +
  theme_minimal() +
  scale_color_gradient(low="gold",
                       high="blue") +
  facet_wrap(~cut, ncol = 2)

ggplot(mini_diamonds, 
       aes(carat, price, col=price)) + 
  geom_point(alpha=0.8) +
  geom_smooth() +
  theme_minimal() +
  scale_color_gradient(low="gold",
                       high="blue") +
  facet_grid(cut ~ clarity)

## labels 
ggplot(mtcars, aes(hp, mpg)) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "My first scatter plot",
    subtitle = "Awesome work!",
    x = "Horse Power",
    y = "Miles per Gallon",
    caption = "Source: R Studio"
  )

## simple bar chart
library(ggthemes)
ggplot(diamonds, aes(cut,fill=color)) +
  geom_bar(position="stack") +
  theme_wsj()

## install more themes for ggplot charts
