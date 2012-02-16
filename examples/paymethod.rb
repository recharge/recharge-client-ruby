# Examples for the Recharge API Gem
# Payment Method Resource

# Only 2 lines are required to get started:
# Require the recharge.rb file
require '../lib/recharge'

# Set your API key here, found in Recharge Settings > API Settings > API Private Key
# If incorrect or blank, any calls will raise a Response::NotAuthorized
Recharge.api_key = "92ec3e4d8b623dd9baaaf1575b7c557cd113e3e8"








# Find an individual charge by the charge ID
puts "", "Create New PayMethod"

begin
  paymethod = Recharge::PayMethod.create(
    :customer => "cu4f3782bf374a7",
    :nameOnCard => "test jones",
    :cardNumber => "4242424242424242",
    :expDate => "1212"
  )
  paymethodID = paymethod.id
  puts ">> paymethod id: #{paymethod.id}"
  puts ">> card number: #{paymethod.cardType} ****#{paymethod.last4}"
  p paymethod
rescue Exception => e
  puts ">> error #{e.message}"
end



puts "", "Delete PayMethod"

begin
  Recharge::PayMethod.destroy(paymethodID)
rescue Exception => e
  puts ">> error #{e.message}"
end