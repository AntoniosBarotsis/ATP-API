library(plumber)
library(redux)
library(logging)

port <- Sys.getenv('PORT')

if (port == "") {
  logwarn("PORT env variable not found, defaulting to 8080")
  
  port <- 8080
}

server <- plumb("health.R")

players <- pr("players.R")
server %>% pr_mount("/players", players)

# Set r to NULL if no redis database is detected
r <- tryCatch(
  { redux::hiredis() }, 
  error = function(e) {
    logerror("Connection to Redis Database failed")
    
    
    NULL
  }
)

server$run(
	host = '0.0.0.0',
	port = as.numeric(port),
	docs = TRUE
)
