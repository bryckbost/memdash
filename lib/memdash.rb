require "dalli"

module Memdash
  def self.included(base)
    base.class_eval do
      alias_method :perform_without_stats, :perform
      alias_method :perform, :perform_with_stats
    end
  end

  def perform_with_stats(op, key, *args)
    result = perform_without_stats(op, key, *args)
    generate_stats(op, key, *args)
    result
  end

  def generate_stats(op, key, *args)
    val = perform_without_stats(:get, "memdash")
    if val.nil?
      perform_without_stats(:add, "memdash", "BAM", 3, {})
    end

    puts [op, key, args].inspect
  end
end

Dalli::Client.send(:include, Memdash)
