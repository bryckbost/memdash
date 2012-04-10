require "dalli"
require "memdash/report"

module Memdash
  DEFAULT_TTL = 60

  def self.included(base)
    base.class_eval do
      class << base
        attr_accessor :memdash_ttl
      end
      self.memdash_ttl = DEFAULT_TTL

      alias_method :perform_without_stats, :perform
      alias_method :perform, :perform_with_stats
    end
  end

  def perform_with_stats(op, key, *args)
    ret = perform_without_stats(op, key, *args)
    resp = perform_without_stats(:get, 'memdash')
    if !resp || resp == 'Not found'
      generate_stats
      perform_without_stats(:add, 'memdash', '1', self.class.memdash_ttl, nil)
    end
    ret
  end

  def generate_stats
    Memdash::Report.create!(:stats => stats)
  end
end

Dalli::Client.send(:include, Memdash)
