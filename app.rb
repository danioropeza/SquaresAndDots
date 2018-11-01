require 'sinatra'
class App < Sinatra::Base
    get '/' do
        "as"
    end

    post '/sumar' do
        "Sumar"
    end
end