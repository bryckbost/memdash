module Memdash
  module Report
    def self.last
      Memdash.backend.last
    end
    
    def self.past_day
      Memdash.backend.past_day      
    end
  end
end
