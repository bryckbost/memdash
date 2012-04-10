require 'memdash/client'
require 'memdash/configuration'
require 'dalli'

module Memdash
  extend Memdash::Configuration
end

Dalli::Client.send(:include, Memdash::Client)
