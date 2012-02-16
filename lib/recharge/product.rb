module Recharge
  class Product
    include HappyMapper
    
    tag 'product'
  
    element :id, String
    element :name, String
    element :setupFee, String
    element :price, String
    element :intervalValue, String
    element :intervalUnit, String
    
    def initialize(id='')
      @id = id
    end
    def self.find_all
      responseXML = Recharge::Base.get('products')
      parse(responseXML.to_s)
    end
    def self.find (id)
      responseXML = Recharge::Base.get('products/'+id)
      parse(responseXML.to_s)
    end
    def self.create (attributes = {})
      responseXML = Recharge::Base.post('products', attributes)
      parse(responseXML.to_s)
    end
    def update (attributes = {})
      responseXML = Recharge::Base.post('products/'+self.id, attributes)
      Product.parse(responseXML.to_s)
    end
    def destroy (attributes = {})
      responseXML = Recharge::Base.delete('products/'+self.id)
    end
  end
end