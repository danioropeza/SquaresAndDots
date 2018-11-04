class Jugador
    @nombre=""
    @color=""
    def ingresarNombre(nuevoNombre)
        @nombre=nuevoNombre

    end
    def nombre()
        return @nombre
    end
    def ingresarColor(nuevoColor)
        @color=nuevoColor

    end
    def color()
        return @color
    end
end