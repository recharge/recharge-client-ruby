# Examples for the Recharge API Gem
# Transaction Resource
# Lets you easily perform one-time credit card charges

# Only 2 lines are required to get started:
# Require the recharge.rb file
require '../lib/recharge'

# Set your API key here, found in Recharge Settings > API Settings > API Private Key
# If incorrect or blank, any calls will raise a Response::NotAuthorized
Recharge.api_key = "92ec3e4d8b623dd9baaaf1575b7c557cd113e3e8"



# charges a credit card
puts "", "Credit Card Purchase"

begin
  # only :Amount, :AcctNum and :ExpDate are required
  # other values are allowed such as CVV2 and ZIP code
  # check API docs for more info
  # https://www.rechargebilling.com/api
  transaction = Recharge::Transaction.purchase(
    :Amount => "#{rand(100)}.#{rand(100)}",
    :AcctNum => "4242424242424242",
    :ExpDate => "1212"
  )
  
  # after transaction is processed attributes are available individually
  puts transaction.responseDescription, transaction.amount, transaction.approvalCode
  
  # ...or by inspecting
  p transaction
  
  transactionID = transaction.transactionID
rescue Exception => e
  puts ">> error #{e.message}"
end





# refunds money back to a credit card using the card number and expiration date
puts "", "Credit Card Refund (with card number)"

begin
  transaction = Recharge::Transaction.refund(
    :Amount => "#{rand(100)}.#{rand(100)}",
    :AcctNum => "4111111111111111",
    :ExpDate => "1212"
  )
puts transaction.responseDescription, transaction.amount, transaction.approvalCode
p transaction
rescue Exception => e
  puts ">> error #{e.message}"
end





# refunds money back to a credit card using the original transactionID
puts "", "Credit Card Refund (without card number)"

begin
  # amount is required
  #  amounts above the original purchase price for the transactionID given are sometimes rejected by the payment gateway
  transaction = Recharge::Transaction.refund(
    :TransactionID => transactionID,
    :Amount => "0.#{rand(100)}"
  )
puts transaction.responseDescription, transaction.amount, transaction.approvalCode
p transaction

transactionID = transaction.transactionID
rescue Exception => e
  puts ">> error #{e.message}"
end





# voids a previously processed sale or refund
#  it is only possible to void transactions in the current batch...once the batch settles, the money will be taken off the card
#   and put into your bank account. You will need to process a refund.
#  batches usually settle once a day around 2AM PST
puts "", "Credit Card Void"

begin
  transaction = Recharge::Transaction.void(
    :TransactionID => transactionID
  )
puts transaction.responseDescription, transaction.amount, transaction.approvalCode
p transaction
rescue Exception => e
  puts ">> error #{e.message}"
end

