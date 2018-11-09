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

    def lleno()
        @tablero.each do |i|
            if(i.color=="#ffffff")
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
            @tablero[y, x]. marcarDerecho()
            if(x!=@tamanio)
                @tablero[y, x+1]. marcarIzquierdo()
            end
        when "izquierdo"
            @tablero[y, x]. marcarIzquierdo()            
            if(x!=0)
                @tablero[ y,x-1]. marcarDerecho()
            end
        when "superior"
            @tablero[y, x]. marcarSuperior()
            if(y!=0)
                @tablero[y-1, x]. marcarInferior()
            end
        when "inferior"
            @tablero[y,x]. marcarInferior()
            if(y!=@tamanio)
                @tablero[ y+1,x]. marcarSuperior()
            end
        end
        
        pintarCasilla(x,y,color)
    end

    def ver(x,y,lado)
        x=x-1
        y=y-1

        case lado
        when "derecho"
            return @tablero[y, x]. derecho()
        when "izquierdo"
            return @tablero[y, x]. izquierdo()            
        when "superior"
            return @tablero[y, x]. superior()
        when "inferior"
            return @tablero[y, x]. inferior()
        end
    end
    
    def pintarCasilla(x,y,color)
       
        cantidad=0
        if(@tablero[ y,x].derecho()==true)
           cantidad=cantidad+1
        end
        if(@tablero[y,x].izquierdo()==true)
            cantidad=cantidad+1
        end
        if(@tablero[y,x].superior()==true)
            cantidad=cantidad+1
        end
        if(@tablero[y,x].inferior()==true)
            cantidad=cantidad+1
        end

        if(cantidad==4)
            @tablero[y,x].pintar(color)
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
        if(@tablero[y,x].color()== "#ffffff")
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

end