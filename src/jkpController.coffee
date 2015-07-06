class jkpController

	init: () ->
		@game = require './JanKenPon'
		@response =
			body: ''
			statusCode: 200

	post: (options, requestCallback) ->
		yourPlay = options.query.play
		@game.play yourPlay, (gameResult) ->
			@response.body = gameResult
			requestCallback @response

module.exports = jkpController