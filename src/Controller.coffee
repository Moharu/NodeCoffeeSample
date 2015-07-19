Game = require './Game'

class Controller
  constructor : ->
    @game = new Game
    @response =
      body: ''
      statusCode: 200
  post : (request) ->
    # Quebra as jogadas
    retorno = @_toArray request.query.game

    @response.body = @game.score retorno
    return @response

  _toArray : (str) ->
    arrayJogadas = []
    str = str.split ','
    for n in str
      temp = n.split ';'
      #Objeto com jogadas
      Jogada =
        p1: Number temp[0]
        p2: Number temp[1]
      if temp.length > 2
        Jogada.p3 = Number temp[2]
      arrayJogadas.push Jogada
    return arrayJogadas
module.exports = Controller