class Casilla
    def initialize()
        @superior= false
        @inferior= false
        @derecho = false
        @izquierdo = false
        @color = "white"
    end

    def esCasillaNula()        
        resultado = true
        if(@superior && @inferior && @derecho && @izquierdo)
            resultado = false
        end
        return resultado
    end

    def esCasillaPintada()  
        resultado = false      
        if(@superior && @inferior && @derecho && @izquierdo)
            resultado = true
        end
        return resultado
    end

    def pintar(colorcito)
        if @color == "white"
            @color = colorcito
        end
    end

    def generarHTMLCasilla()
        return " <td width='25px' height='25px' bgcolor='"+@color+"'></td> "
    end

    def reiniciarCasilla()
        @superior= false
        @inferior= false
        @derecho = false
        @izquierdo = false
        @color = "white"
    end

    def marcarIzquierdo()
        @izquierdo = true
    end
    def marcarDerecho()
        @derecho = true
    end
    def marcarSuperior()
        @superior = true
    end
    def marcarInferior()
        @inferior = true
    end
    def color()
        return @color
    end
    def izquierdo()
        return @izquierdo
    end
    def derecho()
        return @derecho
    end
    def superior()
        return @superior
    end
    def inferior()
        return @inferior
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

    def generarLadoSuperiorFilaPuntos()
        filaPuntos=""
        filaPuntos = filaPuntos + casillaPunto()
        if(superior)
            filaPuntos = filaPuntos + casillaLineaHorizontal()
        else
            filaPuntos = filaPuntos + casillaEnBlanco()
        end
        return filaPuntos
    end

    def generarCasillaPintadaYLadoIzquierdo()
        filaPintada=""
        if(izquierdo)
            filaPintada = filaPintada + casillaLineaVertical()
        else
            filaPintada = filaPintada + casillaEnBlanco()
        end
        filaPintada = filaPintada + generarHTMLCasilla()
        return filaPintada
    end

    def generarUltimaFilaPuntos()
        ultimaFila=""
        ultimaFila = ultimaFila + casillaPunto()
        if(inferior())
            ultimaFila = ultimaFila + casillaLineaHorizontal()
        else 
            ultimaFila = ultimaFila + casillaEnBlanco()
        end
        return ultimaFila
    end

    def generarFinDeFilas(bodyTabla, filaPintada, filaPuntos)
        if(derecho())
            filaPintada = filaPintada + casillaLineaVertical()
        else
            filaPintada = filaPintada + casillaEnBlanco()
        end
        filaPuntos = filaPuntos + casillaPunto()
        
        filaPuntos = filaPuntos + "  </tr> "
        filaPintada = filaPintada + "  </tr> "
        bodyTabla = bodyTabla + filaPuntos + filaPintada
        return bodyTabla
    end
    

end