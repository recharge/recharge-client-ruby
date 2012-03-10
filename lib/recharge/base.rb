module Recharge
  class Base
    class << self
      def get(uri, apiKey=nil)
        client = Client.new()
        return client.request('GET', uri, nil, apiKey)
      end
      
      def post(uri, data=nil, apiKey=nil)
        client = Client.new()
        return client.request('POST', uri, data, apiKey)
      end
      
      def delete(uri, apiKey=nil)
        client = Client.new()
        return client.request('DELETE', uri, nil, apiKey)
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