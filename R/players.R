#* Echo back the input
#* 
#* @param name The name of the player
#* @get /<name>
getPlayer <- function(name) {
  # Cache does not exist
  if (!ensureCache()) {
    # Scrape here and set
    
    setCache(paste0("player::", name), name)
    
    return(list(data = "data", from_cache = FALSE))
  } 

  res <- getAndSetPlayer(name)
  
  res
}

# Attempts to get the value from the cache.
# In case of a miss, it sets the value
getAndSetPlayer <- function(name) {
  res <- getCache(paste0("player::", name))
  
  # Cache Miss
  if (is.null(res)) {
    # Scrape the data here
    
    
    setCache(paste0("player::", name), name)
    
    return(list(data = "data", from_cache = FALSE))
  } else {
    # Cache hit, refresh expire
    refreshExpire(paste0("player::", name))
  }

  return(list(data = "data", from_cache = TRUE))
}