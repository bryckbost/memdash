require 'memdash/adapters/mongoid'
require 'mongoid'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("memdash_test")
end

module MongoidHelpers
  def reports_count
    Memdash::Adapters::Mongoid::Report.count
  end
end

RSpec.configure do |config|
  config.include MongoidHelpers
end
