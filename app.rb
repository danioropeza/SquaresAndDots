require 'sinatra'
require "./lib/tablero"
require "./lib/jugador"
class App < Sinatra::Base
    
    @@nombre1=""
    @@nombre2=""

    @@color1=""
    @@color2=""

    @@tablero=Tablero.new()
    @@tablero.inicializar()
    @@turno=1

    get '/' do
        erb:inicio
    end

    get '/configurarPartida' do
        erb:configurarPartida
    end

    
    post '/juego' do
        @cantidadJugadores=params[:Cantidadjugadores].to_i

        @@nombre1=(params[:nombre1])
        @@nombre2=(params[:nombre2])
  

        @@color1=(params[:color1])
        @@color2=(params[:color2])
  
        @jugadorActual=@@nombre1
        @jugadorActualColor=@@color1
        @jugador1=@@nombre1
        @jugador2=@@nombre2
        @puntaje1=0
        @puntaje2=0
        @bodyTablero= @@tablero.generarHTMLTabla()
        erb:juego
    end

    post '/juego1' do
        @@turno=@@turno+1
        if(@@turno%2!=0)
            @jugadorActual=@@nombre1
            @jugadorActualColor=@@color1
        end
        if(@@turno%2==0)
            @jugadorActual=@@nombre2
            @jugadorActualColor=@@color2
        end
        @jugador1=@@nombre1
        @puntaje1=@@tablero.contarCasillasJugador(@@color1)*2
        @jugador2=@@nombre2
        @puntaje2=@@tablero.contarCasillasJugador(@@color2)*2
        x=params[:x].to_i
        y=params[:y].to_i
        direccion=params[:direccion]
        @@tablero.marcar(x,y,direccion,@jugadorActualColor)
        @bodyTablero= @@tablero.generarHTMLTabla()
        if(!@@tablero.lleno())
            erb:juego
        end
        if(@@tablero.lleno())
            if(@puntaje1>@puntaje2)
                @ganador=@@nombre1
            end
            if(@puntaje1<@puntaje2)
                @ganador=@@nombre2
            end
            if(@puntaje1==@puntaje2)
                @ganador="Empate"
            end
            

            erb:resultado
        end

    end

end