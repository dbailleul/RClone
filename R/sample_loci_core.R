##############################################################################
################################Resampling####################################
##############################################################################

###########################
#Resampling l loci X times#
###########################

#core function of sample_loci


sample_loci_core <- function(data1, data2, haploid = FALSE, nbrepeat = 1000, He = FALSE, graph = FALSE, bar = FALSE){

	if (He & haploid){stop("Haploids and He computations are not compatible.")}

	if (haploid){
		data1 <- cbind(data1, data1)
		data1 <- data1[, sort(rep(1:(ncol(data1)/2), 2))]
	}

	index_l <- 1:c(ncol(data1)/2)*2-1 
	nb_loci <- ncol(data1)/2
	ncol_freq <- 3

	mat_box_l <- as.data.frame(matrix(NA, ncol = nb_loci, nrow = nbrepeat))
	mat_box_l2 <- as.data.frame(matrix(NA, ncol = nb_loci, nrow = nbrepeat))
	mat_box_l3 <- as.data.frame(matrix(NA, ncol = nb_loci, nrow = nbrepeat)) 
	mat_res_MLG_l <- as.data.frame(matrix(NA, ncol = 5, nrow = nb_loci))
		if (He){
			He_box_l <- as.data.frame(matrix(NA, ncol = nb_loci, nrow = nbrepeat))
			He_box_l2 <- as.data.frame(matrix(NA, ncol = nb_loci, nrow = nbrepeat))
			mat_res_all_l <- as.data.frame(matrix(NA, ncol = 7, nrow = nb_loci))
		} else {
			mat_res_all_l <- as.data.frame(matrix(NA, ncol = 5, nrow = nb_loci))
		}	

if (bar){
	total <- max(index_l)
	pb <- txtProgressBar(min = 0, max = total, style = 3)
}


for (j in 1:nbrepeat){
	for (i in index_l){
		indic <- sample(index_l, which(index_l == i))
		mat_test <- data1[,sort(c(indic, indic+1))]
			if (He){
				He_ind <- NULL
					for (l in indic){
						He_ind <- c(He_ind, 2*nrow(mat_test)/(2*nrow(mat_test)-1)*(1 - sum(as.numeric(data2[rownames(data2[data2==paste("locus",c((l+1)/2), sep="_"),]), ncol_freq])^2)))
					}
				He_box_l[j,c((i+1)/2)] <- mean(He_ind)
				He_box_l2[j,c((i+1)/2)] <- var(He_ind)
				colnames(He_box_l) <- colnames(He_box_l2) <- c("1_locus", paste(2:nb_loci, "loci", sep = "_"))
			}
		mat_test <- unique(mat_test)
		mat_box_l[j,c((i+1)/2)] <- nrow(mat_test)
		nb_loc <- NULL
			for (k in index_l[1:c(ncol(mat_test)/2)]){
				nb_loc <- c(nb_loc, length(unique(unlist(mat_test[,c(k,k+1)]))))
			}
		mat_box_l2[j,c((i+1)/2)] <- sum(nb_loc)
		mat_box_l3[j,c((i+1)/2)] <- var(nb_loc)
	}

if (bar){
	setTxtProgressBar(pb, i)
}
}

if (bar){
	close(pb)
}

	colnames(mat_box_l) <- colnames(mat_box_l2) <- colnames(mat_box_l3) <- c("1_locus", paste(2:nb_loci, "loci", sep = "_"))

	mat_res_MLG_l[,1] <- 1:nb_loci
	mat_res_MLG_l[,2] <- apply(mat_box_l, 2, min)
	mat_res_MLG_l[,3] <- apply(mat_box_l, 2, max)
	mat_res_MLG_l[,4] <- apply(mat_box_l, 2, mean)
	mat_res_MLG_l[,5] <- apply(mat_box_l, 2, function(x) sd(x)/sqrt(length(x)))
	colnames(mat_res_MLG_l) <- c("nb_loci", "min", "max", "mean_MLG", "SE")

	mat_res_all_l[,1] <- 1:nb_loci
	mat_res_all_l[,2] <- apply(mat_box_l2, 2, min)
	mat_res_all_l[,3] <- apply(mat_box_l2, 2, max)
	mat_res_all_l[,4] <- apply(mat_box_l2, 2, mean)
	mat_res_all_l[,5] <- sqrt(apply(mat_box_l3, 2, function(x) sum(x^2))/(1:nb_loci))
	mat_res_all_l[c(1, nb_loci),5] <- NA

	if (He){
		mat_res_all_l[,6] <- apply(He_box_l, 2, mean)
		mat_res_all_l[,7] <- sqrt(apply(He_box_l2, 2, function(x) sum(x^2))/(1:nb_loci))
		mat_res_all_l[c(1, nb_loci), 7] <- NA
		colnames(mat_res_all_l) <- c("nb_loci", "min", "max", "mean_all", "SE", "He", "SE")
	} else {
		colnames(mat_res_all_l) <- c("nb_loci", "min", "max", "mean_all", "SE")
	}
	
if (graph){
	boxplot(mat_box_l, ylab = "Number of multilocus genotypes", 
	xlab = "Number of loci sampled")
	title(paste("Genotype accumulation curve"))
}

if (He){
	res <- list("res_MLG" = mat_res_MLG_l, "res_alleles" = mat_res_all_l, "raw_He" = He_box_l, "raw_MLG" = mat_box_l, "raw_all" = mat_box_l2)
	} else {
	res <- list("res_MLG" = mat_res_MLG_l, "res_alleles" = mat_res_all_l, "raw_MLG" = mat_box_l, "raw_all" = mat_box_l2)
	}
res
}
