url = require 'url'
Controller = require './Controller'

class ServerHandler

	constructor: (@request, @response) ->

	processRequest: () ->
		requestOptions = url.parse @request.url, true
		@invokeController requestOptions

	invokeController: (requestOptions) ->
		instance = new Controller
		requestMethod = @request.method.toLowerCase()

		if typeof instance[requestMethod] is 'function'
			response = instance[requestMethod] requestOptions
			statusCode = response?.statusCode || 200
			body = String(response?.body) || ''

			@response.writeHead statusCode
			@response.end body
		else
			@response.writeHead 404
			@response.end 'MethodNotFound'

module.exports = ServerHandler