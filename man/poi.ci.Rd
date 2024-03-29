% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/poi.ci.R
\name{poi.ci}
\alias{poi.ci}
\title{Intervalle de confiance pour le paramètre d'une loi de Poisson}
\usage{
poi.ci(x, conf.level = 0.95)
}
\arguments{
\item{x}{Un vecteur de données}

\item{conf.level}{Niveau de confiance de l'intervalle}
}
\value{
\item{matrix}{Limites des intervalles de confiance demandés.}
}
\description{
Créé un intervalle de confiance pour le paramètre d'une loi de Poisson.
}
\examples{

poi.ci(rpois(20,10))

}
\references{
F. Bertrand, M. Maumy-Bertrand, Initiation à la Statistique avec
R, Dunod, 4ème édition, 2023.
}
\seealso{
\code{\link{binom.test}}, \code{\link{binom.ci}},
\code{\link{poi.ci}}
}
\author{
Frédéric Bertrand\cr \email{frederic.bertrand@utt.fr}\cr
\url{http://www-irma.u-strasbg.fr/~fbertran/}\cr 
Maumy-Bertrand\cr \email{myriam.maumy@utt.fr}\cr
\url{http://www-irma.u-strasbg.fr/~mmaumy/}
}
\keyword{univar}
