require 'sinatra/base'
require 'erb'

module Memdash
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))
    set :views,         "#{dir}/server/views"
    set :public_folder, "#{dir}/server/public"

    get "/" do
      erb :overview, :layout => :application
    end
  end
end