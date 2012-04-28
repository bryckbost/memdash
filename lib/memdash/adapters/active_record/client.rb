require 'memdash/active_record/report'

module Memdash
  module ActiveRecord
    module Client
      def generate_stats
        Memdash::ActiveRecord::Report.create!(:stats => stats)
      end
    end
  end
end

Dalli::Client.send(:include, Memdash::ActiveRecord::Client)
