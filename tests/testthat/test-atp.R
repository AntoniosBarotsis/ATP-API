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


test_that("getPlayers function with redis", {
  result <- with_mock(getAndSetPlayer = function(name) list(data = name, from_cache = TRUE), {
    getPlayer("Tony")
  })
  
  expect_true(result$from_cache)
})

test_that("getPlayers function with redis", {
  result <- with_mock(getAndSetPlayer = function(name) list(data = name, from_cache = FALSE), {
    getPlayer("Tony")
  })
  
  expect_false(result$from_cache)
})
