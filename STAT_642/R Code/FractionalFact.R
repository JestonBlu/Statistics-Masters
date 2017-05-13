`# the following code will dublicate the SAS output given in Handout 10 for 
# obtaining a design with 8 factors in 16 runs and resolution 4 

install.packages("FrF2")

library(FrF2)

design = FrF2(nruns=16,nfactors=8,generators=c("BCD","ACD","ABD","ABC"))

# The generators are E=BCD, F=ACD,  G=ABD,  H=ABC

design$y = c(1:nrow(design))

alias_sets = aliases(lm(y~(.)^4,data=design))

