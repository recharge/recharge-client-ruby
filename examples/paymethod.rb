# Examples for the Recharge API Gem
# Payment Method Resource

# Only 2 lines are required to get started:
# Require the recharge.rb file
require '../lib/recharge'

# Set your API key here, found in Recharge Settings > API Settings > API Private Key
# If incorrect or blank, any calls will raise a Response::NotAuthorized
Recharge.api_key = "92ec3e4d8b623dd9baaaf1575b7c557cd113e3e8"



# Create a new payment method (and securely store the card number) for a customer
puts "", "Create New PayMethod"

begin
  # paymethods can be created in one fell swoop
  paymethod = Recharge::PayMethod.create(
    :customer => "cu4f3782bf374a7",
    :nameOnCard => "test jones",
    :cardNumber => "4242424242424242",
    :expDate => "1212"
  )
  # after the charge is saved, all attributes are available for you individually or by inspecting
  paymethodID = paymethod.id
  puts ">> paymethod id: #{paymethod.id}"
  puts ">> card number: #{paymethod.cardType} ****#{paymethod.last4}"
  p paymethod
rescue Exception => e
  # if a required field is missing or invalid, a Response::BadRequest error will be raised
  # e.message will give more info why the record creation failed
  puts ">> error #{e.message}"
end



# deletes an existing paymethod and permanently deletes the stored credit card information
# paymethods cannot be deleted if they are currently being used by any recurring charges
#  as doing so will cause the charge to fail
puts "", "Delete PayMethod"

begin
  # just call destroy and pass the Paymethod ID to delete it
  Recharge::PayMethod.destroy(paymethodID)
rescue Exception => e
  # will raise Response::BadRequest if Paymethod can't be deleted
  # otherwise, delete was successful
  puts ">> error #{e.message}"
end