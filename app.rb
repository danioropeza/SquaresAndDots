require 'sinatra'
require "./lib/tablero"
require "./lib/jugador"
require "./lib/juego"

class App < Sinatra::Base
    @@juego = Juego.new()
    @@tablero = Tablero.new()
    @@turno = 1

    get '/' do
        erb:inicio
    end

    get '/jugador1' do
        erb:jugador1
    end

    post '/jugador2' do
        @@juego.ingresarJugador1(params[:nombre], params[:color])
        erb:jugador2
    end
    
    post '/dimension' do
        @@juego.ingresarJugador2(params[:nombre], params[:color])
        erb:dimension
    end
    
    post '/configuracionInicialPartida' do
        @@tablero.ingresarTamano(params[:dimension].to_i)
        redirect "/juego"
    end

    get '/juego' do  
        if(@@turno%2 != 0)
            @@juego.ingresarJugadorEnTurno(@@juego.jugador1())
        else
            @@juego.ingresarJugadorEnTurno(@@juego.jugador2())
        end

        @puntaje1 = @@tablero.contarCasillasJugador(@@juego.jugador1.color()) * 2
        @puntaje2 = @@tablero.contarCasillasJugador(@@juego.jugador2.color()) * 2
        @bodyTablero = @@tablero.generarHTMLTabla()
        erb:juego
    end

   

    post '/nuevaJugada' do
        x = params[:x].to_i
        y = params[:y].to_i
        direccion = params[:direccion]
        if (!@@tablero.verLadoDeLaCasilla(x, y, direccion))
            if(@@turno%2 == 0)
                @@tablero.marcar(x, y, direccion, @@juego.jugador2.color())
            else
                @@tablero.marcar(x, y, direccion, @@juego.jugador1.color())
            end
            @@turno = @@turno + 1
        end
        redirect "/juego"
    end

    get '/reiniciar' do
        @@tablero.reiniciarTablero()
        @@turno = 1
        if(@@turno%2 != 0)
            @@juego.ingresarJugadorEnTurno(@@juego.jugador1())
        else
            @@juego.ingresarJugadorEnTurno(@@juego.jugador2())
        end

        @puntaje1 = @@tablero.contarCasillasJugador(@@color1)
        @puntaje2 = @@tablero.contarCasillasJugador(@@color2)

        @bodyTablero = @@tablero.generarHTMLTabla()
        erb:juego
    end
end