require 'markup_mechanic/error'
require 'markup_mechanic/default_adapter'
require 'markup_mechanic/configuration'
require 'markup_mechanic/callbacks'
require 'markup_mechanic/base'

module MarkupMechanic
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    # accepts a list of columns for an ActiveRecord
    # model and fixes the HTML in a before_save callback
    def repair_markup_for(*columns)
      options = columns.extract_options!
      before_save MarkupMechanic::Callbacks::BeforeSave.new(columns, options)
    end
  end

  # mixins
  extend Base
  extend Configuration

  # debug mode sends output to the logs
  def self.debug_mode?
    self.debug_mode
  end
end

# hook into ActiveRecord
require 'markup_mechanic/active_record'