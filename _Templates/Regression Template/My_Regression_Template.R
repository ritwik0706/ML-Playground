
# Regression Template


# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
library(caTools)
set.seed(123)
split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fiitng the Polynomial Regression Mopdel
# Create the Regressor

# Predicting Polynomial Regression Results
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualising The Polynomial Regression Model 
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = X_grid  , y = predict(poly_reg , newdata = data.frame(Level = X_grid))),
            color = 'blue') + 
  ggtitle('Polynomial Model') + 
  xlab('Level') + 
  ylab('Salary')

