require 'memdash/adapters/mongo_mapper/report'

module Memdash
  module Adapters
    module MongoMapper
      module Client
        def generate_stats
          Memdash::Adapters::MongoMapper::Report.create!(:stats => stats)
        end
      end
    end
  end
end

Dalli::Client.send(:include, Memdash::Adapters::MongoMapper::Client)
