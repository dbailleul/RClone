#####################################################
#probability of one genotype with repro events: psex#
#####################################################

#front function of psex computation

psex <- function (data1, haploid = FALSE, vecpop = NULL, genet = FALSE, 
    RR = FALSE, MLGsim = FALSE, nbrepeat = NULL, bar = FALSE) 
{
    if (genet & RR) {
        stop("Round-Robin method is not compatible with genet option.")
    }
    if (RR) {
        datafreq <- freq_RR(data1, haploid, vecpop, genet = FALSE, 
            RR = TRUE)
    }
    else if (genet) {
        datafreq <- freq_RR(data1, haploid, vecpop, genet = TRUE, 
            RR = FALSE)
    }
    else {
        datafreq <- freq_RR(data1, haploid, vecpop, genet = FALSE, 
            RR = FALSE)
    }
    if (length(vecpop) != 0) {
        if (length(vecpop) != nrow(data1)) {
            stop("Error: vecpop length is not equal to the number of rows of your dataset.")
        }
        vecpop_o <- vecpop
        vecpop <- c(rep(1:length(unique(vecpop)), times = table(vecpop)[unique(vecpop)]))
        datatot <- split(data1, vecpop)
        res <- list(NULL)
        for (p in 1:length(unique(vecpop))) {
            rownames(datatot[[p]]) <- 1:nrow(datatot[[p]])
            res[[p]] <- psex_core(data1 = datatot[[p]], data2 = datafreq[[p]], 
                haploid, MLGsim, nbrepeat, bar)
        }
        names(res) <- unique(vecpop_o)
    }
    else {
        res <- psex_core(data1, data2 = datafreq, haploid, MLGsim, 
            nbrepeat, bar)
    }
    res
}
