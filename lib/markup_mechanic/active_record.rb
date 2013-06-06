# mix the MarkupMechanic in with ActiveRecord
if defined?(::ActiveRecord::Base)
  ::ActiveRecord::Base.send(:include, MarkupMechanic)
end