Feature: Jugador1
    Como primer jugador 
    quiero ingresar mi nombre y elegir un color 
    para sentirme identificado en el juego

   
    Scenario: Ingreso de nombre 
        Given visito la pagina primer jugador
        Then deberia poder ingresar mi nombre en el campo "nombre"

    Scenario: Seleccion de color 
        Given visito la pagina primer jugador
        Then deberia poder seleccionar un color en el campo "color"

    Scenario: Boton de confirmación
        Given visito la pagina primer jugador
        When introuduzco mis datos
        And presiono el boton  "Ok"
        Then deberia ver la pagina con el titulo "Jugador 2"