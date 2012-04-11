module Memdash
  module Client
    def self.included(base)
      base.class_eval do
        alias_method :perform_without_stats, :perform
        alias_method :perform, :perform_with_stats
      end
    end

    def perform_with_stats(op, key, *args)
      ret = perform_without_stats(op, key, *args)
      resp = perform_without_stats(:get, 'memdash')
      if resp.nil? || resp == 'Not found'
        generate_stats
        perform_without_stats(:add, 'memdash', true, Memdash.ttl, nil)
      end
      ret
    end

    private

    def generate_stats
      raise NotImplementedError
    end
  end
end
