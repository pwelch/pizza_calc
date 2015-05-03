# encoding: utf-8
require_relative 'test_helper'
require_relative '../lib/pizza_calc'

class PizzaCalcTest < Minitest::Test
  def test_class_exists
    assert PizzaCalc
  end

  def test_total
    total_pizzas = PizzaCalc.new(4).amount
    assert total_pizzas, 2
  end
end
