#load("5.RData")
load("C:/Users/Fabio/Documents/MEGAsync/progetti/python/LodSum/datasci_notebook/Statistical Learning/5.R.RData")
require(tsboost)


summary(Xy)
plot(Xy)

fit1=lm(y~X1+X2,data=Xy)

coef(summary(fit1))[2,2]

matplot

matplot(Xy,type="l")

legend("topright",legend=names(Xy),lty=1:3,col=1:3)

head(Xy)


myfunc <- function(data, index)
{
  #with(data[index,],alpha(X,Y))
  fit=lm(y~X1+X2,data=data[index,])
  coef(summary(fit))[2,2]
}

?boot

boot.out=boot(Xy,myfunc,R=1000)
boot.out
plot(boot.out)
boot.out$t0


mean(boot.out$t)


new.rows = c(101:200, 401:500, 101:200, 901:1000, 301:400, 1:100, 1:100, 801:900, 201:300, 701:800)

new.Xy = Xy[new.rows, ]

new.Xy

myfunc <- function(data, i)
{
  #with(data[index,],alpha(X,Y))
  mydata <- do.call("rbind", lapply(i, function(n) subset(Xy, firm==data[n])))
  fit=lm(y~X1+X2,data=mydata)
  coef(summary(fit))[2,2]
}

boot.out=boot(Xy,myfunc,R=1000)
boot.out
plot(boot.out)
boot.out$t0


mean(boot.out$t)


blockboot <- function(data) 
{
  fit=lm(y~X1+X2,data=data)
  coef(summary(fit))[2,2]
}

### fixed length (every 20 obs, so for each different firm) block bootstrap
set.seed(321)
boot.1 <- tsboot(Xy, blockboot, R = 1000, l = 100, sim = "fixed")

boot.1
plot(boot.1)
boot.1$t0


mean(boot.1$t)    
