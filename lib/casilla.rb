class Casilla

    def inicializar()
        @superior=false
        @inferior=false
        @derecho=false
        @izquierdo=false
        @color= "#ffffff"
        @codigo=""
    end

    def esCasillaNula()        
        if(@superior==false && @inferior==false && @derecho==false && @izquierdo==false)
            return true
        end
        return false
    end

    def marcada()        
        if(@superior && @inferior && @derecho && @izquierdo)
            return true
        end
        return false
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
        @color=colorcito
    end

    def marcarIzquierdo()
        @izquierdo=true
    end

    def marcarDerecho()
        @derecho=true
    end
    def marcarSuperior()
        @superior=true
    end
    def marcarInferior()
        @inferior=true
    end
    def generarHTML()
        return " <td width='25px' height='25px' bgcolor='"+@color+"'></td> "
    end

    
end