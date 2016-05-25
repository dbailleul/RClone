context("RClone Package Global Test")

test_that("the GenClone function works", {

	skip_on_cran()

	data(posidonia)
	data(coord_posidonia)
	
	prev <- GenClone_core(posidonia, freq_RR(posidonia))
	
	expect_that(prev, is_a("data.frame"))
	expect_that(ncol(prev),  equals(24))
	
	res_tot <- GenClone(posidonia, coords = coord_posidonia, bar = TRUE)
	res_wc <- GenClone(posidonia) #without coordinates
	res_mll <- GenClone(posidonia, listMLL = MLG_list(posidonia)) #MLL
	res_hp <- GenClone(posidonia, haploid = TRUE) #haploids
	res_rp <- GenClone(posidonia, coords = coord_posidonia, nbrepeat = 10) #repeats
	res_nc <- GenClone(unique(posidonia)) 
	res_vp <- GenClone(posidonia, vecpop = rep(1, 40)) #multipop

	expect_that(res_tot, is_a("data.frame"))
	expect_that(res_wc, is_a("data.frame"))
	expect_that(res_mll, is_a("data.frame"))
	expect_that(res_hp, is_a("data.frame"))
	expect_that(res_rp, is_a("data.frame"))
	expect_that(res_nc, is_a("data.frame"))
	expect_that(res_vp, is_a("data.frame"))
	expect_that(ncol(res_tot),  equals(24))
 	expect_that(ncol(res_wc),  equals(24))
	#expect_that(sum(is.na(res_tot)),  equals(6))
	#expect_that(sum(is.na(res_wc)),  equals(10))
	expect_that(length(which(res_tot == "NA")),  equals(6))
	expect_that(length(which(res_wc == "NA")),  equals(10))
	
	expect_that(GenClone(posidonia, listMLL = 1),  throws_error(""))
	expect_that(GenClone(posidonia, vecpop = 1),  throws_error(""))
	
	res1 <- popsimgen(posidonia) #sub-function
	res2 <- popsimgen(posidonia, haploid = TRUE)
	
	expect_that(res1, is_a("data.frame"))
	expect_that(res2, is_a("data.frame"))
	expect_that(nrow(res1),  equals(40))
 	expect_that(ncol(res1),  equals(14))

})

test_that("internal functions of GenClone are OK", {

	skip_on_cran()

	data(posidonia)
	data(coord_posidonia)
	res_tot <- GenClone(posidonia, coords = coord_posidonia)

	#expect_equal(unlist(res_tot[1,1]), 40) #counts N
	#expect_equal(unlist(res_tot[1,2]), "MLG") #detects no MLL
	#expect_equal(unlist(res_tot[1,3]),  28) #MLG_list works
	#expect_equal(unlist(res_tot[1,4]),  4.142857, tolerance  = 0.000001) #freq_all works
	#expect_equal(unlist(res_tot[1,6]),  0.05076926, tolerance  = 0.0000001) #Fis works
	#expect_equal(unlist(res_tot[1,8]),  0.02568129, tolerance  = 0.0000001) #double-test Fis
	#expect_equal(unlist(res_tot[1,10]),  0.6923077) #clonal_index works
	#expect_equal(unlist(res_tot[1,24]),  33.91304, tolerance  = 0.00001) #double-test clonal_index
	#expect_equal(unlist(res_tot[1,11]),  1.180756, tolerance  = 0.0000001) #Pareto_index works
	#expect_equal(unlist(res_tot[1,12]),  0.001230855, tolerance  = 0.0000001) #autocorrelation case 1 works
	#expect_equal(unlist(res_tot[1,14]),  0.0012436, tolerance  = 0.00001) #autocorrelation case 2 works
	#expect_equal(unlist(res_tot[1,16]),  0.0007693264) #autocorrelation case 3 works
	#expect_equal(unlist(res_tot[1,18]),  0.0008031684) #autocorrelation case 4 works
	
	expect_equal(res_tot[1,1], "40") #counts N
	expect_equal(res_tot[1,2], "MLG") #detects no MLL
	expect_equal(res_tot[1,3],  "28") #MLG_list works
	expect_equal(as.numeric(res_tot[1,4]),  4.142857, tolerance  = 0.000001) #freq_all works
	expect_equal(as.numeric(res_tot[1,6]),  0.05076926, tolerance  = 0.0000001) #Fis works
	expect_equal(as.numeric(res_tot[1,8]),  0.02568129, tolerance  = 0.0000001) #double-test Fis
	expect_equal(as.numeric(res_tot[1,10]),  0.6923077) #clonal_index works
	expect_equal(as.numeric(res_tot[1,24]),  33.91304, tolerance  = 0.00001) #double-test clonal_index
	expect_equal(as.numeric(res_tot[1,11]),  1.180756, tolerance  = 0.0000001) #Pareto_index works
	expect_equal(as.numeric(res_tot[1,12]),  0.001230855, tolerance  = 0.0000001) #autocorrelation case 1 works
	expect_equal(as.numeric(res_tot[1,14]),  0.0012436, tolerance  = 0.00001) #autocorrelation case 2 works
	expect_equal(as.numeric(res_tot[1,16]),  0.0007693264) #autocorrelation case 3 works
	expect_equal(as.numeric(res_tot[1,18]),  0.0008031684) #autocorrelation case 4 works

})
