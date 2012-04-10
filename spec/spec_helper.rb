require "support/adapters/#{ENV['ADAPTER']}" if ENV['ADAPTER']

Dir[File.expand_path('../support/*.rb', __FILE__)].each{|f| require f }
