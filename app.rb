require 'sinatra'
require "./lib/tablero"
require "./lib/jugador"
require "./lib/juego"

class App < Sinatra::Base
    @@juego 
    
    get '/' do
        erb:inicio
    end

    get '/jugador1' do
        erb:jugador1
    end

    get '/jugador2' do
        @@nombre1=params[:nombre]
        @@color1=params[:color]
        
        erb:jugador2
    end
    
    get '/dimension' do
        @@nombre2=params[:nombre]
        @@color2=params[:color]
        erb:dimension
    end
    
    get '/configuracionInicialPartida' do
       
        @@tamanio = (params[:dimension].to_i)
        @@juego = Juego.new(@@tamanio , @@nombre1,@@nombre2,@@color1, @@color2)
        redirect "/juego"
    end

    get '/juego' do  
        @nombreDeTurno = @@juego.nombreDeTurno()	        
        @colorDeTurno = @@juego.colorDeTurno()	        
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
        @puntaje1 = @@juego.contarCasillasJugador(@@juego.color1())
        @puntaje2 = @@juego.contarCasillasJugador(@@juego.color2())
        @bodyTablero = @@juego.generarHTMLTabla()
        erb:juego
    end
end