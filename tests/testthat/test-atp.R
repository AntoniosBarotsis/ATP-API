test_that("API is alive", {
  res <- list(
    server = "OK", 
    redis = "NOT DETECTED"
  )
  
  expect_equal(health(), res)
})