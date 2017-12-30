
require_relative 'test_helper'
require_relative '../helpers/pluralize'

class HelperTests
  include ApplicationHelper
end

class ApplicationHelperTest < Minitest::Test
  def setup
    @helper = HelperTests.new
  end

  def test_pluralize_one
    assert @helper.pluralize(1), 'pizza'
  end

  def test_pluralize_many
    assert @helper.pluralize(3), 'pizzas'
  end
end
