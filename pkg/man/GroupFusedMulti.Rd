\name{predict.gfmr}
\alias{predict.gfmr}

\title{ Predict method for group fused multinomial logistic regression  }
\description{
This routine fits the group fused multinomial logistic regression model, which uses fusion shrinkage
to automatically combine response categories.  
}
\usage{
predict.gfmR<-function(obj,newdata,type=c("probs","response"))

}
\arguments{
  \item{obj}{ A gfmr object which specficially is the output from the GroupFusedMulti function.}
  \item{newdata}{value to be predicted in model matrix form}
  \item{type}{Type of prediction, "probs" returns probabilities, while response returns log of the ratio of probabilties for baseline category}.
}
\details{
Prediction function for GFMR 
}
\value{
A vector or a matrix corresponding to type return. 
}
\references{
Price, B.S, Geyer, C.J. and Rothman, A.J. "Automatic Response Category Combination in Multinomial Logistic Regression."  https://arxiv.org/abs/1705.03594. 
}

\author{ Brad Price, \email{brad.price@mail.wvu.edu}.}


\examples{

\dontrun{data(nes96)
attach(nes96)
Response=matrix(0,944,7)
for(i in 1:944){
  if(PID[i]=="strRep"){Response[i,1]=1}
  if(PID[i]=="weakRep"){Response[i,2]=1}
  if(PID[i]=="indRep"){Response[i,3]=1}
  if(PID[i]=="indind"){Response[i,4]=1}
  if(PID[i]=="indDem"){Response[i,5]=1}
  if(PID[i]=="weakDem"){Response[i,6]=1}
  if(PID[i]=="strDem"){Response[i,7]=1}
}

Hmat=matrix(1,dim(Response)[2],dim(Response)[2])
diag(Hmat)=0
ModMat<-lm(popul~age,x=TRUE)$x

X=cbind(ModMat[,1],apply(ModMat[,-1],2,scale))
mod<-GroupFusedMulti(Response,X,lambda=2^4.3,H=Hmat2,rho=10^2,iter=50,tol1=10^-4,tol2=10^-4)
predict(mod,X[1,])
}

}
\keyword{regression}% at least one, from doc/KEYWORDS

