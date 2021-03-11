gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/copy_paste_converter'

class CopyPasteConverterTest < Minitest::Test
  
  def it_has_attributes
    
  end
  
  def saves_raw_input
    
  end
  
  def convert_to_desired_output
    desired = "
      Manufacturer, Aircraft Model, 2019, 2018
      Boeing, 737-800, 826, 827
      "
    given = "
    Manufacturer 	
    Aircraft Model 	
    2019 	
    2018 	
    CHANGE	
    "
  end
end