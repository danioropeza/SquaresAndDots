Feature: Ingresar tamanio
   Como jugador 
   quiero modificar el tamaño del tablero 
   para tener una partida mas interesante.

   Scenario: Ingresa tamanio
        Given visito la dimension tablero
        Then deberia poder ingresar el tamanio en el campo "dimension"
