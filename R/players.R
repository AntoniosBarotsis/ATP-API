#* Echo back the input
#* 
#* @param name The name of the player
#* @get /<name>
function(name) {
  res <- getAndSetPlayer(name)
  
  if (is.null(res)) {
    list(msg = paste0("Hello ", "(scraped data)", " [FROM SITE]"))
  } else {
    list(msg = paste0("Hello ", res, " [FROM CACHE]"))
  }
}

getAndSetPlayer <- function(name) {
  # No redis db detected
  if (is.null(r)) {
    return(NULL)
  }

  res <- r$GET(paste0("player::", name))
  
  # Cache Miss
  if (is.null(res)) {
    r$command(c("SET", paste0("player::", name), "foo", "EX", 60))
    
    return(NULL)
  } 

  return(res)
}