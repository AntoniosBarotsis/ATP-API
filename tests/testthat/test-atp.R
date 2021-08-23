test_that("Health function given redis is NULL", {
  res <- list(
    server = "OK", 
    redis = "NOT DETECTED"
  )
  
  local_mock(getRedisClient <- function() NULL)
  expect_equal(health(), res)
})

test_that("Health function given redis isn't NULL", {
  expected <- list(
    server = "OK", 
    redis = "OK"
  )
  
  result <- with_mock(getRedisClient = function() "not NULL", {
    health()
  })

  expect_equal(result, expected)
})
