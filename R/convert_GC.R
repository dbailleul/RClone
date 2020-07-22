#########################
#Load files from Outside#
#########################

#convert_GC helps translating files into RClone files

convert_GC <- function(data1, num, ele){
	
	if (missing(ele)){
		res <- apply(data1, 1:2, function(x) sort(c(substr(x, 1, num), substr(x, num+1, num*2))))
	} else {
		res <- apply(data1, 1:2, function(x) sort(unlist(strsplit(x, split = ele))))
	}
	mat_all <- as.data.frame(t(apply(res, 2, function(x) rbind(x))), stringsAsFactors = FALSE)

	#if (ncol(mat_all) != ncol(data1)*2) {stop("Error: Entry data format might be incorrect")} #error impossible
	#if (nrow(mat_all) != nrow(data1)) {stop("Error: Entry data format might be incorrect")} #error impossible

	names(mat_all) <- unlist(lapply(names(data1), function(x) paste(x, 1:2, sep = "_")))
mat_all
}
