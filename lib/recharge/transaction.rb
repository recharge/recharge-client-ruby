module Recharge
  class Transaction
    include HappyMapper
    
    tag 'transaction'
  
    element :responseDescription, String
    element :transactionID, String
    element :amount, String
    element :cardType, String
    element :maskedAcctNum, String
    element :expDate, String
    element :processorResponse, String
    element :batchNum, String
    element :batchAmount, String
    element :approvalCode, String
    
    def self.purchase (attributes = {})
      responseXML = Recharge::Base.post('purchase', attributes)
      parse(responseXML.to_s)
    end
    def self.refund (attributes = {})
      responseXML = Recharge::Base.post('return', attributes)
      parse(responseXML.to_s)
    end
    def self.void (attributes = {})
      responseXML = Recharge::Base.post('void', attributes)
      parse(responseXML.to_s)
    end
  end
end