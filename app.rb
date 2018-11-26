require 'sinatra'
require "./lib/tablero"
require "./lib/jugador"
require "./lib/juego"

class App < Sinatra::Base
    @@juego=Juego.new(5, "Daniel", "Juan", "#000ff0", "#00fff0")  
    @@existeTamanio=false

    get '/' do
        @@existeTamanio=false
        erb:inicio
    end

    get '/jugador1' do
        erb:jugador1
    end

    get '/jugador2' do
        @@juego.ingresarJugador1(params[:nombre], params[:color])
        erb:jugador2
    end
    
    get '/dimension' do
       
        @@juego.ingresarJugador2(params[:nombre],params[:color])
        erb:dimension
    end


    get '/juego' do
        
        puts "prueba en de juego"
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
        @puntaje1 = @@juego.contarCasillasJugador(@@juego.color1())
        @puntaje2 = @@juego.contarCasillasJugador(@@juego.color2())
        @bodyTablero = @@juego.generarHTMLTabla()
        erb:juego
    end

   

    get '/nuevaJugada' do
        x = params[:x].to_i
        y = params[:y].to_i
        direccion = params[:direccion]
        @@juego.jugada(x, y, direccion)
        if(@@juego.terminoElJuego())
            redirect "/resultado"
        else
            redirect "/juego"
        end
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

    get '/resultado' do
        ganador = @@juego.ganadorDelJuego()
        if (ganador == nil)
            @nombreGanador = "Empate!"
            @colorGanador = "#000000"
        else
            @nombreGanador = ganador.nombre()
            @colorGanador = ganador.color()
        end
        @nombre1 = @@juego.nombre1()	        
        @nombre2 = @@juego.nombre2()	
        @colorJugador1 = @@juego.color1()	        
        @colorJugador2 = @@juego.color2()	
        @puntaje1 = @@juego.contarCasillasJugador(@@juego.color1())
        @puntaje2 = @@juego.contarCasillasJugador(@@juego.color2())
        erb:resultado
    end
end