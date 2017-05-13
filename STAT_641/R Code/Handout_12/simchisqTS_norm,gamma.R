  r=10000
   a  =  .1
   b  =  1/31.6
   n  =  10
  df  =  n-1
  x1  =   rep(0,r)
  x2  =   rep(0,r)
  x3  =   rep(0,r)
  x4  =   rep(0,r)
  x5  =   rep(0,r)
  x6  =   rep(0,r)
  x7  =   rep(0,r)
  x8  =   rep(0,r)
  x9  =   rep(0,r)
  x10  =  rep(0,r)
  s2   =  rep(0,r)
  chi  =  rep(0,r)
  chiL  =  rep(0,r)
  chiU  =  rep(0,r)



  for (i in 1:r) {
        x1[i]  =  rgamma(1,a,b)
        x2[i]  =  rgamma(1,a,b)
        x3[i]  =  rgamma(1,a,b)
        x4[i]  =  rgamma(1,a,b)
        x5[i]  =  rgamma(1,a,b)
        x6[i]  =  rgamma(1,a,b)
        x7[i]  =  rgamma(1,a,b)
        x8[i]  =  rgamma(1,a,b)
        x9[i]  =  rgamma(1,a,b)
        x10[i]  =  rgamma(1,a,b)
        
        s2[i]  =  var(c(x1[i],x2[i],x3[i],x4[i],x5[i],x6[i],x7[i],
                 x8[i],x9[i],x10[i]))
      chi[i]  =  s2[i]*(n-1)/100
        if (chi[i]>qchisq(.95,df)) (chiU[i]  =  1)

        if (chi[i]<qchisq(.05,df)) (chiL[i]  =  1)}
        pL  =  sum(chiL)/r
        pU  =  sum(chiU)/r
    p = c(.001,.05,.95,.999)
    quantile(chi,p)

 plot(density(chi),
main="PDF of Chi-square TS when data from Gamma",xlab="Values of Test Statistic")
 text(200,.14,"TS has Q(.001) = .0000076")
 text(200,.12,"TS has Q(.05) = .0106")
 text(200,.10,"TS has Q(.95) = 41.10")
 text(200,.08,"TS has Q(.999) = 279.8")

 x=seq(0,40,.001)
 y=dchisq(x,9)
 plot(x,y,type="l",main="PDF of Chisquare Distribution(df=9)")
 text(30,.09,"Q(.001) = 1.15")
 text(30,.08,"Q(.05) = 3.33")
 text(30,.07,"Q(.95) = 16.92")
 text(30,.06,"Q(.999) = 27.88")




