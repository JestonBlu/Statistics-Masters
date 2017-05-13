


#The following Splus program generates various summary statistics for the
#Ozone data. The ozone data is in the files ozone1.DAT and ozone2.DAT
#The following file can be found in ~longneck/meth1/sfiles/ozonesum.R
#------------------------------------------------------------------------------

#input the data from data files:

          y2   =   scan("u:/meth1/Rfiles/ozone1.DAT")
          y1   =   scan("u:/meth1/Rfiles/ozone2.DAT")
          y2p   =   scan("u:/meth1/Rfiles/ozone1+.DAT")
          y1p   =   scan("u:/meth1/Rfiles/ozone2+.DAT")
          

#compute summary statistics for Ozone data:

    MeanYkrs   =   mean(y1)
    MeanStmf   =   mean(y2)
    VarYkrs    =   var(y1)
    VarStmf    =   var(y2)
    StDevYkrs   =   sqrt(var(y1))
    StDevStmf   =   sqrt(var(y2))
    StErrMeanYkrs   =   sqrt(mean(y1)/length(y1))
    StErrMeanStmf   =   sqrt(mean(y2)/length(y2))
    MedianYkrs   =   median(y1)
    MedianStmf   =   median(y2)
    MinYkrs   =   min(y1)
    MinStmf   =   min(y2)
    MaxYkrs   =   max(y1)
    MaxStmf   =   max(y2)
    RangeYkrs   =   max(y1) - min(y1)
    RangeStmf   =   max(y2) - min(y2)
    Q.25Ykrs   =   quantile(y1,.25)
    Q.25Stmf   =   quantile(y2,.25)
    Q.75Ykrs   =   quantile(y1,.75)
    Q.75Stmf   =   quantile(y2,.75)
    IQRYkrs   =   Q.75Ykrs-Q.25Ykrs
    IQRStmf   =   Q.75Stmf-Q.25Stmf
    MadStmf   =   mad(y1)
    MadYkrs   =   mad(y2)

    MeanYkrsp   =   mean(y1p)
    MeanStmfp   =   mean(y2p)
    VarYkrsp    =   var(y1p)
    VarStmfp    =   var(y2p)
    StDevYkrsp   =   sqrt(var(y1p))
    StDevStmfp   =   sqrt(var(y2p))
    StErrMeanYkrsp   =   sqrt(mean(y1p)/length(y1p))
    StErrMeanStmfp   =   sqrt(mean(y2p)/length(y2p))
    MedianYkrsp   =   median(y1p)
    MedianStmfp   =   median(y2p)
    MinYkrsp   =   min(y1p)
    MinStmfp   =   min(y2p)
    MaxYkrsp   =   max(y1p)
    MaxStmfp   =   max(y2p)
    RangeYkrsp   =   max(y1p) - min(y1p)
    RangeStmfp   =   max(y2p) - min(y2p)
    Q.25Ykrsp   =   quantile(y1p,.25)
    Q.25Stmfp   =   quantile(y2p,.25)
    Q.75Ykrsp   =   quantile(y1p,.75)
    Q.75Stmfp   =   quantile(y2p,.75)
    IQRYkrsp   =   Q.75Ykrsp-Q.25Ykrsp
    IQRStmfp   =   Q.75Stmfp-Q.25Stmfp
    MadStmfp   =   mad(y1p)
    MadYkrsp   =   mad(y2p)







  SumStat   =   c(MeanYkrs,MeanStmf,StDevYkrs,StDevStmf,MedianYkrs,MedianStmf,
                MinYkrs,MinStmf,MaxYkrs,MaxStmf,Q.25Ykrs,Q.25Stmf,Q.75Ykrs,
                Q.75Stmf,IQRYkrs,IQRStmf,MadYkrs,MadStmf)
  SumStatName   =   c("MeanYkrs","MeanStmf","StDevYkrs","StDevStmf","MedianYkrs",
                   "MedianStmf","MinYkrs","MinStmf","MaxYkrs","MaxStmf",
                   "Q.25Ykrs","Q.25Stmf","Q.75Ykrs","Q.75Stmf","IQRYkrs",
                   "IQRStmf","MadYkrs","MadStmf")
   SumStatp   =   c(MeanYkrsp,MeanStmfp,StDevYkrsp,StDevStmfp,MedianYkrsp,
                MedianStmfp,MinYkrsp,MinStmfp,MaxYkrsp,MaxStmfp,Q.25Ykrsp,
                Q.25Stmfp,Q.75Ykrsp,Q.75Stmfp,IQRYkrsp,IQRStmfp,MadYkrsp,
                MadStmfp)                

  SumStat   =   round(SumStat,2)

  SumStatp   =   round(SumStatp,2)

  SumStat   =   cbind(SumStatName,SumStat,SumStatp) 


 #Output summary statistics to file named SumOzone:

  sink("SumOzone")

  SumStat

  sink()

