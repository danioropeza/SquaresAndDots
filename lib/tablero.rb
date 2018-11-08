require 'matrix'
class Tablero

    def inicializar()
        casilla=Casilla.new()
        casilla.inicializar()

        @tablero= Matrix[[casilla,casilla,casilla,casilla,casilla],[casilla,casilla,casilla,casilla,casilla],[casilla,casilla,casilla,casilla,casilla],[casilla,casilla,casilla,casilla,casilla],[casilla,casilla,casilla,casilla,casilla],[casilla,casilla,casilla,casilla,casilla]]        
    end

    def vacio()
        @tablero.each do |i|
            if(i.nula()==false)
                return false
            end
        end
        return true
    end

    def marcar(x,y,lado)
        case lado
        when "derecho"
            @tablero.[](x, y). marcarDerecho()
        when "izquierdo"
            @tablero.[](x, y). marcarIzquierdo()            
        when "superior"
            @tablero.[](x, y). marcarSuperior()
        when "inferior"
            @tablero.[](x, y). marcarInferior()
        end
    end

    def ver(x,y,lado)
        case lado
        when "derecho"
            return @tablero.[](x, y). derecho()
        when "izquierdo"
            return @tablero.[](x, y). izquierdo()            
        when "superior"
            return @tablero.[](x, y). superior()
        when "inferior"
            return @tablero.[](x, y). inferior()
        end
    end
#    expect(@tablero.ver(1,3,"derecho")

    #si esta en la fila 1 y esta arriba no marca dos casillas
    #si esta en la ultima fila y esta abajo no marca dos casillas
    #si esta en la primera columna y es lado izquierdo no marca dos casillas
    #si esta en la ultima fila y es lado derecho no marca dos casillas
    #si no cumple alguno de estos 4 casos marca dos casillas



end