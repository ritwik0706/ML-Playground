
# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# # Splitting the dataset into the Training set and Test set
# # install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting the Linear Regression Model
lin_reg = lm(formula = Salary ~ . , 
             data = dataset)

# Fiitng the Polynomial Regression Mopdel
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
poly_reg = lm( formula = Salary ~ . ,
               data = dataset)

# Visualising The Linear Regression Model 
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') + 
  ggtitle('Linear Model') + 
  xlab('Level') + 
  ylab('Salary')

# Visualising The Polynomial Regression Model 
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = X_grid  , y = predict(poly_reg , newdata = data.frame(Level = X_grid ,
                                                                          Level2 = X_grid^2,
                                                                          Level3 = X_grid^3))),
            color = 'blue') +
  ggtitle('Polynomial Model') + 
  xlab('Level') + 
  ylab('Salary')

# Predicting Linear Regression Results
y_pred = predict(lin_reg, data.frame(Level = 6.5))

# Predicting Polynomial Regression Results
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                     Level2 = 6.5^2,
                                     Level3 = 6.5^3))

