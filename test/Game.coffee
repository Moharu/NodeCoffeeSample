expect = require "expect.js"
Game = require "../src/Game"

describe 'game', ->

  instance = null

  describe 'method score', ->

    beforeEach ->

      instance = new Game

    it 'should return the score', ->

      expectedReturn = 132
      plays = []
      for n in [1..10]
        jogada =
          p1: 3
          p2: 7
        if n is 10
          jogada.p3 = 5
        plays.push jogada

      value = instance.score plays

      expect(value).to.eql expectedReturn

    it 'should return the perfect score', ->

      expectedReturn = 300
      plays = []
      for n in [1..10]
        if n is 10
          jogada =
            p1: 10
            p2: 10
            p3: 10
        else
          jogada =
            p1: 10
            p2: 0
        plays.push jogada

      value = instance.score plays

      expect(value).to.eql expectedReturn

    it 'should return the worst score', ->

      expectedReturn = 0
      plays = []
      for n in [1..10]
        jogada =
          p1: 0
          p2: 0
        plays.push jogada

      value = instance.score plays

      expect(value).to.eql expectedReturn

    it 'should return the normal score', ->

      expectedReturn = 119
      plays = [
        {p1:3,p2:5},
        {p1:7,p2:3},
        {p1:1,p2:7},
        {p1:4,p2:6},
        {p1:3,p2:6},
        {p1:8,p2:2},
        {p1:10,p2:0},
        {p1:3,p2:5},
        {p1:8,p2:2},
        {p1:6,p2:2}
      ]

      value = instance.score plays

      expect(value).to.eql expectedReturn