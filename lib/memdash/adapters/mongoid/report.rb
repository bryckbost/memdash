require 'mongoid'

module Memdash
  module Adapters
    module Mongoid
      class Report
        include ::Mongoid::Document
        include ::Mongoid::Timestamps
        self.collection_name = "memdash_reports"

        field :stats, :type => Hash

        def self.past_day
          where(:created_at.gte => Time.current - 1.day)
        end
      end
    end
  end
end
