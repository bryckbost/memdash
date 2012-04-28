require 'memdash/adapters/active_record/report'

module Memdash
  module Adapters
    module ActiveRecord
      module Client
        def generate_stats
          Memdash::Adapters::ActiveRecord::Report.create!(:stats => stats)
        end
      end
    end
  end
end

Dalli::Client.send(:include, Memdash::Adapters::ActiveRecord::Client)
