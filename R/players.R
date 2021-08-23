#* Echo back the input
#* 
#* @param name The name of the player
#* @get /<name>
getPlayer <- function(name) {
  res <- getAndSetPlayer(name)
  
  res
}

getAndSetPlayer <- function(name) {
  r <- getRedisClient()

  # No redis db detected
  if (is.null(r)) {
    return(NULL)
  }

  res <- getCache(paste0("player::", name))
  
  # Cache Miss
  if (is.null(res)) {
    # Scrape the data here
    
    
    setCache(paste0("player::", name), name)
    
    return(list(data = name, from_cache = FALSE))
  } 

  return(list(data = name, from_cache = TRUE))
}