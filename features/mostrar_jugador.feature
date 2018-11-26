Feature: Mostrar jugador
    Como jugador 
    quiero ver el nombre y puntaje del jugador
    para saber cómo va la partida

    Scenario: Mostrar nombre 
        Given visito la pagina jugar
        Then deberia ver mi nombre "John"

    Scenario: Mostrar puntaje
        Given visito la pagina jugar
        Then deberia ver mi puntaje actual "0"
    