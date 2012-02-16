# Examples for the Recharge API Gem
# Customer Resource

# Only 2 lines are required to get started:
# Require the recharge.rb file
require '../lib/recharge'

# Set your API key here, found in Recharge Settings > API Settings > API Private Key
# If incorrect or blank, any calls will raise a Response::NotAuthorized
Recharge.api_key = "92ec3e4d8b623dd9baaaf1575b7c557cd113e3e8"



# Get a list of all active customers
puts "Find All Customers",''

begin
  # call find_all to get a list of all customers
  Recharge::Customer.find_all.each do |customer|
    
    # attributes can be accessed individually like this
    puts "id: #{customer.id}"
    puts "name: #{customer.firstName} #{customer.lastName}"
    puts "email: #{customer.email}"
    
    # or you may inspect the whole record and get a list of all keys/values like this
    p customer
    
    customerID = customer.id
    
    # each customer record has many payMethods (stored card numbers or bank accounts), so make sure you loop through these
    customer.payMethods.each do |paymethod|
      puts ">> paymethod id: #{paymethod.id}"
      puts ">> card number: #{paymethod.cardType} ****#{paymethod.last4}"
    end
    
    # each customer record has many charges, same as payMethods
    customer.charges.each do |charge|
      puts ">> charge id: #{charge.id}"
      puts ">> payment plan: #{charge.price} charged every #{charge.intervalValue} #{charge.intervalUnit}", ''
    end
  end
rescue Exception => e
  puts ">> error #{e.message}"
end



# Find an individual customer by the customer ID
puts "", "Find Individual Customers"

begin
  # Records are fetched by their unique identifiers.
  customer = Recharge::Customer.find(customerID)
  
  puts "id: #{customer.id}"
  puts "name: #{customer.firstName} #{customer.lastName}"
  puts "email: #{customer.email}"
  
  customer.payMethods.each do |paymethod|
    puts ">> paymethod id: #{paymethod.id}"
    puts ">> card number: #{paymethod.cardType} ****#{paymethod.last4}"
  end
  customer.charges.each do |charge|
    puts ">> charge id: #{charge.id}"
    puts ">> payment plan: #{charge.price} charged every #{charge.intervalValue} #{charge.intervalUnit}"
  end
rescue Exception => e
  puts ">> error #{e.message}"
end



# create a new customer
puts "", "Create New Customer"

begin
  # customers can be created in one fell swoop
  customer = Recharge::Customer.create(
    :firstName => "Eric",
    :lastName=> "Cardin",
    :email=> "email@rechargebilling.com"
  )
  
  # after the customer is saved, all attributes are available for you individually or by inspecting
  customerID = customer.id
  p customer
rescue Exception => e
  puts ">> error #{e.message}"
end



# Update an existing customer (change email address, phone number, etc)
puts "", "Update Customer"

begin
  # you must find the charge first
  customer = Recharge::Customer.find(customerID)
  
  # then call update on it
  # you only need to pass the attributes you want to update
  customer.update(
    :refID=> Time.now.to_i
  )
  
  # all updated information about the customer is now available
  p customer
rescue Exception => e
  # errors here can be
  # Response::NotFound if the customer ID does not exist
  # Response::BadRequest if there was something wrong with the request
  puts ">> error #{e.message}"
end



# deletes an existing customer
#  deletes the customer, payment methods, cancels all future transactions that were scheduled for this charge
puts "", "Delete Customer"

begin
  # find the customer first
  customer = Recharge::Customer.find(customerID)
  # call destroy on it to delete it
  customer.destroy
rescue Exception => e
  puts ">> error #{e.message}"
end