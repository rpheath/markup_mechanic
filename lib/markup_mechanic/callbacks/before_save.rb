module MarkupMechanic
  module Callbacks
    # this is the callback that fires on
    # before_save of a model that has the
    # repair_markup_for() call
    class BeforeSave
      attr_accessor :columns, :options, :adapter

      def initialize(columns, options)
        @columns = columns
        @options = options
        @adapter = MarkupMechanic.adapter
      end

      def before_save(record)
        self.columns.each do |column|          
          if record.respond_to?(column) && record.respond_to?("#{column}=")
            MarkupMechanic.log("Repairing #{record.class}::#{column}")

            # register a new mechanic for this column
            mechanic = self.adapter.new(record.send(column))

            # since custom adapters are supported, we must ensure that the
            # adapter responds to the `fix!` method, as expected
            raise MarkupMechanic::InvalidAdapterError unless mechanic.respond_to?(:fix!)
            
            # repair the HTML
            repaired_html = mechanic.fix!
            
            # update the record
            record.send("#{column}=", repaired_html)
          end
        end
      end
    end
  end
end