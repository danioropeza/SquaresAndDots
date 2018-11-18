Feature: Reiniciar partida
    Como jugador 
    quiero reiniciar mi partida actual 
    para iniciar de nuevo el mismo juego y tener más  posibilidades  de ganar.
    Scenario: Boton reiniciar
        Given visito la pagina jugar
        When presiono el boton "Reiniciar"
        Then mi puntaje deberia ser 0
    