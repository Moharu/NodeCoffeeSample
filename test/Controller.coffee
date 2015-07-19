expect = require "expect.js"
Controller = require "../src/Controller"

describe 'controller', ->

  instance = null

  describe 'method post', ->

    beforeEach ->

      instance = new Controller

    it 'should call score with the right parameter', ->
      expectedPlays = []
      receivedString = "3;7,3;7,3;7,3;7,3;7,3;7,3;7,3;7,3;7,3;7;5"

      for n in [1..10]
        jogada =
          p1: 3
          p2: 7
        if n is 10
          jogada.p3 = 5
        expectedPlays.push jogada

      request =
        query:
          game: receivedString

      scoreWasCalled = false
      instance.game =
        score : (plays) ->
          scoreWasCalled = true
          expect(plays).to.eql expectedPlays
      instance.post request

      expect(scoreWasCalled).to.eql true

    it 'should return the score passed by', ->
      expectedValue = 105

      request =
        query:
          game: ''

      instance.game =
        score :  ->
          expectedValue

      valueReturned = instance.post request

      expect(valueReturned.body).to.eql expectedValue
      expect(valueReturned.statusCode).to.eql 200
