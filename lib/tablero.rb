require 'matrix'
require "./lib/casilla"

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

    def marcar(x,y,lado,color)
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
        
        pintarCasilla(x,y,color)
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
    
    def pintarCasilla(x,y,color)
       
        cantidad=0
        if(@tablero[x, y].derecho()==true)
           cantidad=cantidad+1
        end
        if(@tablero[x,y].izquierdo()==true)
            cantidad=cantidad+1
        end
        if(@tablero[x,y].superior()==true)
            cantidad=cantidad+1
        end
        if(@tablero[x,y].inferior()==true)
            cantidad=cantidad+1
        end

        if(cantidad==4)
            @tablero[x,y].pintar(color)
            puts cantidad
        end

    end

    def contarCasillasJugador(color)   
        cantidad=0     
        @tablero.each do |i|
            if(i.color()==color)
                cantidad=cantidad+1
            end
        end
        return cantidad
    end

    def estaPintado(x,y)
        x=x-1
        y=y-1
        if(@tablero[x,y].color()== "#ffffff")
            return false
        end
        return true
    end

    def multiploTamanio(numero)
        if(numero % (@tamanio+1)==0)
            return true
        end
        return false
    end

    def generarHTMLTabla()
        bodyTabla=" <tbody> "
        casillaLineaHorizontal=" <td><img src='images/lineaHorizontal.jpg'/></td> "
        casillaLineaVertical=" <td><img src='images/lineaVertical.jpg'/></td> "
        casillaPunto=" <td><img src='images/punto.jpg'/></td> "
        casillaEnBlanco=" <td width='25px' height='25px' bgcolor='white'></td> "
        numeroCasilla=1
        numeroFila=1
        filaPuntos="  <tr> "
        filaPintada="  <tr> "
        ultimaFila="  <tr> "
        @tablero.each do |i|
            filaPuntos=filaPuntos+casillaPunto
            if(i.superior())
                filaPuntos=filaPuntos+casillaLineaHorizontal
            end
            if(!i.superior())
                filaPuntos=filaPuntos+casillaEnBlanco
            end
            if(i.izquierdo())
                filaPintada=filaPintada+casillaLineaVertical
            end
            if(!i.izquierdo())
                filaPintada=filaPintada+casillaEnBlanco
            end
            filaPintada=filaPintada+i.generarHTML()
            if(numeroFila==@tamanio)
                ultimaFila=ultimaFila+casillaPunto
                if(i.inferior())
                    ultimaFila=ultimaFila+casillaLineaHorizontal
                end
                if(!i.inferior())
                    ultimaFila=ultimaFila+casillaEnBlanco
                end

            end
            if(multiploTamanio(numeroCasilla))
                if(i.derecho())
                    filaPintada=filaPintada+casillaLineaVertical
                end
                if(!i.derecho())
                    filaPintada=filaPintada+casillaEnBlanco
                end
                filaPuntos=filaPuntos+casillaPunto
                filaPuntos=filaPuntos+"  </tr> "
                filaPintada=filaPintada+"  </tr> "
                numeroFila=numeroFila+1
                bodyTabla=bodyTabla+filaPuntos+filaPintada
                filaPuntos="  <tr> "
                filaPintada="  <tr> "
            end
           
            numeroCasilla=numeroCasilla+1

        end
        ultimaFila=ultimaFila+casillaPunto
        ultimaFila=ultimaFila+"  </tr> "
        bodyTabla=bodyTabla+ultimaFila+" </tbody> "
        return bodyTabla
    end

    #si esta en la fila 1 y esta arriba no marca dos casillas
    #si esta en la ultima fila y esta abajo no marca dos casillas
    #si esta en la primera columna y es lado izquierdo no marca dos casillas
    #si esta en la ultima columna y es lado derecho no marca dos casillas
    #si no cumple alguno de estos 4 casos marca dos casillas
end