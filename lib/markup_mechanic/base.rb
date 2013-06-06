require 'markup_mechanic/version'

module MarkupMechanic
  module Base
    def version
      VERSION
    end

    # wrapper for logging, highlights the section for easier viewing
    def log(message)
      if logger.present? && MarkupMechanic.debug_mode?
        logger.info("--- Markup Mechanic (v#{MarkupMechanic.version}) ---")
        logger.info(message)
        logger.info("----------------------------------------------------")
      end
    end
  end
end