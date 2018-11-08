require "./lib/casilla"
require 'matrix'


casilla=Casilla.new()
casilla.inicializar()
casilla0=Casilla.new()
casilla0.inicializar()

@tablero= Matrix[[casilla0,casilla,casilla,casilla,casilla],
[casilla,casilla,casilla,casilla,casilla],
[casilla,casilla,casilla,casilla,casilla],
[casilla,casilla,casilla,casilla,casilla],
[casilla,casilla,casilla,casilla0,casilla],
[casilla,casilla,casilla,casilla,casilla]]        

@tablero.each do |i|
    #i.marcarInferior()
    puts i.inferior()
end



@tablero[0,0]. marcarInferior()
puts "hola"
puts @tablero[0,0].inferior()
puts @tablero[2,2].inferior()



#puts casilla0.inferi
