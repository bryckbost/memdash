require 'mongo_mapper'

module Memdash
  module Adapters
    module MongoMapper
      class Report
        include ::MongoMapper::Document
        set_collection_name "memdash_reports"

        key :stats, Hash
        timestamps!

        def self.past_day
          where(:created_at.gte => Time.current - 1.day)
        end
      end
    end
  end
end
