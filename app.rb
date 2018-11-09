require 'sinatra'
require "./lib/tablero"
require "./lib/jugador"
class App < Sinatra::Base
    @jugadores=Array.new(4)
    @colores=Array.new(4)
    get '/' do
        erb:inicio
    end

    get '/configurarPartida' do
        erb:configurarPartida
    end

    
    post '/juego' do
        @jugador1 = "asd"
        @jugador2 = "asdas"
        @score = "asdasdasds"
        @cantidadJugadores=params[:Cantidadjugadores].to_i
        @tableri=Tablero.new()
        @tableri.inicializar()
        @tableri.marcar(1,3,"izquierdo","blue")
        @tableri.marcar(1,3,"derecho","blue")
        @tableri.marcar(1,3,"superior","blue")
        @tableri.marcar(1,3,"inferior","blue")
        @tablerito=@tableri.generarHTMLTabla()
        erb:juego
    end
end