class Client
  
  class NotAuthorized < StandardError
  end  
  
  def baseURL
    "https://www.rechargebilling.com/API/v2/"
  end
  
  def request(method, uri, data=nil, apiKey=nil)
    response = sendRequest(method, uri, data, apiKey)
    response.assertValidResponse
    if response.code.to_i == 200
      if method != "DELETE"
        Recharge::Base.returnImportantXML(response.body)
      else
        Recharge::Base.returnStatusXML(response.body)
      end
    else 
      Recharge::Base.returnErrorXML(response.body)
    end
    
  end
  
  def sendRequest(method, uri, data=nil, apiKey=nil)
    require "net/https"
    require "uri"
    
    if !Recharge.api_key
      if !apiKey
        raise NotAuthorized, "No API Key"
        return
      end
    else
      if !apiKey
        apiKey = Recharge.api_key
      end
    end
    
    uri = baseURL+uri
    uri = URI.parse(uri)
    
    if method == "GET"
      request = Net::HTTP::Get.new(uri.request_uri)
    end
    
    if method == "POST"
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data(data)
    end
    
    if method == "DELETE"
      request = Net::HTTP::Delete.new(uri.request_uri)
    end
    
    request.basic_auth(apiKey, "")
    
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    response = http.request(request)
    
    return Response.new(response.code, response.body)

  end
end