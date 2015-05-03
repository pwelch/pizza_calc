# encoding: utf-8
require './test/test_helper'
require_relative '../lib/pizza_calc'

class PizzaCalcTest < Minitest::Test
  def test_class_exists
    assert PizzaCalc
  end
end
