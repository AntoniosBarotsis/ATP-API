test_that("getPlayers function with redis", {
  result <- with_mock(
    getAndSetPlayer = function(name) list(data = name, from_cache = TRUE),
    ensureCache = function() TRUE, {
      getPlayer("Tony")
    }
  )
  
  expect_true(result$from_cache)
})

test_that("getPlayers function without redis", {
  result <- with_mock(
    ensureCache = function() FALSE,
    setCache = function(key, value) {}, 
    ensureCache = function() FALSE, {
      getPlayer("Tony")
    }
  )
  
  expect_false(result$from_cache)
})


test_that("getAndSetPlayer function with redis hit", {
  name <- "Tony"
  
  result <- with_mock(
    getCache = function(key) "data",
    refreshExpire = function(key) "", {
      getAndSetPlayer(name)
    }
  )
  
  expect_true(result$from_cache)
  expect_equal("data", result$data)
})

test_that("getAndSetPlayer function with redis miss", {
  name <- "Tony"
  
  result <- with_mock(
    getCache = function(key) NULL, 
    setCache = function(key, value) {}, {
      getAndSetPlayer(name)
    }
  )
  
  expect_false(result$from_cache)
  expect_equal("data", result$data)
})
