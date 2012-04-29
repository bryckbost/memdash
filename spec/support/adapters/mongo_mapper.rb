require 'memdash/adapters/mongo_mapper'

module MongoMapperHelpers
  def reports_count
    Memdash::Adapters::MongoMapper::Report.count
  end
end

RSpec.configure do |config|
  config.include MongoMapperHelpers
end
