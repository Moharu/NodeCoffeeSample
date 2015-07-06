url = require 'url'
jkpController = require './jkpController'

class ServerHandler

	constructor: (@request, @response) ->

	processRequest: () ->
		requestOptions = url.parse @request.url, true
		@invokeController requestOptions

	invokeController: (requestOptions) ->
		instance = new jkpController
		requestMethod = @request.method.toLowerCase()

		if typeof instance[requestMethod] is 'function'
			instance[requestMethod] requestOptions, (response) =>

				statusCode = response?.statusCode || 200
				body = response?.body || ''

				@response.writeHead statusCode
				@response.end body
		else
			@response.writeHead 404
			@response.end 'MethodNotFound'

module.exports = ServerHandler