library(plumber)

port <- Sys.getenv('PORT')

if (port == "") {
  port <- 8080
}

server <- plumb("plumber.R")

players <- pr("players.R")
server %>% pr_mount("/players", players)

server$run(
	host = '0.0.0.0',
	port = as.numeric(port),
	docs = TRUE
)
