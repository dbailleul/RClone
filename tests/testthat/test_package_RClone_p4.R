context("Indices of RClone")

test_that("the clonal_index function works", {

	skip_on_cran()

	data(posidonia)
	
	prev <- clonal_index_core(posidonia)
	expect_that(prev, is_a("data.frame"))
	expect_equal(ncol(prev), 8)
	expect_equal(nrow(prev), 1)
	
	res <- clonal_index(posidonia)
	expect_that(res, is_a("data.frame"))
	expect_equal(ncol(res), 8)
	expect_equal(nrow(res), 1)
	expect_equal(res[1,8], 33.91304, tolerance = 0.0001)
	
})


test_that("the Pareto_index function works", {
	
	skip_on_cran()

	data(posidonia)
	
	prev <- Pareto_index_core(posidonia)
	expect_that(prev, is_a("list"))
	expect_equal(length(prev), 3)
	
	res1 <- Pareto_index(posidonia)
	res2 <- Pareto_index(posidonia, full = TRUE)
	expect_that(res1, is_a("list"))
	expect_that(res2, is_a("list"))
	expect_that(res1[[3]], is_a("matrix"))
	expect_equal(length(res1), 3)
	expect_equal(length(res2), 4)
	expect_equal(ncol(res1[[3]]), 4)
	expect_equal(ncol(res2[[4]]), 2)
	expect_equal(res1[[1]], 1.180756, tolerance = 0.00001)
	expect_equal(res2[[2]], 2.180756, tolerance = 0.00001)
		
})
