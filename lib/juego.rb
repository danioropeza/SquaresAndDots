require "./lib/tablero"
require "./lib/jugador"

class Juego
    def inicializar(tamanio,jugador1,jugador2)
        @tamanio=tamanio
        @tablero =Tablero.new()
        @tablero.inicializar(tamanio)
        @jugador1=Jugador.new()
        @jugador1=jugador1
        @jugador2=Jugador.new()
        @jugador2=jugador2

        @jugadorEnTurno=Jugador.new()
        @jugadorEnTurno=@jugador1
        @turno =1

    end

    def estaElTableroVacio()
        resultado=true
        if(!@tablero.esVacio())
            resultado=false
        end
        return resultado
    end

    def jugadorEnTurno()
        return @jugadorEnTurno
    end
    
    def jugada(x,y,direccion)
        
        @tablero.marcar(x,y,direccion, @jugadorEnTurno.color())
        @turno=@turno+1
        if(@turno%2!=0)
            @jugadorEnTurno=@jugador1
        else
            @jugadorEnTurno=@jugador2
        end
    end


    

end