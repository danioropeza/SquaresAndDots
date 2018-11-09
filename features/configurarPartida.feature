Feature: Configurar Partida cantidad jugadores
    Como jugador 
    quiero seleccionar la cantidad de jugadores 
    para definir contra cuantas personas sera la partida

    Scenario: Cantidad de jugadores
        Given visito la pagina configurar
        Then deberia ver una ventana con opciones para elegir la cantidad de jugadores llamada "Cantidadjugadores"
    
   

    Scenario: Boton confirmar 2 jugadores
        Given visito la pagina configurar y selecciono la opcion "2" jugadores de la ventana "Cantidadjugadores"
        When presiono el boton "Ok"
        Then deberia poder escribir en los campos "nombre1" y "nombre2"