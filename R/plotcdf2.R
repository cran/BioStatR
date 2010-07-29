plotcdf2 <- function(x,y,f,xaxe,yaxe)
{
if (length(f)>1)
{
xi=sort(x)
yj=sort(y)
}
else
{
xi=as.numeric(levels(as.factor(x)))
yj=as.numeric(levels(as.factor(y)))
f=table(x,y)
}
if (sum(sum(f)) > 1){f=f/sum(sum(f))}
F=f
F[1,]=cumsum(f[1,])
F[,1]=cumsum(f[,1])
k=length(xi)
l=length(yj)
for (i in 2:k){
for (j in 2:l){
F[i,j]=f[i,j]+F[i-1,j]+F[i,j-1]-F[i-1,j-1]
}
}
deltax=(max(xi)-min(xi))/200
deltay=(max(yj)-min(yj))/200
x=seq(min(xi)-deltax,max(xi)+deltax,deltax)
y=seq(min(yj)-deltay,max(yj)+deltay,deltay)
n1=length(x)
n2=length(y)
z=matrix(rep(0,n1*n2),ncol=n2)
for (i in 1:n1){
for (j in 1:n2){
i1=(x[i]>=xi)
i2=(y[j]>=yj)
if (sum(i1) == 0 | sum(i2)==0){z[i,j]=0}
if (sum(i1) >= k & sum(i2) >=l){z[i,j]=1}
if (sum(i1) >= k & sum(i2) < l & sum(i2) > 0){z[i,j]=F[k,sum(i2)]}
if (sum(i1) < k & sum(i2) >=l & sum(i1) > 0){z[i,j]=F[sum(i1),l]}
if (sum(i1) < k & sum(i2) < l & sum(i1) > 0 & sum(i2) > 0)
{z[i,j]=F[sum(i1),sum(i2)]}
}
}
persp(x,y,z,theta=-30,phi=15,col="red",shade=0.1,main="Stéréogramme des deux variables",xlab=xaxe,ylab=yaxe,zlab="",
cex.axis=0.75,ticktype="detailed")
}
