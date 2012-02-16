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
    def self.find_all
      responseXML = Recharge::Base.get('charges')
      parse(responseXML.to_s)
    end
    def self.find (id)
      responseXML = Recharge::Base.get('charges/'+id)
      parse(responseXML.to_s)
    end
    def self.create (attributes = {})
      responseXML = Recharge::Base.post('charges', attributes)
      parse(responseXML.to_s)
    end
    def update (attributes = {})
      responseXML = Recharge::Base.post('charges/'+self.id, attributes)
      Charge.parse(responseXML.to_s)
    end
    def destroy
      responseXML = Recharge::Base.delete('charges/'+self.id)
    end
  end
end