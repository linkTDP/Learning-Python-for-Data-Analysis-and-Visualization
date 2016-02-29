### vectors, data, matrices, subsetting
x=c(2,7,5)
x
y=seq(from=4,length=3,by=3)
?seq
y
x+y
x/y
x^y
x[2]
x[2:3]
x[-2] # remove vector in position 2
x[-c(1,2)] #remove elemnts in position 1 and 2
z=matrix(seq(1,12),4,3)
z
z[3:4,2:3]
z[,2:3]
z[,1]
z[,1,drop=FALSE]
dim(z)
ls()
rm(y)
ls()
### Generating random data, graphics
x=runif(50)
y=rnorm(50)
plot(x,y)
x
plot(x,y,xlab="Random Uniform",ylab="Random Normal",pch="*",col="blue")
par(mfrow=c(2,1)) #set parameter of plot 2 rows and 1 column
plot(x,y)
hist(y)
par(mfrow=c(1,1))
### Reading in data
Auto=read.csv("Auto.csv")
pwd()
Auto=read.csv("../Auto.csv")
names(Auto)
dim(Auto)
class(Auto)
?summary()
summary(Auto)
plot(Auto$cylinders,Auto$mpg)
plot(Auto$cyl,Auto$mpg)
attach(Auto)
search()
plot(cylinders,mpg)
cylinders=as.factor(cylinders)
plot(cylinders,mpg,xlab="Cylinders",ylab="Mpg",col="red")
pdf(file="../mpg.pdf")
plot(cylinders,mpg,xlab="Cylinders",ylab="Mpg",col="red")
dev.off()
pairs(Auto,col="brown")
pairs(mpg~cylinders+acceleration+weight,Auto)
q()