require 'sinatra'
require "./lib/tablero"
require "./lib/jugador"
require "./lib/juego"

class App < Sinatra::Base
    @@juego=Juego.new() 
    @@existeTamanio=false

    get '/' do
        erb:inicio
    end

    get '/jugador1' do
        erb:jugador1
    end

    get '/jugador2' do
        jugador1=Jugador.new(params[:nombre],params[:color])
        @@juego.ingresarJugador1(jugador1)
        erb:jugador2
    end
    
    get '/dimension' do
        jugador2=Jugador.new(params[:nombre],params[:color])
        @@juego.ingresarJugador2(jugador2)
        erb:dimension
    end


    get '/juego' do
        if (!@@existeTamanio)
            @@juego.ingresarTamanio(params[:dimension].to_i)
            @@existeTamanio=true
        end
        @nombreDeTurno = @@juego.jugadorEnTurnoNombre()	        
        @colorDeTurno = @@juego.jugadorEnTurnoColor()	        
        @nombre1 = @@juego.nombre1()	        
        @nombre2 = @@juego.nombre2()	
        @colorJugador1 = @@juego.color1()	        
        @colorJugador2 = @@juego.color2()	
        @puntaje1 = @@juego.contarCasillasJugador(@@juego.color1()) * 2
        @puntaje2 = @@juego.contarCasillasJugador(@@juego.color2()) * 2
        @bodyTablero = @@juego.generarHTMLTabla()
        erb:juego
    end

   

    get '/nuevaJugada' do
        x = params[:x].to_i
        y = params[:y].to_i
        direccion = params[:direccion]
        @@juego.jugada(x, y, direccion)
        redirect "/juego"
    end

    get '/reiniciar' do
        @@juego.reiniciarPartida()
        @nombreDeTurno = @@juego.jugadorEnTurnoNombre()	        
        @colorDeTurno = @@juego.jugadorEnTurnoColor()	        
        @nombre1 = @@juego.nombre1()	        
        @nombre2 = @@juego.nombre2()	
        @colorJugador1 = @@juego.color1()	        
        @colorJugador2 = @@juego.color2()	
        @puntaje1 = @@juego.contarCasillasJugador(@@juego.color1())
        @puntaje2 = @@juego.contarCasillasJugador(@@juego.color2())
        @bodyTablero = @@juego.generarHTMLTabla()
        erb:juego
    end
end