module Memdash
  module Configuration
    DEFAULT_TTL = 60

    attr_writer :ttl
    attr_accessor :backend

    def ttl
      @ttl ||= DEFAULT_TTL
    end
  end
end
