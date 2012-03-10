module Recharge
  class PayMethod
    include HappyMapper
    
    tag 'payMethod'
    
    element :id, String
    element :alias, String
    element :cardType, String
    element :last4, String
    element :expDate, String
    element :nameOnCard, String
    element :error, String
  
    def self.create (attributes = {}, apiKey=nil)
      responseXML = Recharge::Base.post('paymethods', attributes, apiKey)
      parse(responseXML.to_s)
    end
    def self.destroy (id, apiKey=nil)
      responseXML = Recharge::Base.delete('paymethods/'+id, apiKey)
    end
  end
end