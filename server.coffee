http = require 'http'
ServerHandler = require './src/ServerHandler'

serverAddress = '127.0.0.1'
serverPort = 9876

http.createServer (request, response) ->
	serverHandler = new ServerHandler(request, response)
	serverHandler.processRequest()
.listen serverPort, serverAddress
console.log "Server listening at #{serverAddress}:#{serverPort}"