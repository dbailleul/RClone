context("Genetic Distance Functions of RClone")

test_that("the genet_dist functions work", {

	data(posidonia)
	
	prev1 <- genet_dist_core(posidonia)
	prev2 <- genet_dist_sim_core(posidonia, nbrepeat = 10)
	
	expect_that(prev1[[1]], is_a("dist"))
	expect_that(prev2[[1]], is_a("dist"))
	expect_equal(length(prev1[[1]]), 378)
	expect_equal(length(prev2[[1]]), 45)
		
	res1 <- genet_dist(posidonia)
	res2 <- genet_dist(posidonia, manh = TRUE)
	res3 <- genet_dist(posidonia, manh_w = TRUE)
	
	expect_that(res1[[1]], is_a("dist"))
	expect_that(res2[[1]], is_a("dist"))
	expect_that(res3[[1]], is_a("dist"))
	expect_equal(res1[[1]][236], 12)
	expect_equal(res2[[1]][236], 58)
	expect_equal(res3[[1]][236], 8.285714, tolerance = 0.00001)
	
	res4 <- genet_dist(posidonia, alpha1 = 0.05)
	res5 <- genet_dist(posidonia, alpha2 = 1)
	
	expect_that(res4, is_a("list"))
	expect_that(res5, is_a("list"))
	expect_equal(length(res4), 4)
	expect_equal(length(res5), 4)
	expect_equal(res4[[4]], 3)
	expect_equal(res5[[4]], 1)
	
	res6 <- genet_dist_sim(posidonia, nbrepeat = 10)
	res7 <- genet_dist_sim(posidonia, manh = TRUE, nbrepeat = 10)
	res8 <- genet_dist_sim(posidonia, manh_w = TRUE, nbrepeat = 10)
	
	expect_that(res6[[1]], is_a("dist"))
	expect_that(res7[[1]], is_a("dist"))
	expect_that(res8[[1]], is_a("dist"))
	
})


test_that("the MLL functions work", {

	skip_on_cran()

	data(posidonia)
	
	prev1 <- MLL_generator_core(posidonia, alpha2 = 1)
	prev2 <- MLL_generator2_core(genet_dist(posidonia, alpha1 = 0.05)[[2]], MLG_list(posidonia))
	
	expect_that(prev1, is_a("list"))
	expect_that(prev2, is_a("list"))
	expect_equal(length(prev1), 23)
	expect_equal(length(prev2), 13)
	
	res1 <- MLL_generator(posidonia, alpha1 = 0.05)
	res2 <- MLL_generator(posidonia, alpha2 = 1)
	
	expect_that(res1, is_a("list"))
	expect_that(res2, is_a("list"))
	expect_equal(length(res1), 13)
	expect_equal(length(res2), 23)
	
	res3 <- MLL_generator2(genet_dist(posidonia, alpha2 = 1)[[2]], MLG_list(posidonia))
	
	expect_that(res3, is_a("list"))
	expect_equal(length(res3), 23)
	
})	
