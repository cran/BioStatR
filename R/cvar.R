#' Coefficient de variation
#' 
#' Calcule coefficent de variation d'une série statistique
#' 
#' Le coefficient de variation est égal à l'écart-type corrigé divisé par la
#' moyenne. Il est exprimé en pourcents.
#' 
#' @param x Un vecteur numérique
#' @return \item{num}{Valeur du coefficient de variation exprimé en pourcents}
#' @author Frédéric Bertrand\cr \email{frederic.bertrand@@math.unistra.fr}\cr
#' \url{http://www-irma.u-strasbg.fr/~fbertran/}\cr 
#' Maumy-Bertrand\cr \email{myriam.maumy@@math.unistra.fr}\cr
#' \url{http://www-irma.u-strasbg.fr/~mmaumy/}
#' @seealso \code{\link{mean}}, \code{\link{sd}}
#' @references F. Bertrand, M. Maumy-Bertrand, Initiation à la Statistique avec
#' R, Dunod, 3ème edition, 2018.
#' @keywords univar
#' @examples
#' 
#' data(Europe)
#' cvar(Europe[,2])
#' 
#' @export cvar
cvar <- function(x){100*sd(x)/mean(x)}



