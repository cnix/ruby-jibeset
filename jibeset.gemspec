# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jibeset/version', __FILE__)

Gem::Specification.new do |s|
  s.add_development_dependency('ruby-debug19')
  s.add_development_dependency('geminabox')
  s.add_runtime_dependency('faraday', '>= 0.7')
  s.add_runtime_dependency('faraday_middleware')
  s.add_runtime_dependency('oauth2')
  s.add_runtime_dependency('multi_json')
  s.add_runtime_dependency('hashie', '>= 0.4.0')
  s.add_runtime_dependency('yajl-ruby')
  s.add_development_dependency('ruby-debug19')
  s.add_development_dependency('geminabox')
  s.add_development_dependency('minitest')
  s.authors = ["Claude Nix"]
  s.description = %q{A Ruby wrapper for the jibeset REST and Search APIs}
  s.email = ['claude@seadated.com']
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files = `git ls-files`.split("\n")
  s.homepage = 'https://github.com/cnix/ruby-jibeset'
  s.name = 'jibeset'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.required_rubygems_version = Gem::Requirement.new('>= 1.3.6') if s.respond_to? :required_rubygems_version=
  s.rubyforge_project = s.name
  s.summary = %q{Ruby wrapper for the jibeset API}
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Jibeset::VERSION.dup
end

