require "./lib/tablero"

describe Tablero do
    before (:each) do
        @tablero=Tablero.new()
        @tablero.inicializar()
    end

    it "deberia devolver vacio igual a  'true' cuando se crea el tablero " do
       expect(@tablero.vacio()).to eq true
    end

    it "deberia marcar la posicion 1,3 lado derecho con 'true' cuando se envien las coordenadas '(1,3)' lado 'derecho'" do
        @tablero.marcar(1,3,"derecho")
        expect(@tablero.ver(1,3,"derecho")).to eq true

     end

     it "deberia marcar la posicion 1,3 lado izquierdo con 'true' cuando se envien las coordenadas '(1,3)' lado 'izquierdo'" do
        @tablero.marcar(1,3,"izquierdo")
        expect(@tablero.ver(1,3,"izquierdo")).to eq true
     end

     it "deberia marcar la posicion 1,3 lado superior con 'true' cuando se envien las coordenadas '(1,3)' lado 'superior'" do
        @tablero.marcar(1,3,"superior")
        expect(@tablero.ver(1,3,"superior")).to eq true
     end

     it "deberia marcar la posicion 1,3 lado inferior con 'true' cuando se envien las coordenadas '(1,3)' lado 'inferior'" do
        @tablero.marcar(1,3,"inferior")
        expect(@tablero.ver(1,3,"inferior")).to eq true
     end

     it "deberia marcar la posicion 2,3 lado derecho con true y su adyacente 3,3 lado izquierdo con 'true' cuando se envien las coordenadas '(1,3)' lado 'derecho'" do
        @tablero.marcar(2,3,"derecho")
        expect(@tablero.ver(3,3,"izquierdo")).to eq true 
     end
   
     it "deberia marcar la posicion 2,3 lado izquierdo con true y su adyacente 1,3 lado derecho con 'true' cuando se envien las coordenadas '(1,3)' lado 'izquierdo'" do
        @tablero.marcar(2,3,"izquierdo")
        expect(@tablero.ver(1,3,"derecho")).to eq true 
     end

     it "deberia marcar la posicion 2,3 lado superior con true y su adyacente 2,2 lado inferior con 'true' cuando se envien las coordenadas '(2,3)' lado 'superior'" do
        @tablero.marcar(2,3,"superior")
        expect(@tablero.ver(2,2,"inferior")).to eq true 
     end

     it "deberia marcar la posicion 2,3 lado inferior con true y su adyacente 2,4 lado superior con 'true' cuando se envien las coordenadas '(2,3)' lado 'inferior'" do
        @tablero.marcar(2,3,"inferior")
        expect(@tablero.ver(2,4,"superior")).to eq true 
     end
end