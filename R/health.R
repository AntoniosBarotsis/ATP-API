#* Basic health diagnostics
#* 
#* @get /health
health <- function() {
  redis_status <- "NOT DETECTED"
  
  if (!is.null(getRedisClient())) {
    redis_status <- "OK"
  }
  
  list(
    server = "OK", 
    redis = redis_status
  )
}