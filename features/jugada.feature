Feature: Realizar jugada
    Como jugador 
    quiero realizar una jugada 
    para poder tener más oportunidades de ganar la partida 

    Scenario: Dibujar linea
        Given visito la pagina jugar
        When introduzco las coordenadas y direccion de la jugada 
        And presiono el boton "Jugada"
        Then en el tablero debe mostrarse la nuevo jugada