Feature: Ingresar tamanio
   Como jugador 
   quiero modificar el tamaño del tablero 
   para tener una partida mas interesante.

   Scenario: Ingresa tamanio
        Given visito la dimension tablero
        When ingreso los la dimension en el campo "dimension"
        And presiono el boton "Ok"
        Then deberia poder ver el titulo "Juego"
