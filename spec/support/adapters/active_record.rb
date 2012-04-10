require 'memdash/active_record'

module ActiveRecordHelpers
  def reports_count
    Memdash::ActiveRecord::Report.count
  end
end

RSpec.configure do |config|
  config.include ActiveRecordHelpers
end
