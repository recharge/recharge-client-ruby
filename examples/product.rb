# Examples for the Recharge API Gem
# Product Resource

# Only 2 lines are required to get started:
# Require the recharge gem
require 'rubygems'
require 'recharge'

# Set your API key here, found in Recharge Settings > API Settings > API Private Key
# If incorrect or blank, any calls will raise a Response::NotAuthorized
Recharge.api_key = "92ec3e4d8b623dd9baaaf1575b7c557cd113e3e8"



# Get a list of all products
puts "Find All Products",''

begin
  # call find_all to get a list of all products
  Recharge::Product.find_all.each do |product|
    
    # attributes can be accessed individually like this
    puts "id: #{product.id}"
    puts "name: #{product.name}"
    puts "price: #{product.price}"
    
    # or you may inspect the whole record and get a list of all keys/values like this
    p product
    
    productID = product.id
  end
rescue Exception => e
  puts ">> error #{e.message}"
end



# Find an individual product by the product ID
puts "", "Find Individual Products"

begin
  # Records are fetched by their unique identifiers.
  product = Recharge::Product.find(productID)
  
  puts "id: #{product.id}"
  puts "name: #{product.name}"
  puts "price: #{product.price}"

rescue Exception => e
  puts ">> error #{e.message}"
end



# create a new product
puts "", "Create New Product"

begin
  # products can be created in one fell swoop
  product = Recharge::Product.create(
    :name => "HeyHey",
    :price => "100",
    :intervalValue => 1,
    :intervalUnit => 'm'
  )
  
  # after the product is saved, all attributes are available for you individually or by inspecting
  productID = product.id
  p product
rescue Exception => e
  puts ">> error #{e.message}"
end



# Update an existing product (change price, product name, etc)
puts "", "Update Product"

begin
  # you must find the product first
  product = Recharge::Product.find(productID)
  
  # then call update on it
  # you only need to pass the attributes you want to update
  product.update(
    :price=> "101"
  )
  
  # all updated information about the product is now available
  p product
rescue Exception => e
  # errors here can be
  # Response::NotFound if the customer ID does not exist
  # Response::BadRequest if there was something wrong with the request
  puts ">> error #{e.message}"
end



# deletes an existing product
puts "", "Delete Product"

begin
  # find the product first
  product = Recharge::Product.find(productID)
  # call destroy on it to delete it
  product.destroy
rescue Exception => e
  puts ">> error #{e.message}"
end