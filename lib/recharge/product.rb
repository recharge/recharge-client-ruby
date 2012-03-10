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
    def self.find_all (apiKey=nil)
      responseXML = Recharge::Base.get('products', apiKey)
      parse(responseXML.to_s)
    end
    def self.find (id, apiKey=nil)
      responseXML = Recharge::Base.get('products/'+id, apiKey)
      parse(responseXML.to_s)
    end
    def self.create (attributes = {}, apiKey=nil)
      responseXML = Recharge::Base.post('products', attributes, apiKey)
      parse(responseXML.to_s)
    end
    def update (attributes = {}, apiKey=nil)
      responseXML = Recharge::Base.post('products/'+self.id, attributes, apiKey)
      Product.parse(responseXML.to_s)
    end
    def destroy (apiKey=nil)
      responseXML = Recharge::Base.delete('products/'+self.id, apiKey)
    end
  end
end