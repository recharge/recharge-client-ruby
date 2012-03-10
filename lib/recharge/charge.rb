module Recharge
  class Charge
    include HappyMapper
    
    tag 'charge'
  
    element :id, String
    element :product, String
    element :payMethod, String
    element :billingStartDate, String
    element :billingEndDate, String
    element :billingEndAmount, String
    element :price, String
    element :intervalValue, String
    element :intervalUnit, String
    element :nextChargeDate, String
    element :totalRevenue, String
    element :pubID, String
    element :oneTime, String
    element :error, String
    
    def initialize(id='')
      @id = id
    end
    def self.find_all (apiKey=nil)
      responseXML = Recharge::Base.get('charges', apiKey)
      parse(responseXML.to_s)
    end
    def self.find (id, apiKey=nil)
      responseXML = Recharge::Base.get('charges/'+id, apiKey)
      parse(responseXML.to_s)
    end
    def self.create (attributes = {}, apiKey=nil)
      responseXML = Recharge::Base.post('charges', attributes, apiKey)
      parse(responseXML.to_s)
    end
    def update (attributes = {}, apiKey=nil)
      responseXML = Recharge::Base.post('charges/'+self.id, attributes, apiKey)
      Charge.parse(responseXML.to_s)
    end
    def destroy (apiKey=nil)
      responseXML = Recharge::Base.delete('charges/'+self.id, apiKey)
    end
  end
end