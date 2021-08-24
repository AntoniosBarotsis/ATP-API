library(plumber)
library(redux)
library(logging)

port <- Sys.getenv('PORT')

if (port == "") {
  logwarn("PORT env variable not found, defaulting to 8080")
  
  port <- 8080
}

server <- plumb("R/health.R")

players <- pr("R/players.R")
server %>% pr_mount("/players", players)

# Set r to NULL if no redis database is detected
r <- tryCatch(
  { redux::hiredis() }, 
  error = function(e) {
    logerror("Connection to Redis Database failed")
    
    
    NULL
  }
)

# Use this when referencing the redis client to help with testing
getRedisClient <- function() {
  r
}

# Returns true if the redis client is not null
ensureCache <- function() {
  !is.null(getRedisClient())
}

# Returns the requested value from the cache
getCache <- function(key) {
  r$GET(key)
}

# Sets a key-value pair in the cache
setCache <- function(key, value, expireSeconds = 60) {
  r$command(c("SET", key, value, "EX", expireSeconds))
}

refreshExpire <- function(key, expireSeconds = 60) {
  r$EXPIRE(key, expireSeconds)
}


loginfo(paste0("ENV = \"", Sys.getenv('ENV'), "\""))

if (Sys.getenv('ENV') == "PROD") {
  loginfo("Starting server...")
  
  server$run(
    host = '0.0.0.0',
    port = as.numeric(port)
  )
}
