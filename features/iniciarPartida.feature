Feature: Iniciar partida
    Como jugador 
    quiero iniciar una partida 
    para divertirme y entretenerme

    Scenario: Nombre del juego
        Given visito la pagina principal
        Then deberia ver el nombre del juego "Cuadrados y puntos"
    Scenario: Logo
        Given visito la pagina principal
        Then deberia ver el logo del juego "logoApp"
    Scenario: Boton de inicio
        Given visito la pagina principal
        When presiono el boton "Iniciar"
        Then deberia ver la pagina de configurar partida con el titulo "Configurar partida"
        