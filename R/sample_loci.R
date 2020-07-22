##############################################################################
################################Resampling####################################
##############################################################################

###########################
#Resampling l loci X times#
###########################

#front function of sample_loci

sample_loci <- function (data1, haploid = FALSE, vecpop = NULL, nbrepeat = 1000, 
    He = FALSE, graph = FALSE, export = FALSE, bar = FALSE) 
{
    if (length(vecpop) != 0) {
        if (length(vecpop) != nrow(data1)) {
            stop("Error: vecpop length is not equal to the number of rows of your dataset.")
        }
        vecpop_o <- vecpop
        vecpop <- c(rep(1:length(unique(vecpop)), times = table(vecpop)[unique(vecpop)]))
        datatot <- split(data1, vecpop)
        datafreq <- freq_RR(data1, haploid, vecpop, genet = FALSE, 
            RR = FALSE)
        res <- list(NULL)
        for (p in 1:length(unique(vecpop))) {
            rownames(datatot[[p]]) <- 1:nrow(datatot[[p]])
            res[[p]] <- sample_loci_core(datatot[[p]], data2 = datafreq[[p]], 
                haploid, nbrepeat, He, graph = FALSE, bar)
            if (graph) {
                par(ask = TRUE)
                boxplot(res[[p]]$raw_MLG, ylab = "Number of multilocus genotypes", 
                  xlab = "Number of loci sampled")
                title(paste("Genotype accumulation curve"))
                par(ask = FALSE)
            }
            if (export) {
                postscript(file = paste(paste("sample_loci", 
                  unique(vecpop_o)[[p]], sep = "_"), ".eps", 
                  sep = ""), onefile = FALSE, paper = "letter")
                boxplot(res[[p]]$raw_MLG, ylab = "Number of multilocus genotypes", 
                  xlab = "Number of loci sampled")
                title(paste("Genotype accumulation curve"))
                dev.off()
            }
        }
        names(res) <- unique(vecpop_o)
    }
    else {
        data2 <- freq_RR_core(data1, haploid, genet = FALSE, 
            RR = FALSE)
        res <- sample_loci_core(data1, data2, haploid, nbrepeat, 
            He, graph, bar)
        if (export) {
            postscript(file = "sample_loci.eps", onefile = FALSE, 
                paper = "letter")
            boxplot(res$raw_MLG, ylab = "Number of multilocus genotypes", 
                xlab = "Number of loci sampled")
            title(paste("Genotype accumulation curve"))
            dev.off()
        }
    }
    res
}
