## this is a simple predictiveness script in R
options <- commandArgs(trailingOnly = TRUE)
library(PredictABEL)
data <- read.table(options[1],sep=" ",head=F)
head(data)

# specify column number of outcome variable
cOutcome <- 3
# specify column numbers of non-genetic predictors
cNonGenPred <- 2

# fit logistic regression model
riskmodel <- fitLogRegModel(data=data, cOutcome=cOutcome, cNonGenPreds=cNonGenPred)
prisk <- predRisk(riskmodel)
png(filename = options[2])
plotPredictivenessCurve(predrisk=prisk,rangeyaxis=c(0,1),ylabel="Predictivity",xlabel="Quantile")
def.off()
