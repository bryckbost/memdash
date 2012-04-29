require 'memdash/adapters/mongo_mapper'
require 'mongo_mapper'

MongoMapper.connection = Mongo::Connection.new
MongoMapper.database = 'memdash_test'

module MongoMapperHelpers
  def reports_count
    Memdash::Adapters::MongoMapper::Report.count
  end
end

RSpec.configure do |config|
  config.include MongoMapperHelpers
end
