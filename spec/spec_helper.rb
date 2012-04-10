# TODO Load and unload particular backends for backend-specific tests
require 'memdash/active_record'

Dir[File.expand_path('../support/*.rb', __FILE__)].each{|f| require f }
