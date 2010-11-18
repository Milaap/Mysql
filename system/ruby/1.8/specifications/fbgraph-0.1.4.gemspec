# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fbgraph}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicolas Santa"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDODCCAiCgAwIBAgIBADANBgkqhkiG9w0BAQUFADBCMRQwEgYDVQQDDAtuaWNv\nbGFzNTVhcjEVMBMGCgmSJomT8ixkARkWBWdtYWlsMRMwEQYKCZImiZPyLGQBGRYD\nY29tMB4XDTEwMDUwNzE4MzUwOFoXDTExMDUwNzE4MzUwOFowQjEUMBIGA1UEAwwL\nbmljb2xhczU1YXIxFTATBgoJkiaJk/IsZAEZFgVnbWFpbDETMBEGCgmSJomT8ixk\nARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALfpoVqolklc\npq3fDlP4GETB6EOGpUPLEMH04GmcNJCaLj4yOBBSMX0pJyjyMo8LRm+8q8LW0JmF\nBpCOKJCNZC8bic9Y6T+Ja9Rue3en4laRr/gtAeW50Lyigf7tlUTgFQ0z3H44U1IL\nyoYX7FgBC2BuqzUgsjLnX7fFZDvH+GlX/ChwId0TBOwHlvmjkzvmNJvc8zaetl7n\nPwjdh+nVIUF70Tre+HK+T5IQ8bkGZxUWgByS3LYAHz/fD/wpEYwb3iYIv7VFEzJd\nGOL4WjTxCoadloV2Ux4hAn9cMarzPTAHPBddTAWCHcK00XZy00LExCDDFmIXfvT/\n80P8PNIj0hkCAwEAAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0O\nBBYEFKVi3eog182/K7f7sJVRe4An94CJMA0GCSqGSIb3DQEBBQUAA4IBAQBbCScY\nLVggsBMv5vHdywZV5oUW8g421NM7m2kEJZzmUtj9e2xXe2eN9snvwzynT+SjJvjk\n4KlJOde2A6d4UUAlMfjjGOiSe/iENjC0ckMOS53ZsUFVr+BuY1ZF2YoMmd2UmyjP\nEp+kyPuRJhvNh4wYJF/q1XN8pHI8kfde/nUia1HzuENyvfL9UBtz/WJHXO1S1iDX\nFh4Xb6VBGNc0UolB6qVyK9+B73zWtHhkIbpm01Qs6udTRKT1fkyr+Q+s5d6YXANn\nt9TrnoR25hfiEkK0T2TVSJ5ULXUdp970cmXugmPG84hcwFrfrEFmqBbILdIdc/E1\nurUszHKBS/vEBMuC\n-----END CERTIFICATE-----\n"]
  s.date = %q{2010-08-20}
  s.description = %q{A Gem for Facebook Open Graph API}
  s.email = %q{nicolas55ar@gmail.com}
  s.extra_rdoc_files = ["README", "README.textile", "TODO.list", "lib/fbgraph.rb", "lib/fbgraph/authorization.rb", "lib/fbgraph/base.rb", "lib/fbgraph/client.rb", "lib/fbgraph/realtime.rb", "lib/fbgraph/search.rb", "lib/fbgraph/selection.rb"]
  s.files = ["Manifest", "README", "README.textile", "Rakefile", "TODO.list", "lib/fbgraph.rb", "lib/fbgraph/authorization.rb", "lib/fbgraph/base.rb", "lib/fbgraph/client.rb", "lib/fbgraph/realtime.rb", "lib/fbgraph/search.rb", "lib/fbgraph/selection.rb", "specs/lib/fbauth/authorization_spec.rb", "specs/lib/fbauth/base_spec.rb", "specs/lib/fbauth/client_spec.rb", "specs/lib/fbauth/realtime_spec.rb", "specs/lib/fbauth/search_spec.rb", "specs/lib/fbauth/selection_spec.rb", "specs/spec_helper.rb", "fbgraph.gemspec"]
  s.homepage = %q{http://github.com/nsanta/fbgraph}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Fbgraph", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{fbgraph}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Gem for Facebook Open Graph API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth2>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<oauth2>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<hashie>, [">= 0"])
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth2>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<hashie>, [">= 0"])
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
