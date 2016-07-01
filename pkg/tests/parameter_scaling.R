# Simulation input arguments
kinpar = c(0.055, 0.005)
amplitudes =  c(1, 1)
tmax =  120
deltat =  0.5 
specpar =  list(c(22000, 4000, 0.1), c(20000, 3500, -0.1))
lmin =  400
lmax =  600
deltal =  1
sigma =  0.05
irf =  TRUE
irfpar = c(2,1)
seqmod = TRUE
# Fit arguments
streak = FALSE
streakT = 13164.8235
positivepar = TRUE
iters = 10
specvec = specpar

# Simulating data with function call:
simData <-
  simndecay_gen(
    kinpar = kinpar ,
    amplitudes =  amplitudes ,
    tmax =  tmax ,
    deltat =  deltat ,
    specpar = specpar ,
    lmin =  lmin ,
    lmax =  lmax ,
    deltal =  deltal ,
    sigma =  sigma ,
    irf =  irf ,
    irfpar = irfpar ,
    seqmod = seqmod
  )

kinModel <- initModel(
  mod_type = "kin",
  kinpar = kinpar*1.1,
  irf = irf,
  irfpar = if (irf)
    irfpar
  else
    vector(),
  streak = streak,
  streakT = 13164.8235,
  positivepar = positivepar,
  seqmod = seqmod,
  lscalpar = TRUE
)

kinFit <-
  fitModel(
    data = list(simData),
    modspec = list(kinModel),
    opt = kinopt(iter = iters, plot = FALSE)
  )

kinFitSummary <-
  summary(
    kinFit$currModel@fit@nlsres[[1]],
    currModel = kinFit$currModel,
    currTheta = kinFit$currTheta,
    correlation = TRUE
  )

print(kinFitSummary)

specModel <-
  initModel(mod_type = "spec",
            specpar = specvec*1.05,
            nupow = 1,
            lscalpar = TRUE)

specFit <-
  fitModel(
    data = list(simData),
    modspec = list(specModel),
    opt = kinopt(iter = iters, plot = FALSE)
  )

specFitSummary <-
  summary(
    specFit$currModel@fit@nlsres[[1]],
    currModel = specFit$currModel,
    currTheta = specFit$currTheta,
    correlation = TRUE
  )

print(specFitSummary)