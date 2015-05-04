ENV['RACK_ENV'] = 'test'

require 'rack/test'
require_relative 'test_helper'
require_relative '../app'

class AppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    App
  end

  def test_root_response
    get '/'
    assert last_response.ok?
  end

  def test_pizza_calc_text
    get '/'
    assert last_response.body.include? 'Find How Many Pizzas To Order:'
  end

  def test_pizza_calc_post
    post '/pizza_calc', { :people => 3 }
    assert last_response.ok?
    assert last_response.body.include? 'Order 2 Pizzas'
  end

  def test_api_pizza_calc_post
    post '/api/pizza_calc/8'
    assert last_response.ok?
    assert last_response.body == '{"amount_to_order":3}'
  end
end
