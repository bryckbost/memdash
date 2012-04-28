require 'active_record'

module Memdash
  module Adapters
    module ActiveRecord
      class Report < ::ActiveRecord::Base
        self.table_name = :memdash_reports

        serialize :stats

        def self.past_day
          where('created_at >= :time', :time => Time.current - 1.day)
        end
      end
    end
  end
end
