Feature: Puntaje final
    Como jugador 
    quiero ver el puntaje final al finalizar partida 
    para saber quien gano

    Scenario: Mensaje ganador del juego
        Given visito la pagina resultado
        Then muestro mensaje "Gano el jugador" "John"