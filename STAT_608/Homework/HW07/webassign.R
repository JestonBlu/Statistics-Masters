

mdl = lm(PrizeMoney ~ DrivingAccuracy + GIR + PuttingAverage + BirdieConversion +
           SandSaves + Scrambling + PuttsPerRound,
         data = dt)

dt2[, 3:12] = log(dt2[, 3:12])

mdl2 = lm(PrizeMoney ~ DrivingAccuracy + GIR + 
           BirdieConversion + SandSaves + 
           Scrambling + PuttsPerRound,
         data = dt2)
