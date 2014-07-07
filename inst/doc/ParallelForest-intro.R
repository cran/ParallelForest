## ------------------------------------------------------------------------
library(ParallelForest)

data(low_high_earners)       # training dataset
data(low_high_earners_test)  # testing dataset

## ------------------------------------------------------------------------
fforest = grow.forest(Y~., data=low_high_earners, 
    min_node_obs=1000, max_depth=10,
    numsamps=100000, numvars=5, numboots=5)

## ------------------------------------------------------------------------
fforest_samepred = predict(fforest, low_high_earners)
pctcorrect_samepred = sum(low_high_earners$Y==fforest_samepred)/nrow(low_high_earners)
print(pctcorrect_samepred)

## ------------------------------------------------------------------------
fforest_newpred = predict(fforest, low_high_earners_test)
pctcorrect_newpred = sum(low_high_earners$Y==fforest_newpred)/nrow(low_high_earners)
print(pctcorrect_newpred)

