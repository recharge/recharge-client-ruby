require '../lib/recharge'

Recharge.api_key = "92ec3e4d8b623dd9baaaf1575b7c557cd113e3e8"

puts "", "Credit Card Purchase"

begin
  transaction = Recharge::Transaction.purchase(
    :Amount => "#{rand(100)}.#{rand(100)}",
    :AcctNum => "4242424242424242",
    :ExpDate => "1212"
  )
puts transaction.responseDescription, transaction.amount, transaction.approvalCode
p transaction

transactionID = transaction.transactionID
rescue Exception => e
  puts ">> error #{e.message}"
end






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






puts "", "Credit Card Refund (without card number)"

begin
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

