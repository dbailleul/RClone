##########################
#Load files from GenClone#
##########################

#transcript_GC uses convert_GC to translate GenClone files into RClone files

transcript_GC <- function(obj, ele, num1, num2, num3){

	dataGC <- read.csv(obj, sep = ele, header = FALSE)
	N <- dataGC[1,1]
	coord_center <- c(mean(c(0,dataGC[1,2])), mean(c(0,dataGC[1,3])))
	nb_loci <- dataGC[1,4]
	ploid <- dataGC[1,5]
		if (ploid != num1){stop("Error: Ploidy different from indicated")}
	names_loci <- dataGC[1,6:ncol(dataGC)]
	names_loci <- as.vector(apply(names_loci, 1:2, function(x) x <- c(as.vector(x))))
		if (length(names_loci) != nb_loci){stop("Error: Number of loci names different")}
		if (nb_loci != num2){stop("Error: Number of loci different from indicated")}

	dataGC <- dataGC[-1,]
	coord <- dataGC[,2:3]
	rownames(coord) <- dataGC[,1]
	colnames(coord) <- c("x", "y")

	data1b <- dataGC[,4:(4+nb_loci-1)]
	rownames(data1b) <- dataGC[,1]
	colnames(data1b) <- names_loci
		if (num1 == 2){
	data1b <- convert_GC(data1b, num3)
		} else {
	data1b <- data1b
		}	
	list(data_genet = data1b, data_coord = coord, names_loci = names_loci, names_units = rownames(coord))
}
