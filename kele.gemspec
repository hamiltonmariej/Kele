Gem::Specification.new do |s|
   s.name          = 'kele'
   s.version       = '0.0.1'
   s.date          = '2016-17-03'
   s.summary       = 'Kele API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Jeannine Hamilton']
   s.email         = 'jeannine.hamilton@gmail.com'
   s.files         = `git ls-files`.split($/)
   s.require_paths = ["lib"]
   s.homepage      =
     'http://rubygems.org/gems/kele'
   s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'

   s.add_development_dependency 'bundler', '~> 1.11'
   s.add_development_dependency 'rake', '~>11.0'
 end
