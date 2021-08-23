test_that("Health function given redis is NULL", {
  expected <- list(
    server = "OK", 
    redis = "NOT DETECTED"
  )
  
  result <- with_mock(getRedisClient = function() NULL, {
    health()
  })
  
  expect_equal(result, expected)
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