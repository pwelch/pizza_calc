require 'sinatra'
require './helpers/pluralize'
require './lib/pizza_calc'

class App < Sinatra::Base
  set :logging, true

  helpers ApplicationHelper

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
end
