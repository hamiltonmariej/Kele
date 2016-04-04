#coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
   s.name          = 'kele'
   s.version       = '0.0.1'
   s.summary       = 'Kele API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Jeannine Hamilton']
   s.email         = 'jeannine.hamilton@gmail.com'
   s.files         = `git ls-files`.split($/).reject { |f| f.match(%r{^(test|spec|lib)/}) }
   s.require_paths = ["lib"]
   s.homepage      =
     'http://rubygems.org/gems/kele'
   s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'
   s.add_runtime_dependency 'json', '~>1.8'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

   s.add_development_dependency 'bundler', "~>1.11"
   s.add_development_dependency 'rake', '~>10.0'
   s.add_development_dependency 'rspec', '~>3.0'
   s.add_development_dependency 'webmock', '~>1.24'
 end
