require "./lib/juego"
describe Juego do
    before (:each) do
        @jugador1 = Jugador.new("Juan", "#0000ff")
        @jugador2 = Jugador.new("Pepe", "#00ff00")
        @tamanio = 5
        @juego = Juego.new(@tamanio,"Juan","Pepe", "#0000ff", "#00ff00")
    end

    it "Deberia crear un tablero vacio al crear un juego nuevo." do
        expect(@juego.estaElTableroVacio()).to eq true
    end

    it "Deberia ser el turno del jugador1 al crear el juego." do
        expect(@juego.jugadorEnTurnoNombre()).to eq @jugador1.nombre()
        expect(@juego.jugadorEnTurnoColor()).to eq @jugador1.color()
    end

    it "Deberia ser el turno del jugador2 despues de que el jugador 1 realice su primera jugada.  " do
        @juego.jugada(1,1, "derecho")
        expect(@juego.jugadorEnTurnoNombre()).to eq @jugador2.nombre()
        expect(@juego.jugadorEnTurnoColor()).to eq @jugador2.color()
    end

    it "DTest" do
        @juego.jugada(1,1, "derecho")
        expect(@juego.jugadorEnTurnoNombre()).to eq @jugador2.nombre()
        expect(@juego.jugadorEnTurnoColor()).to eq @jugador2.color()
    end

    it "Deberia seguir siendo el turno del jugador2 despues de que realiza una jugada en una casilla marcada" do
        @juego.jugada(1,1, "derecho")
        @juego.jugada(1,1, "derecho")
        expect(@juego.jugadorEnTurnoNombre()).to eq @jugador2.nombre()
        expect(@juego.jugadorEnTurnoColor()).to eq @jugador2.color()
    end

    it "Deberia seguir siendo el turno del jugador2 despues de que realiza una jugada en una casilla invalida que exceda el tamaño" do
        @juego.jugada(1,1, "derecho")
        @juego.jugada(1,9, "derecho")
        expect(@juego.jugadorEnTurnoNombre()).to eq @jugador2.nombre()
        expect(@juego.jugadorEnTurnoColor()).to eq @jugador2.color()
    end

    it "Deberia estar el tablero vacio despues de reinicar la partida" do
        @juego.jugada(1,1, "derecho")
        @juego.jugada(1,9, "derecho")
        @juego.reiniciarPartida()
        expect(@juego.estaElTableroVacio()).to eq true
    end


end
