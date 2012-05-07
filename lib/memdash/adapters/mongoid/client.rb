require 'memdash/adapters/mongoid/report'

module Memdash
  module Adapters
    module Mongoid
      module Client
        def generate_stats
          Memdash::Adapters::Mongoid::Report.create(:stats => stats)
        end
      end
    end
  end
end

Dalli::Client.send(:include, Memdash::Adapters::Mongoid::Client)
