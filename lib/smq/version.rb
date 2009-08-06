module SMQ
  
  module Version
    
    MAJOR = 0
    MINOR = 0
    TINY  = 0
    
    STRING = [MAJOR, MINOR, TINY].join('.')
    
  end
  
  NAME = "SMQ".freeze
  SERVER  = "#{NAME} #{Version::STRING}".freeze
  
end
