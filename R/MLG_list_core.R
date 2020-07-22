#############
#Listing MLG#
#############

#core function of MLG_list
#Listing MLG with a list format

MLG_list_core <- function(data1){

	nb_loci <- ncol(data1)/2
	mat_genet2 <- unique(data1)
	list_genet <- list(NULL)

	for (i in 1:nrow(mat_genet2)){
		list_genet[[i]] <- c(which(apply(data1, 1, function(x) which(sum(x == mat_genet2[i,]) == nb_loci*2)) != 0))
			if (length(names(list_genet[[i]])) != 0) {
				names(list_genet[[i]]) <- NULL
			}
	}
	list_genet <- list_genet
}
