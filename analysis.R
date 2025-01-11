# get function source
source("Rcourse/functions.R")

# generate vectors
N = 100
subject        = seq(1, N, 1)
age            = runif(N, 15, 40)
gender         = factor(sample(c('female', 'male'), N, replace = T))
response_time  = runif(N, 200, 6000)
depression     = runif(N, 0, 100)   
sleep_duration = runif(N, 2, 12)

# add to data.frame
df <- data.frame(subject, age, gender, response_time, depression, sleep_duration)
summary(df)

# use function
generate_stats(df, 20, 45)
