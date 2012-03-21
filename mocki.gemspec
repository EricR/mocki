lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bundler/version'

Gem::Specification.new do |s|
  s.name        = "mocki"
  s.version     = "1.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Eric Rafaloff"]
  s.email       = ["hello@ericrafaloff.com"]
  s.homepage    = "http://github.com/ericr/mocki"
  s.summary     = "A micro library for mocking up APIs with Sinatra."
  s.description = "A micro library for mocking up APIs with Sinatra."
  s.files        = Dir.glob("{lib}/**/*") + %w(README.markdown)
  s.require_path = 'lib'
end

