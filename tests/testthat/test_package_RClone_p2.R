context("Frequency-based Functions of RClone")

test_that("the freq_RR functions work", {

	data(posidonia)
	
	prev <- freq_RR_core(posidonia)
	expect_that(prev, is_a("data.frame"))
	expect_that(ncol(prev), equals(3))
	expect_that(nrow(prev), equals(29))
	
	res1 <- freq_RR(posidonia)
	res2 <- freq_RR(posidonia, genet = TRUE)
	res3 <- freq_RR(posidonia, RR = TRUE)
	res4 <- freq_finder(posidonia, 12, 3) #hidden function
	
	expect_that(res1, is_a("data.frame"))
	expect_that(res2, is_a("data.frame"))
	expect_that(res3, is_a("data.frame"))
	expect_that(ncol(res1), equals(3))
	expect_that(nrow(res2), equals(29))
	expect_that(names(res3)[2], equals("allele"))
	expect_equal(res1[25,3], 0.3875, tolerance  = 0.00001) #not the same as
	expect_equal(res2[25,3], 0.3035714, tolerance  = 0.0000001) #and not the same as
	expect_equal(res3[25,3], 0.28, tolerance  = 0.01)
	expect_equal(res4, 0.5, tolerance  = 0.01)

})


test_that("the Fis function works", {
	
	skip_on_cran()

	data(posidonia)
	
	prev <- Fis_core(posidonia, freq_RR(posidonia))
	expect_that(prev, is_a("data.frame"))
	expect_that(ncol(prev), equals(4))
	expect_that(nrow(prev), equals(7))
	
	res1 <- Fis(posidonia)
	res2 <- Fis(posidonia, genet = TRUE)
	res3 <- Fis(posidonia, RR = TRUE)
	
	expect_that(res1, is_a("data.frame"))
	expect_that(res2, is_a("data.frame"))
	expect_that(res3, is_a("list"))
	expect_that(ncol(res1), equals(4))
	expect_that(nrow(res2), equals(7))
	expect_that(nrow(res3[[1]]), equals(29))
	expect_equal(res1[3,4], -0.08001608, tolerance  = 0.000001) #is different from
	expect_equal(res2[3,4], -0.05854050, tolerance  = 0.000001) #and different from
	expect_equal(res3[[2]][3,4], -0.09217877, tolerance  = 0.000001)

})


test_that("the pgen functions work", {

	skip_on_cran()

	data(posidonia)
	
	prev1 <- pgen_core(posidonia, freq_RR(posidonia))
	prev2 <- pgen_Fis_core(posidonia, freq_RR(posidonia))

	expect_that(prev1, is_a("data.frame"))
	expect_that(prev2, is_a("data.frame"))
	expect_that(ncol(prev1), equals(1))
	expect_that(nrow(prev2), equals(40))
	
	res1 <- pgen(posidonia)
	res2 <- pgen(posidonia, genet = TRUE)
	res3 <- pgen(posidonia, RR = TRUE)
	
	res4 <- pgen_Fis(posidonia)
	res5 <- pgen_Fis(posidonia, genet = TRUE)
	res6 <- pgen_Fis(posidonia, RR = TRUE)
	
	expect_that(res1, is_a("data.frame"))
	expect_that(res2, is_a("data.frame"))
	expect_that(res3, is_a("data.frame"))
	expect_that(ncol(res1), equals(1))
	expect_that(nrow(res2), equals(40))
	expect_that(names(res3), equals("pgen"))
	expect_equal(res1[10,1], 1.019604e-07, tolerance  = 0.000001) #not the same as
	expect_equal(res2[10,1], 1.532336e-07, tolerance  = 0.000001) #and not the same as
	expect_equal(res3[10,1], 1.435306e-07, tolerance  = 0.000001)
	
	expect_that(res4, is_a("data.frame"))
	expect_that(res5, is_a("data.frame"))
	expect_that(res6, is_a("data.frame"))
	expect_that(ncol(res4), equals(1))
	expect_that(nrow(res5), equals(40))
	expect_that(names(res6), equals("pgenFis"))
	expect_equal(res4[20,1], 1.135513e-04, tolerance  = 0.000001) #not the same as
	expect_equal(res5[20,1], 2.816756e-05, tolerance  = 0.000001) #and not the same as
	expect_equal(res6[20,1], 2.429355e-05, tolerance  = 0.000001)

})


test_that("the psex functions work", {

	skip_on_cran()

	data(posidonia)
	
	prev1 <- psex_core(posidonia, freq_RR(posidonia))
	prev2 <- psex_Fis_core(posidonia, freq_RR(posidonia))

	expect_that(prev1, is_a("data.frame"))
	expect_that(prev2, is_a("data.frame"))
	expect_that(ncol(prev1), equals(2))
	expect_that(nrow(prev2), equals(40))
	
	res1 <- psex(posidonia)
	res2 <- psex(posidonia, genet = TRUE)
	res3 <- psex(posidonia, RR = TRUE)
	res4 <- psex(posidonia, MLGsim = TRUE)
	res5 <- psex(posidonia, MLGsim = TRUE, genet = TRUE)
	res6 <- psex(posidonia, MLGsim = TRUE, RR = TRUE)
	
	res7 <- psex_Fis(posidonia)
	res8 <- psex_Fis(posidonia, genet = TRUE)
	res9 <- psex_Fis(posidonia, RR = TRUE)
	res10 <- psex_Fis(posidonia, MLGsim = TRUE)
	res11 <- psex_Fis(posidonia, MLGsim = TRUE, genet = TRUE)
	res12 <- psex_Fis(posidonia, MLGsim = TRUE, RR = TRUE)
	
	expect_that(res1, is_a("data.frame"))
	expect_that(res2, is_a("data.frame"))
	expect_that(res3, is_a("data.frame"))
	expect_that(res4, is_a("data.frame"))
	expect_that(res5, is_a("data.frame"))
	expect_that(res6, is_a("data.frame"))
	expect_that(ncol(res1), equals(2))
	expect_that(nrow(res3), equals(40))
	expect_that(names(res6)[2], equals("psex"))
	expect_equal(as.numeric(res1[30,2]), 1.541887e-08, tolerance  = 0.000001)
	expect_equal(as.numeric(res2[30,2]), 4.748719e-10, tolerance  = 0.000000001)
	expect_equal(as.numeric(res3[30,2]), 6.087522e-10, tolerance  = 0.000000001)
	expect_equal(as.numeric(res4[15,2]), 5.636991e-09, tolerance  = 0.00000001)
	expect_equal(as.numeric(res5[15,2]), 2.202567e-09, tolerance  = 0.00000001)
	expect_equal(as.numeric(res6[15,2]), 1.233636e-09, tolerance  = 0.00000001)
		
	expect_that(res7, is_a("data.frame"))
	expect_that(res8, is_a("data.frame"))
	expect_that(res9, is_a("data.frame"))
	expect_that(res10, is_a("data.frame"))
	expect_that(res11, is_a("data.frame"))
	expect_that(res12, is_a("data.frame"))
	expect_that(ncol(res12), equals(2))
	expect_that(nrow(res9), equals(40))
	expect_that(names(res11)[2], equals("psexFis"))
	expect_equal(as.numeric(res7[24,2]), 0.01125068, tolerance  = 0.0001)
	expect_equal(as.numeric(res8[24,2]), 0.00255803, tolerance  = 0.00001)
	expect_equal(as.numeric(res9[24,2]), 0.002726396, tolerance  = 0.00001)
	expect_equal(as.numeric(res10[11,2]), 7.636209e-10, tolerance  = 0.000000001)
	expect_equal(as.numeric(res11[11,2]), 1.368126e-09, tolerance  = 0.00000001)
	expect_equal(as.numeric(res12[11,2]), 2.744004e-10, tolerance  = 0.000000001)
	
	#expect_that(psex(posidonia, nbrepeat = 1), gives_warning())
	#expect_that(psex_Fis(posidonia, nbrepeat = 1), gives_warning("No clone was found during Simulations."))
	expect_that(psex(posidonia, nbrepeat = 1), prints_text("Warning: Simulated populations contain few repeated genotypes and p-value estimations may be incorrect."))
	expect_that(psex_Fis(posidonia, nbrepeat = 1), throws_error())
	
})
