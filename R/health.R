#* Basic health diagnostics
#* 
#* @get /health
function() {
  redis_status <- "NOT DETECTED"
  
  if (!is.null(r)) {
    redis_status <- "OK"
  }
  
  list(
    server = "OK", 
    redis = redis_status
  )
}