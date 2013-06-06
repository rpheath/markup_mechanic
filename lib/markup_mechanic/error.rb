module MarkupMechanic
  class Error < StandardError; end

  # raised if the adapter isntance doesn't accept
  # an HTML string on initialization or there's
  # no `fix!` method on the object
  class InvalidAdapterError < Error
    def initialize(message = "needs initialized with a string of HTML, and must respond to a fix! method")
      super(message)
    end
  end
end