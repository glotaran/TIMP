##############################
## Mass spectra case study
##############################

##############################
## load TIMP
##############################

require(TIMP)

##############################
## READ IN DATA
##############################

mdDat1<-readData("201103CBSG_32_1.cdf.txt")
mdDat2<-readData("201103CBSG_33_1.cdf.txt")

ms1 <- preProcess(data = mdDat1, sel_time_ab = c(1999,2030),
                  sel_lambda = c(2,100))
ms2 <- preProcess(data = mdDat2, sel_time_ab = c(1999,2030), 
                  sel_lambda = c(2,100))
  
##############################
## DEFINE INITIAL MODEL
##############################

model1 <- initModel(mod_type = "mass", 
extracomp = FALSE,                    
peakpar= list(
c( 2013.92786,  3.90388107,  0.168802917), #1
c(2023.04944, 3.77928138,  0.161704913  )), #2
amplitudes = rep(1,2),
fixed = list(amplitudes=1:2),
weightpar = list(
c(NA, NA, 2.5,44.5,.03), 
c(NA,NA,37.5,44.5,.03)))


##############################
## FIT MODEL
##############################

denRes1 <- fitModel(list(ms1,ms2),
                    list(model1),
modeldiffs = list( 
change = list(list(what = "fixed", dataset=2, spec = list()),
list(what = "amplitudes", dataset = 2, spec = c(1.28920472,  0.253247947)))),
opt=massopt(iter=100,
 linrange = .2, nnls = TRUE, summaryplotrow=4,summaryplotcol=5,
makeps = "MARI", xlab = "time", output = "pdf", algorithm="nls.lm",
ylab = "mass", 
nummaxtraces = 30))

