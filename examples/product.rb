require '../lib/recharge'

Recharge.api_key = "92ec3e4d8b623dd9baaaf1575b7c557cd113e3e8"

productID = ""

puts "Find All Products",''

begin
  Recharge::Product.find_all.each do |product|
    puts "id: #{product.id}"
    puts "name: #{product.name}"
    puts "price: #{product.price}"
    
    productID = product.id
  end
rescue Exception => e
  puts ">> error #{e.message}"
end

puts "", "Find Individual Products"

begin
  product = Recharge::Product.find(productID)
  
  puts "id: #{product.id}"
  puts "name: #{product.name}"
  puts "price: #{product.price}"

rescue Exception => e
  puts ">> error #{e.message}"
end



puts "", "Create New Product"

begin
  product = Recharge::Product.create(
    :name => "HeyHey",
    :price => "100",
    :intervalValue => 1,
    :intervalUnit => 'm'
  )
  productID = product.id
  p product
rescue Exception => e
  puts ">> error #{e.message}"
end



puts "", "Update Product"

begin
  product = Recharge::Product.find(productID)
  product.update(
    :price=> "101"
  )
  p product
rescue Exception => e
  puts ">> error #{e.message}"
end



puts "", "Delete Product"

begin
  product = Recharge::Product.find(productID)
  product.destroy
rescue Exception => e
  puts ">> error #{e.message}"
end