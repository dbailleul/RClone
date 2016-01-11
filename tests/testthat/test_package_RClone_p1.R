context("Basic Functions of RClone")

test_that("the convert_GC function works", {

	data(zostera)
	
	zostera <- zostera[1:29,4:12]
	res <- convert_GC(zostera, num = 3)

	expect_that(res, is_a("data.frame"))
	expect_that(ncol(res), equals(ncol(zostera)*2))
	expect_that(nrow(res), equals(nrow(zostera)))

})


test_that("the transcript_GC function works", {
	
	skip_on_cran()
		
	data(infile)
	
	write.table(infile, "infile.csv", col.names = FALSE, row.names = FALSE, sep = ";")
	res <- transcript_GC("infile.csv", ";", 2, 7, 3)
	data1 <- res$data_genet
	coord <- res$data_coord
	
	expect_that(data1, is_a("data.frame"))
	expect_that(coord, is_a("data.frame"))
	expect_that(ncol(data1), equals(14))
	expect_that(ncol(coord), equals(2))
	expect_that(nrow(coord), equals(nrow(data1)))
	
})


test_that("the sort_all function works", {
	
	data(posidonia)
	
	res <- sort_all(posidonia)
	
	expect_that(res, is_a("data.frame"))
	expect_that(ncol(res), equals(ncol(posidonia)))
		
})


test_that("the export functions are OK", {
	
	data(posidonia)
	
	res1 <- export_genclone_genind(posidonia)
	res2 <- export_genclone_genetix(posidonia)
	res3 <- export_genclone_arlequin(posidonia)
	
	expect_that(res1, is_a("data.frame"))
	expect_that(res2, is_a("data.frame"))
	expect_that(res3, is_a("data.frame"))
	expect_that(ncol(res1), equals(ncol(posidonia)/2))
	expect_that(ncol(res2), equals(9))
	expect_that(ncol(res3), equals(1))
	expect_that(nrow(res3), equals(96))	
		
})


test_that("the print functions work", {
	
	data(posidonia)

	expect_that(corresp_loci(posidonia), prints_text("locus_1/Po15_1"))
	expect_that(list_all_obj_core(posidonia), prints_text("locus_2/Po4-3_1"))
	expect_that(list_all_obj(posidonia), prints_text("locus_3/Po5-10_1"))
		
})


test_that("the list_all_tab functions work", {
	
	data(posidonia)
	
	prev1 <- list_all_tab_core(posidonia)
	prev2 <- list_all_tab2_core(posidonia)
	
	expect_that(prev1, is_a("data.frame"))
	expect_that(prev2, is_a("data.frame"))
	expect_that(ncol(prev1), equals(7))
	expect_that(ncol(prev2), equals(2))
	
	res1 <- list_all_tab(posidonia)
	res2 <- list_all_tab2(posidonia)
	
	expect_that(res1, is_a("data.frame"))
	expect_that(ncol(res1), equals(7))
	expect_equal(res1[1,1], as.character(137))
	expect_that(res2, is_a("data.frame"))
	expect_that(ncol(res2), equals(2))
	expect_equal(res2[29,2], as.character(180))
	
})


test_that("the MLG functions work", {
	
	data(posidonia)
	
	prev1 <- MLG_list_core(posidonia)
	prev2 <- MLG_tab_core(posidonia)
	
	expect_that(prev1, is_a("list"))
	expect_that(prev2, is_a("data.frame"))
	expect_that(length(prev1), equals(28))
	expect_that(nrow(prev2), equals(28))
	
	res1 <- MLG_list(posidonia)
	res2 <- MLG_tab(posidonia)
		
	expect_that(res1, is_a("list"))
	expect_that(length(res1), equals(28))
	expect_equal(res1[[27]], 39)
	expect_that(res2, is_a("data.frame"))
	expect_that(nrow(res2), equals(28))
	expect_equal(res2[15,4], as.character(30))
	
})


test_that("the sample functions work", {
	
	skip_on_cran()
	
	data(posidonia)
	
	prev1 <- sample_loci_core(posidonia, nbrepeat = 10)
	prev2 <- sample_units_core(posidonia, nbrepeat = 10)
	
	expect_that(prev1, is_a("list"))
	expect_that(prev2, is_a("list"))
	expect_that(length(prev1), equals(4))
	expect_that(length(prev2), equals(4))
	
	res1 <- sample_loci(posidonia, nbrepeat = 10)
	res2 <- sample_loci(posidonia, nbrepeat = 10, He = TRUE)
	res3 <- sample_units(posidonia, nbrepeat = 10)
	res4 <- sample_units(posidonia, nbrepeat = 10, He = TRUE)
		
	expect_that(res1, is_a("list"))
	expect_that(res2, is_a("list"))
	expect_that(res3, is_a("list"))
	expect_that(res4, is_a("list"))
	expect_that(length(res1), equals(4))
	expect_that(length(res2), equals(5))
	expect_that(length(res3), equals(length(res1)))
	expect_that(length(res4), equals(length(res2)))
	expect_equal(ncol(res1[[2]]), 5)
	expect_equal(ncol(res2[[2]]), 7)
	expect_equal(ncol(res3[[2]]), ncol(res1[[2]]))
	expect_equal(ncol(res4[[2]]), ncol(res2[[2]]))
	expect_equal(ncol(res4[[2]]), ncol(res2[[2]]))
	
	expect_that(sample_loci(posidonia, He = TRUE, haploid = TRUE), throws_error())
	
})
