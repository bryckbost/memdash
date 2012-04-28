require 'memdash/adapters/active_record'

module ActiveRecordHelpers
  def reports_count
    Memdash::Adapters::ActiveRecord::Report.count
  end
end

RSpec.configure do |config|
  config.include ActiveRecordHelpers
end
