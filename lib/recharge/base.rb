module Recharge
  class Base
    class << self
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
  end
end