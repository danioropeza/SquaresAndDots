require "./lib/tablero"

describe Tablero do
    before (:each) do
        @tablero=Tablero.new()
        @tablero.inicializar()
    end

    it "deberia devolver vacio igual a  'true' cuando se crea el tablero " do
       expect(@tablero.vacio())==true
    end

    it "deberia marcar la posicion 1,3 lado derecho con 'true' cuando se envien las coordenadas '(1,3)' lado 'derecho'" do
        @tablero.marcar(1,3,"derecho")
        expect(@tablero.ver(1,3,"derecho"))==true
     end

   



end