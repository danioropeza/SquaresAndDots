require 'matrix'
class Tablero

    def inicializar()
        casilla1=Casilla.new()
        casilla1.inicializar()
        casilla2=Casilla.new()
        casilla2.inicializar()
        casilla3=Casilla.new()
        casilla3.inicializar()
        casilla4=Casilla.new()
        casilla4.inicializar()
        casilla5=Casilla.new()
        casilla5.inicializar()
        casilla6=Casilla.new()
        casilla6.inicializar()
        casilla7=Casilla.new()
        casilla7.inicializar()
        casilla8=Casilla.new()
        casilla8.inicializar()
        casilla9=Casilla.new()
        casilla9.inicializar()
        casilla10=Casilla.new()
        casilla10.inicializar()
        casilla11=Casilla.new()
        casilla11.inicializar()
        casilla12=Casilla.new()
        casilla12.inicializar()
        casilla13=Casilla.new()
        casilla13.inicializar()
        casilla14=Casilla.new()
        casilla14.inicializar()
        casilla15=Casilla.new()
        casilla15.inicializar()
        casilla16=Casilla.new()
        casilla16.inicializar()
        casilla17=Casilla.new()
        casilla17.inicializar()
        casilla18=Casilla.new()
        casilla18.inicializar()
        casilla19=Casilla.new()
        casilla19.inicializar()
        casilla20=Casilla.new()
        casilla20.inicializar()
        casilla21=Casilla.new()
        casilla21.inicializar()
        casilla22=Casilla.new()
        casilla22.inicializar()
        casilla23=Casilla.new()
        casilla23.inicializar()
        casilla24=Casilla.new()
        casilla24.inicializar()
        casilla25=Casilla.new()
        casilla25.inicializar()


        @tablero= Matrix[[casilla1,casilla2,casilla3,casilla4,casilla5],
        [casilla6,casilla7,casilla8,casilla9,casilla10],
        [casilla11,casilla12,casilla13,casilla14,casilla15],
        [casilla16,casilla17,casilla18,casilla19,casilla20],
        [casilla21,casilla22,casilla23,casilla24,casilla25]]
        @tamanio=4
    end

    def vacio()
        @tablero.each do |i|
            if(i.esCasillaNula()==false)
                return false
            end
        end
        return true
    end

    def marcar(x,y,lado)
        x=x-1
        y=y-1

        case lado
        when "derecho"
            @tablero[x, y]. marcarDerecho()
            if(x!=@tamanio)
                @tablero[x+1, y]. marcarIzquierdo()
            end
        when "izquierdo"
            @tablero[x, y]. marcarIzquierdo()            
            if(x!=0)
                @tablero[x-1, y]. marcarDerecho()
            end
        when "superior"
            @tablero[x, y]. marcarSuperior()
            if(y!=0)
                @tablero[x, y-1]. marcarInferior()
            end
        when "inferior"
            @tablero[x, y]. marcarInferior()
            if(y!=@tamanio)
                @tablero[x, y+1]. marcarSuperior()
            end
        end
    end

    def ver(x,y,lado)
        x=x-1
        y=y-1

        case lado
        when "derecho"
            return @tablero[x, y]. derecho()
        when "izquierdo"
            return @tablero[x, y]. izquierdo()            
        when "superior"
            return @tablero[x, y]. superior()
        when "inferior"
            return @tablero[x, y]. inferior()
        end
    end

    #si esta en la fila 1 y esta arriba no marca dos casillas
    #si esta en la ultima fila y esta abajo no marca dos casillas
    #si esta en la primera columna y es lado izquierdo no marca dos casillas
    #si esta en la ultima columna y es lado derecho no marca dos casillas
    #si no cumple alguno de estos 4 casos marca dos casillas



end