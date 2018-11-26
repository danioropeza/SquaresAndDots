Feature: Mostrar jugador
    Como jugador 
    quiero ver el nombre del jugador actual y el color
    para saber si es mi turno

    Scenario: Mostrar nombre
        Given visito la pagina jugar
        Then deberia ver mi nombre "John"

     Scenario: Mostrar color
        Given visito la pagina jugar
        Then deberia ver mi nombre pintado de color "#0000ff"