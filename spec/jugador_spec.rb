require "./lib/jugador"
describe Jugador do
    
    before (:each) do
        @jugador=Jugador.new()
    end

    it "Deberia devolver 'Ignacio' cuando el nombre del jugador es 'Ignacio'" do
        @jugador.ingresarNombre("Ignacio") 
        expect(@jugador.nombre()).to eq "Ignacio"
    end

    it "Deberia devolver 'Azul' cuando el color seleccionado es 'Azul'" do
        @jugador.ingresarColor("Azul") 
        expect(@jugador.color()).to eq "Azul"
    end
    
end