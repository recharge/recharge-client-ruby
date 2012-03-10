Gem::Specification.new do |s|
  s.name        = 'Recharge'
  s.version     = '1.1.4'
  s.date        = '2012-02-17'
  s.summary     = "Recharge API Client"
  s.description = "An API client library for Recharge http://rechargebilling.com"
  s.authors    =  "Recharge"
  s.email       = "help@rechargebilling.com"
  s.files       =  Dir['{lib,examples}/**/*']
  s.homepage    = "http://rechargebilling.com/api"
  
  s.add_dependency('happymapper', '>= 0.4.0')
end

