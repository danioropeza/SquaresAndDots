Feature: Reiniciar partida
    Como jugador 
    quiero reiniciar mi partida actual
    para iniciar un nuevo el mismo juego y tener mas posibilidades de ganar
   
    Scenario: Boton reiniciar
        Given visito la pagina jugar
        When presiono el boton "Reiniciar"
        Then el puntaje deberia ser 0