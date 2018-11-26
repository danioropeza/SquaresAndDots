Feature: Realizar jugada
    Como jugador 
    quiero realizar una jugada 
    para poder tener más oportunidades de ganar la partida 

    
    Scenario: Coordenada x 
        Given visito la pagina jugar
        Then deberia poder ingresar la columna de mi jugada en el campo "x"
    
    Scenario: Coordenada y 
        Given visito la pagina jugar
        Then deberia poder ingresar la fila de mi jugada en el campo "y"
    
    Scenario: Direccion 
        Given visito la pagina jugar
        Then deberia poder ingresar la direccion de mi jugada en el campo "direccion"

    Scenario: Jugada
        Given visito la pagina jugar
        When introduzco las coordenadas "x", "y" y "direccion" de la jugada 
        And presiono el boton "Jugada"
        Then se debe seguir en la misma pagina de "Juego" con el tablero actualizado.
