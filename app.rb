require 'sinatra'
require "./lib/tablero"
require "./lib/jugador"
require "./lib/juego"

class App < Sinatra::Base
    @@juego = Juego.new(5, "John", "Pedro", "#0000ff", "#00ff00")

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
        @@juego.ingresarTamano(params[:dimension].to_i)
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

   

    post '/nuevaJugada' do
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