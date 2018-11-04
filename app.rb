require 'sinatra'

class App < Sinatra::Base
    @cantidadJugadores=0
    get '/' do
        erb:inicio
    end

    get '/configurarPartida' do
        erb:configurarPartida
    end

    get '/configurarJugador' do
        
        if(@cantidadJugadores == 0)
             @cantidadJugadores=params[:Cantidadjugadores].to_i
           
        end

        if(@cantidadJugadores == 1)
            return erb:juego
        else
            @cantidadJugadores = @cantidadJugadores.to_i - 1
                return erb:configurarJugador
       end
    end

    post '/juego' do
        erb:juego
    end 
end