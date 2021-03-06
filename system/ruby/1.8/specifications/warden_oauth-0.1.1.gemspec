# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{warden_oauth}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roman Gonzalez"]
  s.date = %q{2010-02-01}
  s.description = %q{ 
      warden_oauth will help you create oauth authentication strategies using the oauth
      helper method on the Warden::Manager config setup
    }
  s.email = %q{romanandreg@gmail.com}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = [".document", ".gitignore", "CHANGELOG", "LICENSE", "README.rdoc", "Rakefile", "VERSION", "examples/twitter/application.rb", "lib/warden_oauth.rb", "lib/warden_oauth/base.rb", "lib/warden_oauth/config.rb", "lib/warden_oauth/config_extension.rb", "lib/warden_oauth/errors.rb", "lib/warden_oauth/strategy.rb", "lib/warden_oauth/strategy_builder.rb", "lib/warden_oauth/utils.rb", "spec/application_runner.rb", "spec/application_scenario.rb", "spec/fixtures/authorize_request_token.txt", "spec/fixtures/unauthorized_request_token.txt", "spec/spec.opts", "spec/spec_helper.rb", "spec/warden_oauth/config_extension_spec.rb", "spec/warden_oauth/strategy_spec.rb", "warden_oauth.gemspec"]
  s.homepage = %q{http://github.com/roman/warden_oauth}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{warden_oauth}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{OAuth Strategy generator for Warden Authentication Framework}
  s.test_files = ["spec/application_runner.rb", "spec/application_scenario.rb", "spec/spec_helper.rb", "spec/warden_oauth/config_extension_spec.rb", "spec/warden_oauth/strategy_spec.rb", "examples/twitter/application.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<warden>, [">= 0.8.1"])
      s.add_runtime_dependency(%q<oauth>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<warden>, [">= 0.8.1"])
      s.add_dependency(%q<oauth>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<warden>, [">= 0.8.1"])
    s.add_dependency(%q<oauth>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
