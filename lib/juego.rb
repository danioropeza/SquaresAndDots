require "./lib/tablero"
require "./lib/jugador"

class Juego
    attr_accessor :tamanio, :nombre1, :nombre2, :color1, :color2
    def initialize(tamanio = nil, nombre1 = nil, nombre2 = nil, color1 = nil, color2 = nil)
        @tamanio = tamanio unless tamanio.nil?
        @tablero = Tablero.new(tamanio) unless tamanio.nil? 
        @jugador1 = Jugador.new(nombre1, color1) unless nombre1.nil?
        @jugador2 = Jugador.new(nombre2, color2) unless nombre2.nil?
        @jugadorEnTurno = Jugador.new(nombre1, color1) unless nombre1.nil?
        @turno = 1
    end

    def estaElTableroVacio()
        resultado=true
        if(!@tablero.esVacio())
            resultado=false
        end
        return resultado
    end

    def jugadorEnTurnoNombre()
        return @jugadorEnTurno.nombre()
    end
    
    def jugadorEnTurnoColor()
        return @jugadorEnTurno.color()
    end

    def coordenadasValidas(x,y)
       resultado=false
        if(x>0 && x<=@tamanio && y>0 && y<=@tamanio)
            resultado=true
        end
        return resultado
    end

    def jugada(x,y,direccion)
        if(coordenadasValidas(x,y))
            if (!@tablero.verLadoDeLaCasilla(x, y, direccion) )
                @tablero.marcar(x,y,direccion, @jugadorEnTurno.color())
                @turno = @turno+1
                if(@turno%2!=0)
                    @jugadorEnTurno = @jugador1
                else
                    @jugadorEnTurno = @jugador2
                end
            end
        end
    end

    def reiniciarPartida()
        @tablero.reiniciarTablero()
    end

    def ingresarTamano(tamanio)
        @tamanio = Tablero.new(tamanio)
    end
    def ingresarJugador1(nombre1, color1)
        @jugador1 = Jugador.new(nombre1, color1)
        @jugadorEnTurno = @jugador1
    end
    def ingresarJugador2(nombre2, color2)
        @jugador2 = Jugador.new(nombre2, color2)
    end
    def ingresarColor1(color1)
        @color1 = color1
    end
    def ingresarColor2(color2)
        @color2 = color2
    end
   
    def jugador1()
        return @jugador1
    end
    def jugador2()
        return @jugador2
    end

    def ingresarJugador1(nombre1, color1)
        @jugador1 = Jugador.new(nombre1, color1)
        @jugadorEnTurno = @jugador1
    end
    def ingresarJugador2(nombre2, color2)
        @jugador2 = Jugador.new(nombre2, color2)
    end
    def ingresarJugadorEnTurno(jugador)
        @jugadorEnTurno = jugador
    end
end