expect = require 'expect.js'
jkpController = require '../src/jkpController'

describe 'the jkpController', ->

	describe 'post Method', ->

		instance = null
		defaultParams =
			query:
				play: 'rock'

		beforeEach ->
			instance = new jkpController
			instance.init()

		it 'should call game.play', ->
			gamePlayCalled = false
			instance.game =
				play: () ->
					gamePlayCalled = true

			instance.post defaultParams, ->
			expect(gamePlayCalled).to.eql true


