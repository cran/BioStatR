#' Intervalles de confiance pour une proportion
#' 
#' Cette fonction permet de calculer plusieurs types d'intervalles de confiance
#' pour une proportion.
#' 
#' 
#' @param x Nombre de succès
#' @param n Nombre d'essais
#' @param conf.level Niveau de confiance recherché pour l'intervalle
#' @param method Type d'intervalle de confiance à calculer : intervalle de
#' "Wilson", intervalle "exact" de Clopper-Pearson, intervalle asymptotique de
#' "Wald" ou tous les trois "all"
#' @return \item{matrix}{Limites des intervalles de confiance demandés.}
#' @author Frédéric Bertrand\cr \email{frederic.bertrand@@utt.fr}\cr
#' \url{http://www-irma.u-strasbg.fr/~fbertran/}\cr 
#' Maumy-Bertrand\cr \email{myriam.maumy@@utt.fr}\cr
#' \url{http://www-irma.u-strasbg.fr/~mmaumy/}
#' @seealso \code{\link{binom.test}}, \code{\link{binom.ci}},
#' \code{\link{poi.ci}}
#' @references F. Bertrand, M. Maumy-Bertrand, Initiation à la Statistique avec
#' R, Dunod, 4ème édition, 2023.
#' @keywords univar
#' @examples
#' 
#' binom.ci(5,10,method="all")
#' 
#' @export binom.ci
binom.ci <- function (x, n, conf.level = 0.95, method = c("Wilson", "exact", "Wald", 
    "all")) 
{
    method <- match.arg(method)
    bc <- function(x, n, conf.level, method) {
        nu1 <- 2 * (n - x + 1)
        nu2 <- 2 * x
        ll <- if (x > 0) 
            x/(x + qf(1/2 + conf.level/2, nu1, nu2) * (n - x + 1))
        else 0
        nu1p <- nu2 + 2
        nu2p <- nu1 - 2
        pp <- if (x < n)
            qf(1/2 + conf.level/2, nu1p, nu2p)
        else 1
        ul <- ((x + 1) * pp)/(n - x + (x + 1) * pp)
        zcrit <- -qnorm((1-conf.level)/2)
        z2 <- zcrit * zcrit
        p <- x/n
        cl <- (p + z2/2/n + c(-1, 1) * zcrit * sqrt((p * (1 - 
            p) + z2/4/n)/n))/(1 + z2/n)
        if (x == 1) 
            cl[1] <- -log(conf.level)/n
        if (x == (n - 1)) 
            cl[2] <- 1 + log(conf.level)/n
        asymp.lcl <- x/n - qnorm(1/2+conf.level/2) * sqrt(((x/n) * 
            (1 - x/n))/n)
        asymp.ucl <- x/n + qnorm(1/2+conf.level/2) * sqrt(((x/n) * 
            (1 - x/n))/n)
        res <- rbind(c(ll, ul), cl, c(asymp.lcl, asymp.ucl))
        res <- cbind(rep(x/n, 3), res)
        switch(method, Wilson = res[2, ], exact = res[1, ], Wald = res[3, 
            ], all = res, res)
    }
    if ((length(x) != length(n)) & length(x) == 1) 
        x <- rep(x, length(n))
    if ((length(x) != length(n)) & length(n) == 1) 
        n <- rep(n, length(x))
    if ((length(x) > 1 | length(n) > 1) & method == "all") {
        method <- "Wilson"
        warning("method=all will not work with vectors...setting method to Wilson")
    }
    if (method == "all" & length(x) == 1 & length(n) == 1) {
        mat <- bc(x, n, conf.level, method)
        dimnames(mat) <- list(c("Exact", "Wilson", "Wald"), 
            c("PointEst", "Lower", "Upper"))
        return(mat)
    }
    mat <- matrix(ncol = 3, nrow = length(x))
    for (i in 1:length(x)) mat[i, ] <- bc(x[i], n[i], conf.level = conf.level, 
        method = method)
    dimnames(mat) <- list(rep("", dim(mat)[1]), c("PointEst", 
        "Lower", "Upper"))
    mat
}
