Feature: Configurar jugador
    Como jugador 
    quiero ingresar mi nombre y seleccionar un color
    para identificarme en el juego y con mis oponentes

    Scenario: Ingreso nombre 
        Given visito la pagina configurar partida jugador
        Then deberia poder ingresar mi nombre en el campo "nombre"

    Scenario: Ingreso color 
        Given visito la pagina configurar partida jugador
        Then deberia poder seleccionar un color en el campo "color"

    Scenario: Boton confirmar
        Given visito la pagina configurar partida jugador
        When presiono el boton "Confirmar"
        Then deberia ver la pagina con el titulo "Juego"
        