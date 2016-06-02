#testing Randy Zwitch solution

library(testthat)
library(RClone)
test_check("RClone", filter = "p1")
print("Basic Functions of RClone are ok")
