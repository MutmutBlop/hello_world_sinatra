require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    @id = params[:id]
    erb :show
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params['id'] is 'foo' or 'bar'
  #"Hello #{params['id']}!"
  end

end
