#* Echo back the input
#* 
#* @param name The name of the player
#* @get /<name>
function(name) {
  list(msg = paste0("Hello ", name))
}