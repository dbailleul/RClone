#############
#Listing MLG#
#############

#front function of MLG_list
#Listing MLG with a list format

MLG_list <- function(data1, vecpop = NULL){

		if (length(vecpop) != 0){
			if (length(vecpop) != nrow(data1)) {stop("Error: vecpop length is not equal to the number of rows of your dataset.")}
			
		vecpop_o <- vecpop
		vecpop <- c(rep(1:length(unique(vecpop)), times = table(vecpop)[unique(vecpop)]))

			datatot <- split(data1, vecpop)
			res <- list(NULL)
				for (p in 1:length(unique(vecpop))){
					res[[p]] <- MLG_list_core(as.data.frame(datatot[[p]]))
				}
			names(res) <- unique(vecpop_o)
		} else {
			 res <- MLG_list_core(data1)
		}
res
}
