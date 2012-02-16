class Response
  def initialize(code, body)
    @code = code
    @body = body
  end
  def code
    @code
  end
  def body
    @body
  end
  
  class NotFound < StandardError
  end 
  
  class BadRequest < StandardError
  end  
  
  class NotAuthorized < StandardError
  end  

  def assertValidResponse
    case @code.to_i
    when 200
        return
    when 400
        raise BadRequest, Recharge::Base.returnErrorXML(@body)
    when 401
        raise NotAuthorized, Recharge::Base.returnErrorXML(@body)
    when 404
        raise NotFound, Recharge::Base.returnErrorXML(@body)
    end
  end
end