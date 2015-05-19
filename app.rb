require 'sinatra'
require 'json'
require './helpers/pluralize'
require './lib/pizza_calc'

class App < Sinatra::Base
  set :logging, true
  set :server, :puma

  helpers ApplicationHelper

  ## UI
  get '/' do
    erb :index
  end

  get '/pizza_calc' do
    redirect '/'
  end

  post '/pizza_calc' do
    @pizza_count = PizzaCalc.new(params[:people]).amount
    erb :index, :locals => { :pizza_count => @pizza_count }
  end

  get '/api' do
    erb :api
  end

  ## API
  post '/api/pizza_calc/:people' do
    content_type :json
    @pizza_count = PizzaCalc.new(params[:people]).amount
    { :amount_to_order => @pizza_count }.to_json
  end
end
