module MarkupMechanic
  class DefaultAdapter
    attr_reader :html

    def initialize(html)
      @html = html.to_s
    end

    # use the magic that is Nokogiri to parse
    # and fix the HTML fragment
    def fix!
      fragment = Nokogiri::HTML.fragment(self.html)
      fragment.to_html
    end
  end
end