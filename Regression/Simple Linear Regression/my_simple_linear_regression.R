
# Simple Linear Regression

# Importing Dataset
dataset = read.csv('Salary_Data.csv')

# Splitting The DataSet into Training Set and Test Set
library(caTools)
set.seed(123)
split = sample.split(dataset$YearsExperience, SplitRatio = 2/3)
train_set = subset(dataset , split == TRUE)
test_set  = subset(dataset , split == FALSE)

# Feature Scaling
# train_set[, 2:3] = scale(train_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

# Fitting the Simple Linear Regression to the training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = train_set)

# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training Set Results
library(ggplot2)
ggplot() +
  geom_point(aes( x = train_set$YearsExperience, y = train_set$Salary),
             color = 'red') + 
  geom_line(aes( x = train_set$YearsExperience, y = predict(regressor, new_data = train_set)),
            color = 'blue') + 
  ggtitle('Salary vs Experience (Training Set)') + 
  xlab('Years Of Experience') + 
  ylab('Salary')

# Visualising the Test Set Results
library(ggplot2)
ggplot() +
  geom_point(aes( x = test_set$YearsExperience, y = test_set$Salary),
             color = 'red') + 
  geom_line(aes( x = train_set$YearsExperience, y = predict(regressor, new_data = train_set)),
            color = 'blue') + 
  ggtitle('Salary vs Experience (Test Set)') + 
  xlab('Years Of Experience') + 
  ylab('Salary')