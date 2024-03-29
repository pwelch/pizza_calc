# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/custom_logger'
require 'logger'
require 'json'
require './helpers/pluralize'
require './lib/pizza_calc'

class App < Sinatra::Base
  VERSION = '0.1.6'

  helpers ApplicationHelper
  helpers Sinatra::CustomLogger

  configure :development, :production do
    set :server, :puma
    set :logging, true
    set :logger, Logger.new($stdout)
    logger.level = Logger::DEBUG if development?
  end

  ## UI
  get '/' do
    erb :index
  end

  get '/pizza_calc' do
    redirect '/'
  end

  post '/pizza_calc' do
    @pizza_count = PizzaCalc.new(params[:people]).amount
    erb :index, locals: { pizza_count: @pizza_count }
  end

  get '/api' do
    erb :api
  end

  ## API
  post '/api/pizza_calc/:people' do
    content_type :json
    @pizza_count = PizzaCalc.new(params[:people]).amount
    { amount_to_order: @pizza_count }.to_json
  end

  get '/api/pizza_calc/:people' do
    content_type :json
    @pizza_count = PizzaCalc.new(params[:people]).amount
    { amount_to_order: @pizza_count }.to_json
  end

  get '/api/status' do
    content_type :json
    {
      'status' => 'OK',
      'last_updated' => Time.now.utc,
      'version' => App::VERSION
    }.to_json
  end

  get '/api/*' do
    content_type :json
    { status: 'ERROR', message: 'Not Found' }.to_json
  end

  ## Errors
  not_found do
    erb '<img src="assets/images/tb_sign1.png"/>'
  end
end
