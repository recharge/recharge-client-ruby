# Examples for the Recharge API Gem
# Charge Resource

# Only 2 lines are required to get started:
# Require the recharge.rb file
require '../lib/recharge'

# Set your API key here, found in Recharge Settings > API Settings > API Private Key
# If incorrect or blank, any calls will raise a Response::NotAuthorized
Recharge.api_key = "92ec3e4d8b623dd9baaaf1575b7c557cd113e3e8"








# Find an individual charge by the charge ID
puts "", "Find Individual Charge"

begin
  # Records are fetched by their unique identifiers.
  charge = Recharge::Charge.find('ch4f3af9b81df18')
  
  # attributes can be accessed individually like this
  puts ">> charge id: #{charge.id}"
  puts ">> payment plan: #{charge.price} charged every #{charge.intervalValue} #{charge.intervalUnit}", ''
  
  # or you may inspect the whole record and get a list of all keys/values like this
  p charge
rescue Exception => e
  # If the record doesn't exist, a Response::NotFound exception will
  # be raised.
  puts ">> error #{e.message}"
end








# create a new charge for a customer
puts "", "Create New Charge"

begin
  # charges can be created in one fell swoop
  charge = Recharge::Charge.create(
    :customer          => "cu4f3782bf374a7",
    :payMethod         => "pm4f3b214680f5f",
    :billingStartDate  => "5/21/2012",
    :product           => "pr4f379194192df"
  )
  # after the charge is saved, all attributes are available for you individually or by inspecting
  chargeID = charge.id
  p charge
rescue Exception => e
  # if a required field is missing or invalid, a Response::BadRequest error will be raised
  # e.message will give more info why the record creation failed
  puts ">> error #{e.message}"
end









# Update an existing charge (change billing amount, card number, etc)
puts "", "Update Charge"

begin
  # you must find the charge id first
  charge = Recharge::Charge.find(chargeID)
  # then call update on it
  # you only need to pass the attributes you want to update
  charge.update(
    :product  => "pr4f3b29e2b5813"
  )
  # all updated information about the charge is now available
  p charge
rescue Exception => e
  # errors here can be
  # Response::NotFound if the charge ID does not exist
  # Response::BadRequest if there was something wrong with the request
  puts ">> error #{e.message}"
end










# deletes an existing charge
#  deletes the charge, cancels all future transactions that were scheduled for this charge
puts "", "Delete Charges"

begin
  # find the charge first
  charge = Recharge::Charge.find(chargeID)
  # call destroy on it to delete it
  charge.destroy
rescue Exception => e
  puts ">> error #{e.message}"
end