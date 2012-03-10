# Examples for the Recharge API Gem
# Charge Resource

# Only 2 lines are required to get started:
# Require the recharge gem
require 'rubygems'
require 'recharge'

# Set your API key here, found in Recharge Settings > API Settings > API Private Key
# If incorrect or blank, any calls will raise a Response::NotAuthorized
Recharge.api_key = "14a1a867f39b4fdced2148871e4e542015cad979"



# deletes an existing product
puts "", "Delete Product"

begin
  # find the product first
  product = Recharge::Product.find('pr4f3192260b55d', 'APIKEY')
  # call destroy on it to delete it
  product.destroy('APIKEY')
rescue Exception => e
  puts ">> error #{e.message}"
end