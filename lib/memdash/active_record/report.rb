require 'active_record'

module Memdash
  module ActiveRecord
    class Report < ::ActiveRecord::Base
      self.table_name = :memdash_reports

      serialize :stats
    end
  end
end
