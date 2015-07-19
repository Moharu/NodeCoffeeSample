class Game
  score: (arrayJogadas) ->
    soma = 0
    for jogada,i in arrayJogadas
      if i < 9
        if jogada.p1+jogada.p2 is 10
          soma += 10 + arrayJogadas[i+1].p1
          if jogada.p1 is 10
            if arrayJogadas[i+1].p1 is 10
              unless i is 8
                soma += arrayJogadas[i+2].p1
              else
                soma += arrayJogadas[i+1].p2
            else
              soma += arrayJogadas[i+1].p2
        else
          soma += jogada.p1 + jogada.p2
      else
        if jogada.p1 is 10
           soma += jogada.p1 + jogada.p2 + jogada.p3
        else if jogada.p1 + jogada.p2 is 10
           soma += 10 + jogada.p3
        else
           soma += jogada.p1 + jogada.p2
    soma
module.exports = Game

