#testing Randy Zwitch solution

library(testthat)
library(RClone)
test_check("RClone", filter = "p6")
print("unit tests p6 are ok !")
