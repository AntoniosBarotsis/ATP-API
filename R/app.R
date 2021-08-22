library(plumber)
library(redux)

port <- Sys.getenv('PORT')

if (port == "") {
  port <- 8080
}

server <- plumb("plumber.R")

players <- pr("players.R")
server %>% pr_mount("/players", players)

# Set r to NULL if no redis database is detected
r <- tryCatch(
  { redux::hiredis() }, 
  error = function(e) NULL
)

server$run(
	host = '0.0.0.0',
	port = as.numeric(port),
	docs = TRUE
)
