require "./lib/casilla"
require 'matrix'

        casilla1=Casilla.new()
        casilla1.pintar("green")
        casilla2=Casilla.new()
        casilla2.pintar("red")
        casilla3=Casilla.new()
        casilla3.pintar("black")
        casilla4=Casilla.new()


        tablero= Matrix[[casilla1,casilla4],[casilla3,casilla2]] 
      #  tablero.each do |i|
       #     i.mostrar()
         tablero.[](1, 1).mostrar()
        
