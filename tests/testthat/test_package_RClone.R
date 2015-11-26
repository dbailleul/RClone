context("RClone Package Global Test")

test_that("the GenClone function works", {

	data(posidonia)
	data(coord_posidonia)
	res_tot <- GenClone(posidonia, coords = coord_posidonia)
	res_wc <- GenClone(posidonia) #without coordinates

	expect_that(res_tot, is_a("data.frame"))
	expect_that(res_wc, is_a("data.frame"))
	expect_that(ncol(res_tot),  equals(24))
 	expect_that(ncol(res_wc),  equals(24))
	expect_that(sum(is.na(res_tot)),  equals(6))
	expect_that(sum(is.na(res_wc)),  equals(10))

})

test_that("internal functions of GenClone are OK", {

	data(posidonia)
	data(coord_posidonia)
	res_tot <- GenClone(posidonia, coords = coord_posidonia)

	expect_equal(unlist(res_tot[1,1]), 40) #counts N
	expect_equal(unlist(res_tot[1,2]), "MLG") #detects no MLL
	expect_equal(unlist(res_tot[1,3]),  28) #MLG_list works
	expect_equal(unlist(res_tot[1,4]),  4.142857, tolerance  = 0.000001) #freq_all works
	expect_equal(unlist(res_tot[1,6]),  0.05076926, tolerance  = 0.0000001) #Fis works
	expect_equal(unlist(res_tot[1,8]),  0.02568129, tolerance  = 0.0000001) #double-test Fis
	expect_equal(unlist(res_tot[1,10]),  0.6923077) #clonal_index works
	expect_equal(unlist(res_tot[1,24]),  33.91304, tolerance  = 0.00001) #double-test clonal_index
	expect_equal(unlist(res_tot[1,11]),  1.180756, tolerance  = 0.0000001) #Pareto_index works
	expect_equal(unlist(res_tot[1,12]),  0.001230855, tolerance  = 0.0000001) #autocorrelation case 1 works
	expect_equal(unlist(res_tot[1,14]),  0.0012436, tolerance  = 0.00001) #autocorrelation case 2 works
	expect_equal(unlist(res_tot[1,16]),  0.0007693264) #autocorrelation case 3 works
	expect_equal(unlist(res_tot[1,18]),  0.0008031684) #autocorrelation case 4 works

})
