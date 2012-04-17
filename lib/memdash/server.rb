require 'sinatra/base'
require 'erb'
require 'memdash/active_record'

module Memdash
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))
    set :views,         "#{dir}/server/views"
    set :public_folder, "#{dir}/server/public"

    helpers do
      include Rack::Utils
      alias_method :h, :escape_html

      def url_path(*path_parts)
        [path_prefix, path_parts].join("/").squeeze('/')
      end
      alias_method :u, :url_path

      def path_prefix
        request.env['SCRIPT_NAME']
      end
    end

    get "/" do
      @last_report = Memdash::ActiveRecord::Report.last
      erb :overview, :layout => :application
    end
  end
end