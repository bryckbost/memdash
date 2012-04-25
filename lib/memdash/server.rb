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

      def hit_ratio(hits, misses)
        hits / (hits + misses)
      end

      def miss_ratio(hits, misses)
        1 - hit_ratio(hits, misses)
      end

      def miss_ratio_percentage(hits, misses)
        miss_ratio(hits, misses) * 100
      end
    end

    get "/" do
      @last_report = Memdash::ActiveRecord::Report.last
      past_day = Memdash::ActiveRecord::Report.past_day
      @gets = past_day.map{|report| report.stats.map{|k, v| v["cmd_get"].to_i} }.flatten
      @sets = past_day.map{|report| report.stats.map{|k, v| v["cmd_set"].to_i} }.flatten
      @hits = past_day.map{|report| report.stats.map{|k, v| v["get_hits"].to_i} }.flatten
      @misses = past_day.map{|report| report.stats.map{|k, v| v["get_misses"].to_i} }.flatten
      erb :overview, :layout => :application
    end
  end
end