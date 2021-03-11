gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './app'

class DataGetterTest < Minitest::Test
  
  def test_get_top_models_by_number
    data = DataGetter.get_top_models_by_number
    response = JSON.parse(data)
    assert data
    
    row_1 = {"model"=>"Boeing 737-800", "number_in_fleet"=>"826"}
    assert_equal row_1, response.first
  end
end