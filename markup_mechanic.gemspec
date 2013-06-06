Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = "1.3.5"

  s.name = "markup_mechanic"
  s.version = "0.1.0"
  s.date = "2013-06-05"
  s.rubyforge_project = "markup_mechanic"

  s.summary = "Repairs invalid HTML markup"
  s.description = "For use in Rails projects that will correct invalid HTML entered by users"

  s.authors  = ["Ryan Heath"]
  s.email    = "ryan@rpheath.com"
  s.homepage = "http://github.com/rpheath/markup_mechanic"

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  s.add_dependency("nokogiri", ["~> 1.5"])

  # = MANIFEST =
  s.files = %w[
    Gemfile
    LICENSE
    README.md
    Rakefile
    lib/markup_mechanic.rb
    lib/markup_mechanic/active_record.rb
    lib/markup_mechanic/base.rb
    lib/markup_mechanic/callbacks.rb
    lib/markup_mechanic/callbacks/before_save.rb
    lib/markup_mechanic/configuration.rb
    lib/markup_mechanic/default_adapter.rb
    lib/markup_mechanic/error.rb
    lib/markup_mechanic/version.rb
    markup_mechanic.gemspec
    test/markup_mechanic_test.rb
    test/test_helper.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/.*_test\.rb/ }
end