require 'sinatra'
require "./lib/tablero"
require "./lib/jugador"
class App < Sinatra::Base
    
    @@nombre1=""
    @@nombre2=""

    @@color1=""
    @@color2=""

    @@tablero = Tablero.new()
    @@tablero.inicializar()
    @@turno = 0

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
        @cantidadJugadores = params[:Cantidadjugadores].to_i
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
        if(@@turno%2 == 0)
            @jugadorAntiguoColor = @@color2
        else
            @jugadorAntiguoColor = @@color1
        end
        x = params[:x].to_i
        y = params[:y].to_i
        puts x
        puts y
        direccion = params[:direccion]
        @@tablero.marcar(x, y, direccion, @jugadorAntiguoColor)    
        @@turno = @@turno + 1
        redirect "/juego"
    end
end