require 'dalli'

module DalliHelpers
  def dalli
    @dalli ||= Dalli::Client.new('localhost:19122')
  end
end

RSpec.configure do |config|
  config.include DalliHelpers

  config.after do
    dalli.flush
  end
end
