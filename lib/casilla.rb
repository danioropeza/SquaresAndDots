class Casilla
    def inicializar()
        @superior= false
        @inferior= false
        @derecho = false
        @izquierdo = false
        @color = "#ffffff"
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

    def pintar(colorcito)
        if @color == "#ffffff"
            @color = colorcito
        end
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
    def generarHTML()
        return " <td width='25px' height='25px' bgcolor='"+@color+"'></td> "
    end

    def reiniciar()
        inicializar()
    end
end