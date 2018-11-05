Feature: Configurar jugador
    Como jugador 
    quiero ingresar mi nombre y seleccionar un color
    para identificarme en el juego y con mis oponentes

    Scenario: Ingreso nombre 
        Given visito la pagina configurar
        Then deberia poder ingresar mi nombre en el campo "nombre1"

    Scenario: Ingreso color 
        Given visito la pagina configurar
        Then deberia poder seleccionar un color en el campo "color1"

    Scenario: Boton confirmar
        Given visito la pagina configurar y  lleno la imformacion del jugador
        When presiono el boton de "Confirmar"
        Then deberia ver la pagina con el titulo "Juego"
        