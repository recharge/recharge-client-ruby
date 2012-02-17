module Recharge
  require 'happymapper'
  
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
end