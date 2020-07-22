#############
#Listing MLG#
#############

#core function of MLG_tab
#Listing MLG with a table format

MLG_tab_core <- function(data1){

	list_genet <- MLG_list(data1)
	data_MLG <- unique(data1)
	nb_loci <- ncol(data1)/2
	G <- nrow(data_MLG)
	list_genet2 <- as.data.frame(matrix(NA, ncol = max(sapply(list_genet, length)), nrow = G))
		for (i in 1:nrow(data_MLG)){
			list_genet2[i, 1:sapply(list_genet, length)[i]] <- c(which(apply(data1, 1, function(x) which(sum(x == data_MLG[i,]) == nb_loci*2)) != 0))
		}
	list_genet2[is.na(list_genet2)] <- ""
	colnames(list_genet2) <- paste("unit", 1:ncol(list_genet2), sep = "_")
	list_genet2
}
