require "./lib/juego"
describe Juego do
    before (:each) do
        @juego=Juego.new()
        @jugador1= Jugador.new()
        @jugador1.ingresarNombre("Juan")
        @jugador1.ingresarColor("#0000ff")
        @jugador2= Jugador.new()
        @jugador2.ingresarNombre("Pepe")
        @jugador2.ingresarColor("#00ff00")
        @tamanio=5
        @juego.inicializar(@tamanio,@jugador1,@jugador2)
    end

    it "Deberia crear un tablero vacio al crear un juego nuevo." do
        expect(@juego.estaElTableroVacio()).to eq true
    end

    it "Deberia ser el turno del jugador1 al crear el juego.  " do
        expect(@juego.jugadorEnTurno()).to eq @jugador1
    end

    it "Deberia ser el turno del jugador2 despues de que el jugador 1 realice su primera jugada.  " do
        @juego.jugada(1,1, "derecho")
        expect(@juego.jugadorEnTurno()).to eq @jugador2
    end

    it "Deberia seguir siendo el turno del jugador2 despues de que realiza una jugada en una casilla marcada" do
        @juego.jugada(1,1, "derecho")
        @juego.jugada(1,1, "derecho")
        expect(@juego.jugadorEnTurno()).to eq @jugador2
    end

    it "Deberia seguir siendo el turno del jugador2 despues de que realiza una jugada en una casilla invalida que exceda el tamaño" do
        @juego.jugada(1,1, "derecho")
        @juego.jugada(1,9, "derecho")
        expect(@juego.jugadorEnTurno()).to eq @jugador2
    end


end
