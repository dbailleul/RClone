#################################
#"Good" increasing alleles order#
#################################

#For diploid markers, sort_all is to run before any test to be sure that, 
##per marker, your alleles are in an increasing order.

#data1 <- sort_all(data1)

sort_all <- function(data1){

	index_l <- 1:c(ncol(data1)/2)*2-1
	nb_loci <- ncol(data1)/2
	mat <- as.data.frame(matrix(NA, ncol = ncol(data1), nrow = nrow(data1)))
		for (j in index_l){ 
			for (i in 1:nrow(data1)){
				mat[i,c(j, j+1)] <- sort(c(data1[i,j], data1[i,j+1]))
			}
		}
	names(mat) <- names(data1)
	mat_all <- mat
	mat_all
}
