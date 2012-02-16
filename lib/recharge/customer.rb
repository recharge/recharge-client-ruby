module Recharge
  class Customer
    include HappyMapper
    
    tag 'customer'
  
    element :id, String
    element :refID, String
    element :firstName, String
    element :lastName, String
    element :email, String
    element :company, String
    element :phone, String
    element :billingAddress1, String
    element :billingAddress2, String
    element :billingCity, String
    element :billingState, String
    element :billingZIP, String
    element :shippingAddress1, String
    element :shippingAddress2, String
    element :shippingCity, String
    element :shippingState, String
    element :shippingZIP, String
    element :emailOption, String
    element :signupDate, String
    
    has_many :payMethods, PayMethod
    has_many :charges, Charge
    
    def initialize(id='')
      @id = id
    end
    def self.find_all
      responseXML = Recharge::Base.get('customers')
      parse(responseXML.to_s)
    end
    def self.find (id)
      responseXML = Recharge::Base.get('customers/'+id)
      parse(responseXML.to_s)
    end
    def self.create (attributes = {})
      responseXML = Recharge::Base.post('customers', attributes)
      parse(responseXML.to_s)
    end
    def update (attributes = {})
      responseXML = Recharge::Base.post('customers/'+self.id, attributes)
      Customer.parse(responseXML.to_s)
    end
    def destroy
      responseXML = Recharge::Base.delete('customers/'+self.id)
    end
  end
end