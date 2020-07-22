#############
#Listing MLG#
#############

#front function of MLG_tab
#Listing MLG with a table format


MLG_tab <- function (data1, haploid = FALSE, vecpop = NULL) 
{
    if (length(vecpop) != 0) {
        if (length(vecpop) != nrow(data1)) {
            stop("Error: vecpop length is not equal to the number of rows of your dataset.")
        }
        vecpop_o <- vecpop
        vecpop <- c(rep(1:length(unique(vecpop)), times = table(vecpop)[unique(vecpop)]))
        datatot <- split(data1, vecpop)
        res <- lapply(datatot, function(x) MLG_tab_core(x))
        names(res) <- unique(vecpop_o)
    }
    else {
        res <- MLG_tab_core(data1, haploid)
    }
    res
}
