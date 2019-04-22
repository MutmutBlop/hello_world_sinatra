require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do #appelle la homepage
    erb :index, locals: {gossips: Gossip.all} #appelle la view index.erb et lui envoie l'array obtenu par Gossip.all
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do #lien dynamique avec variable (fonction définie dans gossip.rb)
    @id = params[:id]
    erb :show
  end

end
