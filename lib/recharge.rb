module Recharge
  require File.dirname(__FILE__) + '/happymapper'
  
  require File.dirname(__FILE__) + '/recharge/base'
  require File.dirname(__FILE__) + '/recharge/paymethod'
  require File.dirname(__FILE__) + '/recharge/charge'
  require File.dirname(__FILE__) + '/recharge/customer'
  require File.dirname(__FILE__) + '/recharge/product'
  require File.dirname(__FILE__) + '/recharge/transaction'
  require File.dirname(__FILE__) + '/recharge/client'
  require File.dirname(__FILE__) + '/recharge/response'
  
  class << self
    def api_key
      defined? @api_key and @api_key
    end
    attr_writer :api_key
  end
  
  def get(uri)
    client = Client.new()
    return client.request('GET', uri)
  end
  
  def post(uri, data=nil)
    client = Client.new()
    return client.request('POST', uri, data)
  end
  
  def delete(uri)
    client = Client.new()
    return client.request('DELETE', uri)
  end
  
  def returnImportantXML(data)
    require "rexml/document"
    doc = REXML::Document.new(data)
    
    if doc.elements[1].elements[3].length == 1
      return doc.elements[1].elements[3].elements[1]
    else 
      return doc.elements[1].elements[3]
    end
  end
  
  def returnErrorXML(data)
    require "rexml/document"
    doc = REXML::Document.new(data)
    
    doc.elements["/response/result/resultDescription"].text
  end
  
  def returnStatusXML(data)
    require "rexml/document"
    doc = REXML::Document.new(data)
    
    doc.elements["/response/result/resultDescription"]
  end 
end