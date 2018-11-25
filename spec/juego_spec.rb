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

    it "Deberia devolver 0 cuando el jugador no haya pintado ninguna casilla" do
        expect(@juego.contarCasillasJugador("#0000ff")).to eq 0
    end

    it "Deberia devolver '2' cuando el jugador haya pintado dos casilla" do
        @juego.jugada(1, 1, "superior") #jugador 1
        @juego.jugada(1, 1, "inferior") #jugador 1
        @juego.jugada(1, 1, "derecho") #jugador 1
        @juego.jugada(1, 1, "izquierdo") #jugador 1
        @juego.jugada(3, 3, "superior") #jugador 2
        @juego.jugada(3, 3, "inferior") #jugador 2
        @juego.jugada(3, 3, "derecho") #jugador 2
        @juego.jugada(3, 3, "izquierdo") #jugador 2
        expect(@juego.contarCasillasJugador("#00ff00")).to eq 2
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

    it "Deberia terminar el juego cuando todas las casillas esten pintadas" do
        for i in 1..5 do
            for j in 1..5 do
                @juego.jugada(i, j, "izquierdo")
                @juego.jugada(i, j, "derecho")
                @juego.jugada(i, j, "superior")
                @juego.jugada(i, j, "inferior")
            end
        end
        expect(@juego.terminoElJuego()).to eq true
    end

    # it "Deberia devolver el jugador con mayor puntaje" do
    #     expect(@juego.estaElTableroVacio()).to eq true
    # end
end
