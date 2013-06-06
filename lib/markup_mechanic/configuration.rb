module MarkupMechanic
  module Configuration
    attr_accessor :adapter, :logger, :debug_mode

    # set the defaults when the
    # Configuration module is extended
    def self.extended(base)
      base.reset!
    end

    # convenience method for configuration
    def configure
      yield self
    end

    # resets the options to the defaults
    def reset!
      self.adapter = MarkupMechanic::DefaultAdapter
      self.logger = Rails.logger
      self.debug_mode = Rails.env.development?
    end
  end
end