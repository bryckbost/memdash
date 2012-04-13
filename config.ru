#!/usr/bin/env ruby
require 'logger'

require File.expand_path('../lib/memdash/server', __FILE__)

use Rack::ShowExceptions
run Memdash::Server.new
