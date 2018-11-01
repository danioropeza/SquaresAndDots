require 'sinatra'
class App < Sinatra::Base
    get '/' do
        erb:inicio
    end

    get '/configurarPartida' do
        erb:configurarPartida
    end

end