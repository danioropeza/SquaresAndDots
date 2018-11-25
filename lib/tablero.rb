require 'matrix'
require "./lib/casilla"

class Tablero
    attr_accessor :tamano
    def initialize(tamano = nil)
        if tamano != nil
            casillas = Array.new(tamano){Array.new(tamano){Casilla.new()}}
            @tablero = Matrix[*casillas]
            @tamanio = tamano - 1
        end
    end

    def ingresarTamano(tamano)
        casillas = Array.new(tamano){Array.new(tamano){Casilla.new()}}
        @tablero = Matrix[*casillas]
        @tamanio = tamano - 1
    end

    def esVacio()
        resultado = true
        @tablero.each do |i|
            if(!i.esCasillaNula())
                resultado = false
                break
            end
        end
        return resultado
    end

    def esLleno()
        resultado = true
        @tablero.each do |i|
            if(!i.esCasillaPintada())
                resultado = false
                break
            end
        end
        return resultado
    end

    def reiniciarTablero()
        @tablero.each do |i|
            i.reiniciarCasilla()
        end
    end

    def marcar(x, y, direccion, color)
        x = x - 1
        y = y - 1
        case direccion
            when "derecho"
                @tablero[y, x].marcarDerecho()
                if(x != @tamanio)
                    @tablero[y, x+1].marcarIzquierdo()
                    pintarCasilla(x + 1, y, color)
                end
            when "izquierdo"
                @tablero[y, x].marcarIzquierdo()            
                if(x != 0)
                    @tablero[y, x-1].marcarDerecho()
                    pintarCasilla(x - 1, y, color)
                end
            when "superior"
                @tablero[y, x].marcarSuperior()
                if(y != 0)
                    @tablero[y-1, x].marcarInferior()
                    pintarCasilla(x, y-1, color)
                end
            when "inferior"
                @tablero[y, x].marcarInferior()
                if(y != @tamanio)
                    @tablero[y+1, x].marcarSuperior()
                    pintarCasilla(x, y+1, color)   
                end
        end
        pintarCasilla(x, y, color)
    end

    def verLadoDeLaCasilla(x, y, direccion)
        x = x - 1
        y = y - 1
        resultado = false
        case direccion
            when "derecho"
                resultado = @tablero[y, x].derecho()
            when "izquierdo"
                resultado = @tablero[y, x].izquierdo()            
            when "superior"
                resultado = @tablero[y, x].superior()
            when "inferior"
                resultado = @tablero[y, x].inferior()
        end
        return resultado
    end
    
    def pintarCasilla(x, y, color)
        if(@tablero[y, x].esCasillaPintada())
            @tablero[y, x].pintar(color)
        end
    end

    def contarCasillasJugador(color)   
        cantidad = 0     
        @tablero.each do |i|
            if(i.color() == color)
                cantidad = cantidad+1
            end
        end
        return cantidad
    end

    def estaPintadaLaCasilla(x, y)
        x = x - 1
        y = y - 1
        resultado = true
        if(!@tablero[y, x].esCasillaPintada())
            resultado = false
        end
        return resultado
    end

    def ultimaColumna(numero)
        resultado = false
        if(numero % (@tamanio+1) == 0)
            resultado = true
        end
        return resultado
    end
    def generarFilaPuntos(filaPuntos, casilla)
        filaPuntos = filaPuntos + casillaPunto
        if(casilla.superior())
            filaPuntos = filaPuntos + casillaLineaHorizontal()
        else
            filaPuntos = filaPuntos + casillaEnBlanco()
        end
        return filaPuntos
    end

    def generarFilaPintada(filaPintada, casilla)
        if(casilla.izquierdo())
            filaPintada = filaPintada + casillaLineaVertical()
        else
            filaPintada = filaPintada + casillaEnBlanco()
        end
        filaPintada = filaPintada + casilla.generarHTML()
    end

    def generarUltimaFila(ultimaFila, casilla)
        ultimaFila = ultimaFila + casillaPunto()
        if(casilla.inferior())
            ultimaFila = ultimaFila + casillaLineaHorizontal()
        else 
            ultimaFila = ultimaFila + casillaEnBlanco()
        end
    end

    def finalizarFila(bodyTabla, filaPintada, filaPuntos, casilla)
        if(casilla.derecho())
            filaPintada = filaPintada + casillaLineaVertical()
        else
            filaPintada = filaPintada + casillaEnBlanco()
        end
        filaPuntos = filaPuntos + casillaPunto
        
        filaPuntos = filaPuntos + "  </tr> "
        filaPintada = filaPintada + "  </tr> "
        bodyTabla = bodyTabla + filaPuntos + filaPintada
        return bodyTabla
    end


    def casillaLineaHorizontal()
        return " <td><img src='images/lineaHorizontal.jpg'/></td> "
    end
    def casillaLineaVertical()
        return " <td><img src='images/lineaVertical.jpg'/></td> " 
    end
    def casillaPunto()
        return " <td><img src='images/punto.jpg'/></td> "
    end
    def casillaEnBlanco()
        return " <td width='25px' height='25px' bgcolor='white'></td> "
    end
    
    def generarHTMLTabla()
        bodyTabla = " <tbody> "
        numeroCasilla = numeroFila = 1
        filaPuntos = filaPintada = ultimaFila= "  <tr> "

        @tablero.each do |casilla|
            filaPuntos = generarFilaPuntos(filaPuntos, casilla)

            filaPintada = generarFilaPintada(filaPintada, casilla)

            if(numeroFila-1 == @tamanio)
                ultimaFila = generarUltimaFila(ultimaFila, casilla)
            end

            if(ultimaColumna(numeroCasilla))

                bodyTabla = finalizarFila(bodyTabla, filaPintada, filaPuntos, casilla)

                numeroFila = numeroFila + 1
                filaPuntos = filaPintada = "  <tr> "
            end
           
            numeroCasilla = numeroCasilla + 1

        end
        ultimaFila = ultimaFila + casillaPunto
        ultimaFila = ultimaFila + "  </tr> "
        bodyTabla = bodyTabla + ultimaFila + " </tbody> "
        return bodyTabla
    end

end