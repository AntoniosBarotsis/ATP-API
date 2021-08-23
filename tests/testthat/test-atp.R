test_that("Health function works", {
  res <- list(
    server = "OK", 
    redis = "NOT DETECTED"
  )
  
  expect_equal(health(), res)
})