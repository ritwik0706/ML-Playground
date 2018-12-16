
# Importing Dataset
dataset = read.csv('50_Startups.csv')

# Encoding Categorical Data
dataset$State = factor(dataset$State, 
                        c('New York', 'California', 'Florida'),
                        c(1,2,3))

# Splitting The DataSet into Training Set and Test Set
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
train_set = subset(dataset , split == TRUE)
test_set  = subset(dataset , split == FALSE)

# Fitting the Simple Linear Regression to the training set
regressor = lm(formula = Profit ~ . ,
               data = train_set)

# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

# Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State ,
               data = dataset)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend ,
               data = dataset)

regressor = lm(formula = Profit ~ R.D.Spend ,
               data = dataset)

y_pred = predict(regressor, newdata = test_set)