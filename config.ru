#!/usr/bin/env ruby
require 'logger'
require 'memdash/server'

use Rack::ShowExceptions
run Memdash::Server.new
