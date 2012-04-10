require 'active_record'

module Memdash
  class Report < ActiveRecord::Base
    self.table_name = :memdash_reports

    serialize :stats
  end
end
