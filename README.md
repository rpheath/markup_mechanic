MarkupMechanic
==============

Malformed HTML be gone! When you allow users to enter raw HTML into a wide open
textarea, you're asking for trouble. Missing closing tags and tags closed in the 
wrong order can really make your layouts go bananas. This little library is an
attempt to repair those issues. Just leave it to the Markup Mechanic (thanks
to [Chris Scharf](http://github.com/scharfie) for the name).

# Installation

Just add `gem "markup_mechanic"` to your Gemfile.

Note: this gem is designed to use with Rails projects using ActiveRecord.

# Usage

It's rather simple to use. Once installed, just add one line to your model,
passing it the columns that you wish to repair.

    class Article < ActiveRecord::Base
      repair_markup_for :caption, :body
    end

Each time the record is saved, those columns will run through a parser (or, "mechanic")
that will repair the invalid HTML.

# Example

Let's say a user enters the following HTML into a textarea and saves it.

    <div><p>This is my <strong>HTML</div>

If the Markup Mechanic is involved, here's what will get saved:

    <div><p>This is my <strong>HTML</strong></p></div>

You never can be too safe when humans are involved!

# Custom Mechanic Adapters

Under the hood, we're really just relying on the amazing Nokogiri library to do
the dirty work. That's the default. But if you wanted to customize the behavior of
the mechanic, you can add your own custom adapter.

Two requirements:

1. Your class must be initialized to accept an HTML string
2. Your class must implement a `fix!` instance method

For example, in your Rails project, let's say in `config/initializers/markup_mechanic.rb`
you might do something like this:

    class MyAwesomeMechanic
      attr_reader :html

      def initialize(html)
        @html = html
      end

      def fix!
        # do your fancy work here
      end
    end

    MarkupMechanic.configure do |config|
      config.adapter = MyAwesomeMechanic
    end

That's really it. Now the `repair_markup_for` method will run those columns through
your custom parser instead.

# Credits

[Chris Scharf](http://github.com/scharfie) for the name and inspiration to package this up as a gem.

# License

Copyright (c) Ryan Heath

Published under the MIT License, see LICENSE