class Jugador
    attr_accessor :nombre, :color
    def initialize(nombre = nil, color = nil)
         @nombre = nombre unless nombre.nil?
         @color = color unless color.nil?
    end
    
    def ingresarNombre(nuevoNombre)
        @nombre = nuevoNombre
    end
    def ingresarColor(nuevoColor)
        @color = nuevoColor
    end
    def nombre()
        return @nombre
    end
    def color()
        return @color
    end
end