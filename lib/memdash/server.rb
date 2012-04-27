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

      def hit_ratio_percentage(hits, misses)
        hit_ratio(hits, misses) * 100
      end
    end

    get "/" do
      @last_report = Memdash::ActiveRecord::Report.last
      past_day = Memdash::ActiveRecord::Report.past_day
      @gets = past_day.flat_map{|report| report.stats.map{|_, v| [report.created_at.strftime("%m-%d-%Y %I:%M%p"), v["cmd_get"].to_i]}}
      @sets = past_day.flat_map{|report| report.stats.map{|_, v| [report.created_at.strftime("%m-%d-%Y %I:%M%p"), v["cmd_set"].to_i]}}
      @hits = past_day.flat_map{|report| report.stats.map{|_, v| [report.created_at.strftime("%m-%d-%Y %I:%M%p"), v["get_hits"].to_i]}}
      @misses = past_day.flat_map{|report| report.stats.map{|_, v| [report.created_at.strftime("%m-%d-%Y %I:%M%p"), v["get_misses"].to_i]}}
      @delete_hits = past_day.flat_map{|report| report.stats.map{|_, v| [report.created_at.strftime("%m-%d-%Y %I:%M%p"), v["delete_hits"].to_i]}}
      @delete_misses = past_day.flat_map{|report| report.stats.map{|_, v| [report.created_at.strftime("%m-%d-%Y %I:%M%p"), v["delete_misses"].to_i]}}
      @engine_maxbytes = past_day.flat_map{|report| report.stats.map{|_, v| [report.created_at.strftime("%m-%d-%Y %I:%M%p"), (v["engine_maxbytes"].to_i / 1024.0 / 1024.0).round(2)]}}
      @bytes = past_day.flat_map{|report| report.stats.map{|_, v| [report.created_at.strftime("%m-%d-%Y %I:%M%p"), (v["bytes"].to_i / 1024.0 / 1024.0).round(2)]}}
      @current_items = past_day.flat_map{|report| report.stats.map{|_, v| [report.created_at.strftime("%m-%d-%Y %I:%M%p"), v["curr_items"].to_i]}}
      @evictions = past_day.flat_map{|report| report.stats.map{|_, v| [report.created_at.strftime("%m-%d-%Y %I:%M%p"), v["evictions"].to_i]}}
      erb :overview, :layout => :application
    end
  end
end