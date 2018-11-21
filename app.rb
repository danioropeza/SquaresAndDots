require 'sinatra'
require "./lib/tablero"
require "./lib/jugador"
class App < Sinatra::Base
    
    @@nombre1=""
    @@nombre2=""

    @@color1=""
    @@color2=""

    @@tablero = Tablero.new()
    @@tablero.inicializar(5)
    @@turno = 1

    get '/' do
        erb:inicio
    end

    get '/jugador1' do
        erb:jugador1
    end

    post '/jugador2' do
        @@nombre1 = (params[:nombre])
        @@color1 = (params[:color])
       
        erb:jugador2
    end
    
    post '/configuracionInicialPartida' do
        @@nombre2 = (params[:nombre])
        @@color2 = (params[:color])
        redirect "/juego"
    end

    get '/juego' do  
        if(@@turno%2 != 0)
            @jugadorActual = @@nombre1
            @jugadorActualColor = @@color1
        else
            @jugadorActual = @@nombre2
            @jugadorActualColor = @@color2
        end
        
        @jugador1 = @@nombre1
        @jugador2 = @@nombre2

        @colorJugador1 = @@color1
        @colorJugador2 = @@color2

        @puntaje1 = @@tablero.contarCasillasJugador(@@color1)*2
        @puntaje2 = @@tablero.contarCasillasJugador(@@color2)*2

        @bodyTablero = @@tablero.generarHTMLTabla()
        erb:juego
    end

   

    post '/nuevaJugada' do
        x = params[:x].to_i
        y = params[:y].to_i
        direccion = params[:direccion]
        if (!@@tablero.verLadoDeLaCasilla(x, y, direccion))
            if(@@turno%2 == 0)
                @jugadorAntiguoColor = @@color2
            else
                @jugadorAntiguoColor = @@color1
            end
            @@tablero.marcar(x, y, direccion, @jugadorAntiguoColor)    
            @@turno = @@turno + 1
        end
        redirect "/juego"
    end

    get '/reiniciar' do

        @@tablero.reiniciarTablero()
        @@turno=1
        if(@@turno%2 != 0)
            @jugadorActual = @@nombre1
            @jugadorActualColor = @@color1
        else
            @jugadorActual = @@nombre2
            @jugadorActualColor = @@color2
        end
        
        @jugador1 = @@nombre1
        @jugador2 = @@nombre2

        @colorJugador1 = @@color1
        @colorJugador2 = @@color2

        @puntaje1 = @@tablero.contarCasillasJugador(@@color1)*2
        @puntaje2 = @@tablero.contarCasillasJugador(@@color2)*2

        @bodyTablero = @@tablero.generarHTMLTabla()
        erb:juego
    end
end