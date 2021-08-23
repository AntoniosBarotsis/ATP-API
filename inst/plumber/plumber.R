library(plumber)

#* Basic health diagnostics
#* 
#* @get /health
ATPAPI:::health

#* Echo back the input
#* 
#* @param name The name of the player
#* @get /<name>
ATPAPI:::getPlayer