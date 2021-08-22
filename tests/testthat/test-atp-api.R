# Setup by starting APIs
root_path <- "http://localhost"

api <- callr::r_bg(
  function() {
    pr <- plumber::plumb(
      system.file("plumber", "plumber.R", package = "ATPAPI")
    )

    pr$run(port = 8000)
  }
)

test_that("API is alive", {
  expect_true(api$is_alive())
})

test_that("health endpoint works", {
  # Send API request
  r <- httr::GET(root_path, port = 8000, path = "health")

  # Check response
  expect_equal(r$status_code, 200)
})

Sys.sleep(5)

teardown({
  api$kill()
})