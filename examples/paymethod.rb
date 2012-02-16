require '../lib/recharge'

Recharge.api_key = "92ec3e4d8b623dd9baaaf1575b7c557cd113e3e8"

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