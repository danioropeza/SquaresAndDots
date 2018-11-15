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
    @@turno=1

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
    
    post '/juego' do
        @cantidadJugadores = params[:Cantidadjugadores].to_i

        @@nombre2 = (params[:nombre])
        @@color2 = (params[:color])
  
        @jugadorActual = @@nombre1
        @jugadorActualColor = @@color1
        @jugador1 = @@nombre1
        @jugador2 = @@nombre2
        @puntaje1 = 0
        @puntaje2 = 0
        @bodyTablero = @@tablero.generarHTMLTabla()
        erb:juego
    end

    post '/juego1' do
        @@turno = @@turno+1
        if(@@turno%2 != 0)
            @jugadorActual = @@nombre1
            @jugadorActualColor = @@color1
        end
        if(@@turno%2 == 0)
            @jugadorActual = @@nombre2
            @jugadorActualColor = @@color2
        end
        @jugador1 = @@nombre1
        @puntaje1 = @@tablero.contarCasillasJugador(@@color1)*2
        @jugador2 = @@nombre2
        @puntaje2 = @@tablero.contarCasillasJugador(@@color2)*2

        @colorJugador1 = @@color1
        @colorJugador2 = @@color2
        x = params[:x].to_i
        y = params[:y].to_i
        direccion=params[:direccion]
        @@tablero.marcar(x,y,direccion,@jugadorActualColor)
        @bodyTablero= @@tablero.generarHTMLTabla()
        erb:juego
    end

end